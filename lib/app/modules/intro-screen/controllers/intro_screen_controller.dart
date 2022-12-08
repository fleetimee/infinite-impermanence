import 'package:akm/app/common/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class IntroScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  var email = TextEditingController();
  var displayName = TextEditingController();
  var password = TextEditingController();

  var isEmailReadOnly = false.obs;
  var isDisplayNameReadOnly = false.obs;

  void submitEmailFirebase() async {
    if (email.text.isNotEmpty) {
      try {
        await auth.currentUser?.updateEmail(email.text);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success',
          desc: 'Email has been updated',
          btnOkOnPress: () {
            //  Get.offAllNamed(Routes.LOGIN_PAGE);
          },
        ).show();
        isEmailReadOnly.value = true;
      } catch (e) {
        FirebaseAuthException exception = e as FirebaseAuthException;

        if (exception.code == 'requires-recent-login') {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: 'Please re-login to update your email',
            btnOkOnPress: () async {
              // Get.offAllNamed(Routes.LOGIN_PAGE);
              await auth.signOut();
              // Check if google sign in
              if (await GoogleSignIn().isSignedIn()) {
                await GoogleSignIn().disconnect();
              }
            },
          ).show();
        } else {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: exception.message.toString(),
            btnOkOnPress: () {
              // Get.offAllNamed(Routes.LOGIN_PAGE);
            },
          ).show();
        }
      }
    }
  }

  void submitDisplayNameFirebase() async {
    if (displayName.text.isNotEmpty) {
      try {
        await auth.currentUser?.updateDisplayName(displayName.text);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success',
          desc: 'Display name has been updated',
          btnOkOnPress: () {
            //  Get.offAllNamed(Routes.LOGIN_PAGE);
          },
        ).show();
        isDisplayNameReadOnly.value = true;
      } catch (e) {
        FirebaseAuthException exception = e as FirebaseAuthException;

        if (exception.code == 'requires-recent-login') {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: 'Please re-login to update your display name',
            btnOkOnPress: () async {
              // Get.offAllNamed(Routes.LOGIN_PAGE);
              await auth.signOut();
              // Check if google sign in
              if (await GoogleSignIn().isSignedIn()) {
                await GoogleSignIn().disconnect();
              }
            },
          ).show();
        } else {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: exception.message.toString(),
            btnOkOnPress: () {
              // Get.offAllNamed(Routes.LOGIN_PAGE);
            },
          ).show();
        }
      }
    }
  }
}
