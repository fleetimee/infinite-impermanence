import 'package:akm/app/common/constant.dart';
import 'package:akm/app/data/provider/auth/auth.provider.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  late Rx<User?> firebaseUser;

  static LoginPageController instance = Get.find();

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  void setInitialScreen(User? user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } else {
      debugPrint('User is signed in!');
      Get.offAllNamed(Routes.HOME);
    }
  }

  final formKey = GlobalKey<FormBuilderState>();

  var email = TextEditingController();
  var password = TextEditingController();

  final isLoginProcessing = false.obs;
  final isPasswordVisible = false.obs;

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

        final displayName =
            FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous';

        // Temporary print ID Token
        debugPrint(idToken);
        clear();

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
