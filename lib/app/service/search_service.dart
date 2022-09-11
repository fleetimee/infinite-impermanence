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
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../common/constant.dart';

class SearchService {
  // Future<Debtor> searchNik(String noKtp1) async {
  //   var url = '${baseUrl}debiturs/?s={"no_ktp1": $noKtp1}';
  //   final response = await get(Uri.parse(url));
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     final responseJson = json.decode(response.body);
  //     return responseJson.map((item) => Debtor.fromJson(item)).toList().first;
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
  final httpClient = http.Client();

  Future<Debtor> searchNik(String noKtp1) async {
    // final apiUrl = '${baseUrl}debiturs/?s={"no_ktp1": $noKtp1}';
    // final response = await httpClient.get(
    //   Uri.parse(apiUrl),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   },
    // );

    // debugPrint(response.body);

    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   Iterable it = json.decode(response.body);
    //   List<Debtor> list = it.map((item) => Debtor.fromJson(item)).toList();
    //   return list.first;
    // } else {
    //   throw Exception('Failed to load post');
    // }

    try {
      final apiUrl = '${baseUrl}debiturs/?s={"no_ktp1": $noKtp1}';
      final response = await httpClient.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      debugPrint(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable it = json.decode(response.body);
        List<Debtor> list = it.map((item) => Debtor.fromJson(item)).toList();

        if (list.isEmpty) {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.warning,
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
            btnOkOnPress: () {},
            btnCancelOnPress: () {
              Get.toNamed(Routes.ADD_DEBITUR);
            },
            desc: 'Data tidak ditemukan',
            title: 'Warning',
            btnCancelIcon: Icons.add_circle,
            btnCancelText: 'Buat Debitur Baru',
            btnCancelColor: Colors.blue,
            btnOkText: 'Cari Lagi',
            btnOkIcon: Icons.search,
            btnOkColor: Colors.blue,
          ).show();
        }

        return list.first;
      }

      if (response.statusCode == 400) {
        AwesomeDialog(
          context: Get.context!,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          dialogBackgroundColor: primaryColor,
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: 'Field input tidak boleh kosong',
          btnOkOnPress: () {},
        ).show();
      }

      throw Exception('Failed to load post');
    } catch (e) {
      debugPrint(e.toString());

      throw Exception('Failed to load post');
    }
  }
}
