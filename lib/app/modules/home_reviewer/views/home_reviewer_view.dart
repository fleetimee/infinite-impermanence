// 🐦 Flutter imports:
import 'package:akm/app/modules/home_reviewer/widget/home_reviewer_main_menu.dart';
import 'package:akm/app/modules/home_reviewer/widget/home_reviewer_profile.dart';
import 'package:akm/app/modules/home_reviewer/widget/home_reviewer_settinglist.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import '../controllers/home_reviewer_controller.dart';

// ignore: must_be_immutable
class HomeReviewerView extends GetView<HomeReviewerController> {
  HomeReviewerView({Key? key}) : super(key: key);

  final homeCtrl = Get.put(HomeController());

  final account = FirebaseAuth.instance.currentUser?.displayName ?? 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          content: const Text(
            'Press again to exit',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        child: PageView(
          controller: controller.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ReviewerMainMenu(
              homeCtrl: homeCtrl,
              account: account,
              controller: controller,
            ),
            SafeArea(
              child: ReviewerProfile(
                auth: FirebaseAuth.instance,
                controller: controller,
                homeCtrl: homeCtrl,
              ),
            ),
            ReviewerSettingList(
              controller: controller,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarBubble(
        backgroundColor: primaryColor,
        color: secondaryColor,
        items: [
          BottomBarItem(iconData: Icons.home_filled),
          BottomBarItem(iconData: Icons.person),
          BottomBarItem(iconData: Icons.settings),
        ],
        onSelect: (index) {
          controller.controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
