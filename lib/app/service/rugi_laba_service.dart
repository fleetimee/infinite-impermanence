import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RugiLabaService {
  final httpClient = http.Client();

  // Create Rugi Laba
  Future<InputRugiLaba> addRugiLaba(body) async {
    try {
      const apiUrl = '${baseUrl}input-rugi-laba';
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
      return InputRugiLaba.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint('error: ${e.toString()}');

      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
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
        title: 'Gagal',
        desc: 'Data gagal ditambahkan',
        btnOkOnPress: () {
          Get.offAndToNamed(Routes.DEBITUR_LIST);
          // Then refresh the list
          Get.find<DebiturRealController>().fetchDebitur();
        },
      ).show();
      throw Exception('Failed to create data');
    }
  }
}
