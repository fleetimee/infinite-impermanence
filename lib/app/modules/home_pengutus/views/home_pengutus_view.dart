// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/modules/home_pengutus/widget/home_pengutus_main_menu.dart';
import 'package:akm/app/modules/home_pengutus/widget/home_pengutus_profile.dart';
import 'package:akm/app/modules/home_pengutus/widget/home_pengutus_settinglist.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import '../controllers/home_pengutus_controller.dart';

// ignore: must_be_immutable
class HomePengutusView extends GetView<HomePengutusController> {
  HomePengutusView({Key? key}) : super(key: key);

  final homeCtrl = Get.put(HomeController());

  final account = FirebaseAuth.instance.currentUser?.displayName ?? 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[600],
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
            PengutusMainMenu(
              account: account,
              controller: controller,
              homeCtrl: homeCtrl,
            ),
            SafeArea(
              child: PengutusProfile(
                auth: auth,
                controller: controller,
                homeCtrl: homeCtrl,
              ),
            ),
            PengutusSettingList(
              controller: controller,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarBubble(
        backgroundColor: secondaryColor,
        color: Colors.pink[700]!,
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
