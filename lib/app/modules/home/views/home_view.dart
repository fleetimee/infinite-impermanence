// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/widget/home_history_and_submission.dart';
import 'package:akm/app/modules/home/widget/home_main_page.dart';
import 'package:akm/app/modules/home/widget/home_search_nik.dart';
import 'package:akm/app/modules/home/widget/home_settinglist.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/widget/home_profile.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  final List<String> imageList = [
    "assets/images/home/image1.jpg",
    "assets/images/home/image2.jpg",
    "assets/images/home/image3.jpg",
    "assets/images/home/image4.jpg",
    "assets/images/home/image5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0.obs;

    return ScaffoldGradientBackground(
      resizeToAvoidBottomInset: false,
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      // drawer: SideMenu(),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          elevation: 10,
          content: Text(
            'Press again to exit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        child: PageView(
          onPageChanged: (value) => selectedIndex.value = value,
          controller: controller.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SafeArea(
              child: HomeMainPage(),
            ),
            LoaderOverlay(
              child: SafeArea(
                child: HomeSearchNik(
                  controller: controller,
                ),
              ),
            ),
            SafeArea(
              child: HomeHistoryAndSubmission(
                controller: controller,
              ),
            ),
            SafeArea(
              child: FormFirebase(
                auth: auth,
                controller: controller,
              ),
            ),
            SafeArea(
              child: HomeSettingList(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarDoubleBullet(
        backgroundColor: primaryColor,
        color: Colors.white,
        height: 60,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(
            iconData: Icons.ac_unit_outlined,
            iconSize: 50,
          ),
          BottomBarItem(iconData: Icons.person),
          BottomBarItem(iconData: Icons.settings),
        ],
        onSelect: (index) {
          // selected index pageview
          controller.controller.animateToPage(
            index,
            // no duration
            duration: const Duration(milliseconds: 200),

            // duration: const Duration(milliseconds: 300),
            // no curve
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
      ),
    );
  }
}
