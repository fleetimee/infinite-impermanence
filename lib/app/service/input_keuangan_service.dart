// Import http

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
 import '../common/constant.dart';
 import '../common/style.dart';
 import '../models/keuangan.dart';

class InputKeuanganService {
  final httpClient = http.Client();

  // Create keuangan
  Future<Keuangan> addKeuangan(body) async {
    try {
      const apiUrl = '${baseUrl}input-keuangan';
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
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
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
            Get.back();
          },
        ).show();
      }
      return Keuangan.fromJson(json.decode(response.body));
    } catch (e) {
      debugPrint('error: $e');

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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Terjadi kesalahan',
        btnOkOnPress: () {},
      ).show();
      throw Exception('Failed to create post');
    }
  }
}
