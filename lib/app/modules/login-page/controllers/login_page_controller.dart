import 'package:akm/app/data/provider/auth/auth.provider.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  @override
  void onInit() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
        Get.offAllNamed(Routes.HOME);
      }
    });
    super.onInit();
  }

  final formKey = GlobalKey<FormBuilderState>();

  var email = TextEditingController();
  var password = TextEditingController();

  final isLoginProcessing = false.obs;

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

        // Temporary print ID Token
        debugPrint(idToken);

        isLoginProcessing(false);

        Get.snackbar(
          'Success',
          'Login berhasil with',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        );

        Get.offAllNamed(Routes.HOME);
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
