// 🐦 Flutter imports:
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:

class HomeReviewerController extends GetxController {
  // Controller for pageview
  final PageController controller = PageController();

  @override
  void onInit() {
    getUid();
    super.onInit();
  }

  // var
  late var uid = ''.obs;

  // Get uid from sharedPreferences
  Future<void> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    uid.value = prefs.getString('id') ?? '';
  }

  // Future<void> refreshReview() async {
  //   getMyPendingReview();
  // }

  void logout() {
    PrompDialog(
      context: Get.context!,
      title: 'Logout',
      desc: 'Are you sure want to logout?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await FirebaseAuth.instance.signOut();
        final prefs = await SharedPreferences.getInstance();

        await prefs.setBool('pernahLogin', true);

        // clear shared preferences id
        await prefs.remove('id');
        await prefs.remove('photo');
        await prefs.remove('role');

        // check if user is currently signed in with google
        if (await GoogleSignIn().isSignedIn()) {
          await GoogleSignIn().disconnect();
        }
      },
    ).show();
  }
}
