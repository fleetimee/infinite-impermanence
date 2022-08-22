import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DebtorService {
  final httpClient = http.Client();

  // Create a debtor
  Future<Debtor> addDebtor(body) async {
    try {
      const apiUrl = '${baseUrl}debiturs';
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
          title: 'Sukses',
          desc: 'Data berhasil ditambahkan',
          btnOkOnPress: () {
            Get.back();
          },
        ).show();
      }
      return Debtor.fromJson(json.decode(response.body));
    } catch (e) {
      debugPrint('error: $e');

      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: e.toString(),
        btnOkOnPress: () {},
      ).show();
      throw Exception('Failed to create post');
    }
  }

  // Fetch debitur data from API
  Future<List<Debtor>> getDebtors() async {
    try {
      const apiUrl = '${baseUrl}debiturs';
      final response = await httpClient.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        debugPrint('response: ${response.body}');

        Iterable it = json.decode(response.body);
        List<Debtor> list = it.map((model) => Debtor.fromJson(model)).toList();
        return list;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Failed to load post');
    }
  }

  // Delete a debtor
  Future<void> deleteDebtor(id) async {
    try {
      final apiUrl = '${baseUrl}debiturs/$id';
      final response = await httpClient.delete(
        Uri.parse(apiUrl),
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
          title: 'Sukses',
          desc: 'Data berhasil dihapus',
          btnOkOnPress: () {},
        ).show();
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Failed to load post');
    }
  }

  // Update a debtor
  Future<void> updateDebtor(id, body) async {
    try {
      final apiUrl = '${baseUrl}debiturs/$id';
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
          title: 'Sukses',
          desc: 'Data berhasil diubah',
          btnOkOnPress: () {
            Get.back();
          },
        ).show();
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Failed to load post');
    }
  }
}
