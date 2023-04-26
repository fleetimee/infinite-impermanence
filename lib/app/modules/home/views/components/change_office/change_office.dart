import 'dart:convert';

import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeOffice extends StatelessWidget {
  ChangeOffice({super.key});

  final homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FormBuilder(
          key: homeCtrl.formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Perubahan Kantor',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Ubah Kantor Cabang dan Kantor Pembantu disini',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                ),
                Center(
                  child: Lottie.asset(
                    'assets/images/home/map.zip',
                    animate: true,
                    height: 200,
                    frameRate: FrameRate(60),
                  ),
                ),
                const SizedBox(height: 20),
                FormBuilderSearchableDropdown<String>(
                  name: 'cabang_utama',
                  onSaved: (value) {
                    homeCtrl.mainBranch.value = value!;
                    debugPrint(homeCtrl.mainBranch.value);
                  },
                  dropdownSearchTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    // add custom google font
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                  initialValue: homeCtrl.mainBranch.value,
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
                const SizedBox(height: 20),
                FormBuilderSearchableDropdown<String>(
                  name: 'cabang_pembantu',
                  initialValue: homeCtrl.helperBranch.value,
                  onSaved: (value) {
                    homeCtrl.helperBranch.value = value!;
                    debugPrint(homeCtrl.helperBranch.value);
                  },
                  dropdownSearchTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    // add custom google font
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
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
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20.0),
          height: 90.0,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.check_circle_outline),
            label: Text(
              'Update',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // <-- Radius
              ),
            ),
            onPressed: () async {
              // Update the main branch and helper branch with the new value in shared preferences
              if (homeCtrl.formKey.currentState?.saveAndValidate() ?? false) {
                final office = {
                  'cabang_utama': homeCtrl.mainBranch.value,
                  'cabang_pembantu': homeCtrl.helperBranch.value,
                };

                final officeToJsonString = jsonEncode(office);

                final prefs = await SharedPreferences.getInstance();

                prefs.setString('office', officeToJsonString);

                debugPrint(officeToJsonString);

                Get.back();

                // Show the success dialog and pop the screen
                Get.snackbar(
                  'Kantor Berhasil Diubah',
                  'Kantor utama dan kantor pembantu berhasil diubah',
                  snackPosition: SnackPosition.TOP,
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(20),
                  borderRadius: 16,
                  duration: const Duration(seconds: 3),
                  isDismissible: true,
                );
              } else {
                Get.snackbar(
                  'Kantor Gagal Diubah',
                  'Kantor utama dan kantor pembantu gagal diubah',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(20),
                  borderRadius: 16,
                  duration: const Duration(seconds: 3),
                  isDismissible: true,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
