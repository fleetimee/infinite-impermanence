// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:akm/app/models/debtor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
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
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Warning',
            desc: 'Data tidak ditemukan',
            btnOkOnPress: () {},
          ).show();
        }

        return list.first;
      }

      if (response.statusCode == 400) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error',
          desc: 'Bad Request',
          btnOkOnPress: () {},
        ).show();
      }

      throw Exception('Failed to load post');
    } catch (e) {
      print(e);

      throw Exception('Failed to load post');
    }
  }
}
