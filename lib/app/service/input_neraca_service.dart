// Import http

// 🎯 Dart imports:

// 🐦 Flutter imports:

// 📦 Package imports:
import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/neraca.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class InputNeracaService {
  final httpClient = http.Client();

  // Create Input Neraca
  Future<InputNeraca> addInputNeraca(body) async {
    try {
      const apiUrl = '${baseUrl}input-neraca';
      final response = await httpClient.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      debugPrint('response: ${response.body}');

      if (response.statusCode == 201) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          title: 'Sukses',
          desc: 'Data berhasil ditambahkan',
          btnOkOnPress: () {
            Get.offAndToNamed(Routes.DEBITUR_LIST);
            // Then refresh the list
            Get.find<DebiturRealController>().fetchDebitur();
          },
        ).show();
      }

      return InputNeraca.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint('error: ${e.toString()}');

      AwesomeDialog(
        context: Get.context!,
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.poppins(
          color: secondaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        descTextStyle: GoogleFonts.poppins(
          color: secondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Terjadi kesalahan',
        btnOkOnPress: () {},
      ).show();
      throw Exception('Failed to create post');
    }
  }

  Future<void> editInputNeraca(id, body) async {
    try {
      final apiUrl = '${baseUrl}input-neraca/$id';
      final response = await httpClient.put(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          title: 'Sukses',
          desc: 'Data berhasil diubah',
          btnOkOnPress: () {
            Get.back();
            // Then refresh the list
            Get.find<DebiturRealController>().fetchDebitur();
          },
        ).show();
      } else {
        AwesomeDialog(
          context: Get.context!,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error',
          desc: 'Terjadi kesalahan',
          btnOkOnPress: () {},
        ).show();
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      throw Exception('Failed to create post');
    }
  }
}
