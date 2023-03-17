// 🐦 Flutter imports:
import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/modules/office-selection/controllers/office_selection_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:google_fonts/google_fonts.dart';
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
              title: 'Pilih Cabang utama dan Cabang Pembantu',
              footer: const Text(
                  'Hint: Gunakan email yang sama dengan yang diberikan oleh admin'),
              bodyWidget: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Ini digunakan untuk tampilan di cetakan dokumen dan akan hilang jika aplikasi di uninstall atau di clear cache",
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderSearchableDropdown<String>(
                    name: 'cabang_utama',
                    onChanged: (value) {
                      controller.cabangUtama = value!;
                      debugPrint(controller.cabangUtama);
                    },
                    onSaved: (value) {
                      controller.cabangUtama = value!;
                      debugPrint(controller.cabangUtama);
                    },
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      prefixIcon: const Icon(
                        Icons.apartment_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: GFColors.SUCCESS,
                          size: 25,
                        ),
                        onPressed: () {
                          // controller.submitEmailFirebase();
                        },
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      focusColor: Colors.red,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.red,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: 'Pilih Cabang Utama',
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    validator: FormBuilderValidators.required(),
                    items: cabangUtama,
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: 'Cabang Utama',
                      labelText: 'Cabang Utama',
                    ),
                    filterFn: (provinsi, filter) =>
                        provinsi.toLowerCase().contains(filter.toLowerCase()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderSearchableDropdown<String>(
                    name: 'cabang_pembantu',
                    onChanged: (value) {
                      controller.cabangPembantu = value!;
                      debugPrint(controller.cabangPembantu);
                    },
                    onSaved: (value) {
                      controller.cabangPembantu = value!;
                      debugPrint(controller.cabangPembantu);
                    },
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      prefixIcon: const Icon(
                        Icons.location_city_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: GFColors.SUCCESS,
                          size: 25,
                        ),
                        onPressed: () {
                          // controller.submitEmailFirebase();
                        },
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      focusColor: Colors.red,
                      fillColor: Colors.grey.shade300,
                      hoverColor: Colors.red,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: 'Pilih Cabang Pembantu',
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    validator: FormBuilderValidators.required(),
                    items: officeBranches,
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: 'Cabang Utama',
                      labelText: 'Cabang Utama',
                    ),
                    filterFn: (provinsi, filter) =>
                        provinsi.toLowerCase().contains(filter.toLowerCase()),
                  ),
                ],
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
