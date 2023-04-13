// 🐦 Flutter imports:
import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/modules/office-selection/controllers/office_selection_controller.dart';
import 'package:akm/app/modules/office-selection/widget/office_selection_office_searchable_form.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfficeSelectionView extends GetView<OfficeSelectionController> {
  OfficeSelectionView({Key? key}) : super(key: key);

  final loginCtrl = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: SafeArea(
        child: IntroductionScreen(
          isProgress: true,
          resizeToAvoidBottomInset: true,
          pages: [
            PageViewModel(
              title: 'Kamu belum menentukan lokasi kantor',
              body:
                  "Untuk memulai silahkan isi lokasi kantor yang akan digunakan",
              image: Lottie.asset(
                'assets/images/home/office.zip',
                animate: true,
                frameRate: FrameRate(60),
              ),
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
                bodyTextStyle: TextStyle(fontSize: 19.0),
                pageColor: Colors.white,
                imagePadding: EdgeInsets.zero,
              ),
            ),
            PageViewModel(
              title: 'Pilih Kantormu',
              footer: const Text(
                  'Hint: Pilih cabang utama dan cabang pembantu yang berdekatan'),
              bodyWidget: OfficeSearchableBody(
                controller: controller,
              ),
              image: Lottie.asset(
                'assets/images/home/map.zip',
                animate: true,
                frameRate: FrameRate(60),
              ),
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
                bodyTextStyle: TextStyle(fontSize: 19.0),
                pageColor: Colors.white,
                imagePadding: EdgeInsets.zero,
              ),
            ),
          ],
          showSkipButton: false,
          next: const Text(
            "Selanjutnya",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          done: const Text(
            "Selesai",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          onDone: () async {
            if (controller.cabangUtama != '' &&
                controller.cabangPembantu != '') {
              // save data to shared preferences as object

              final office = {
                'cabang_utama': controller.cabangUtama,
                'cabang_pembantu': controller.cabangPembantu,
              };

              final officeToJsonString = jsonEncode(office);

              final prefs = await SharedPreferences.getInstance();

              prefs.setString('office', officeToJsonString);

              debugPrint(officeToJsonString);

              // Route according to user claims
              final claims = await auth.currentUser!.getIdTokenResult();

              if (claims.claims!['analis'] == true &&
                  claims.claims!['admin'] == false &&
                  claims.claims!['reviewer'] == false &&
                  claims.claims!['pengutus'] == false) {
                debugPrint('User is signed in! and is analis only');
                Get.offAllNamed(Routes.HOME);
                // if user is reviewer then route to reviewer page
              } else if (claims.claims!['reviewer'] == true &&
                  claims.claims!['admin'] == false &&
                  claims.claims!['analis'] == false &&
                  claims.claims!['pengutus'] == false) {
                debugPrint('User is signed in! and is reviewer only');
                Get.offAllNamed(Routes.HOME_REVIEWER);
              } // if user is pengutus then route to pengutus page
              else if (claims.claims!['pengutus'] == true &&
                  claims.claims!['admin'] == false &&
                  claims.claims!['analis'] == false &&
                  claims.claims!['reviewer'] == false) {
                debugPrint('User is signed in! and is pengutus only');
                Get.offAllNamed(Routes.HOME_PENGUTUS);
              }

              // auth.signOut();

              // final prefs = await SharedPreferences.getInstance();

              // remove all data from shared preferences
              // prefs.clear();
            } else {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.bottomSlide,
                title: 'Error',
                desc: 'Please fill all the form',
                btnOkOnPress: () {},
              ).show();
            }
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Theme.of(context).colorScheme.secondary,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
