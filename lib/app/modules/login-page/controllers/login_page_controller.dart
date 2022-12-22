import 'package:akm/app/common/constant.dart';
import 'package:akm/app/data/provider/auth/auth.provider.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initSharedPref();
  }

  void initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('pernahLogin');

    pernahLogin.value = isLogin ?? false;
  }

  late Rx<User?> firebaseUser;

  static LoginPageController instance = Get.find();

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, setInitialScreen);
  }

  void setInitialScreen(User? user) async {
    if (user == null) {
      debugPrint('User is currently signed out!');
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } else {
      // if user email and display name is null from firebase then route to intro page
      if (auth.currentUser?.email == null ||
          auth.currentUser?.email == '' &&
              auth.currentUser?.displayName == null ||
          auth.currentUser?.displayName == '') {
        debugPrint('User is signed in! but email and display name is null');
        Get.offAllNamed(Routes.INTRO_SCREEN);
      } else {
        // Check user custom claims
        final claims = await auth.currentUser!.getIdTokenResult();

        // If user is analis then route to analis page
        if (claims.claims!['analis'] == true &&
            claims.claims!['admin'] == false &&
            claims.claims!['reviewer'] == false &&
            claims.claims!['pengutus'] == false) {
          debugPrint('User is signed in! and is analis only');
          Get.offAllNamed(Routes.HOME);
        } else if (claims.claims!['analis'] == false &&
            claims.claims!['admin'] == false &&
            claims.claims!['reviewer'] == true &&
            claims.claims!['pengutus'] == false) {
          debugPrint('User is signed in! and is reviewer only');
          Get.offAllNamed(Routes.HOME_REVIEWER);
        } else {
          // check shared preferences if user already login
          final prefs = await SharedPreferences.getInstance();

          // if user already login then route to dashboard page
          if (prefs.getString('role') == 'analis') {
            debugPrint('User is signed in! and already choose analis role');
            Get.offAllNamed(Routes.HOME);
          } else if (prefs.getString('role') == 'reviewer') {
            debugPrint('User is signed in! and already choose reviewer role');
            Get.offAllNamed(Routes.HOME_REVIEWER);
          }

          // If user is not analis then route to dashboard page

        }
      }
    }
  }

  final formKey = GlobalKey<FormBuilderState>();

  var email = TextEditingController();
  var password = TextEditingController();

  final isLoginProcessing = false.obs;
  final isPasswordVisible = false.obs;
  final pernahLogin = false.obs;

  void login() {
    try {
      isLoginProcessing(true);

      // Trigger http request
      AuthProvider()
          .login(
        email.text,
        password.text,
      )
          .then((resp) async {
        // Get custom token from login response
        final token = resp.accessToken;

        // Initialize firebase auth to get ID Token
        final idToken = await FirebaseAuth.instance
            .signInWithCustomToken(token!)
            .then((value) => value.user!.getIdToken());

        // // Send idToken to server to verify
        // AuthProvider().verifyIdToken(idToken).then((resp) async {
        //   debugPrint('ID Token: $idToken');
        // });

        final displayName =
            FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous';

        // Temporary print ID Token
        debugPrint(idToken);
        clear();

        // Save id from response to shared preferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('id', resp.data!.user!.id!);
        prefs.setString('photo', resp.data!.user!.photoUrl!);

        final getPhoto = prefs.getString('photo');
        final getId = prefs.getString('id');

        debugPrint('Photo from sharepref: $getPhoto');
        debugPrint('Id from sharepref: $getId');

        isLoginProcessing(false);

        Get.snackbar(
          'Success',
          'Login berhasil with ID Token: $displayName',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        );
      }, onError: (e) {
        isLoginProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isLoginProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    debugPrint('Google Auth: ${googleAuth?.idToken}');

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void clear() {
    email.clear();
    password.clear();
    formKey.currentState?.fields['password']?.reset();
    formKey.currentState!.reset();
  }

  // void verify() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       final idToken = await user.getIdToken(true);
  //       // send token to server
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
