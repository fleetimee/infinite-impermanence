import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeReviewerController extends GetxController {
  // Controller for pageview
  final PageController controller = PageController();

  void logout() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: 'Logout',
      desc: 'Are you sure want to logout?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await FirebaseAuth.instance.signOut();

        // check if user is currently signed in with google
        if (await GoogleSignIn().isSignedIn()) {
          await GoogleSignIn().disconnect();
        }
      },
    ).show();
  }
}
