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
import '../models/debtor.dart';

class DebtorService {
  final httpClient = http.Client();

  // Create a debtor
  Future<Debtor> addDebtor(body) async {
    try {
      // const apiUrl = '${baseUrl}debiturs';
      // final response = await httpClient.post(
      //   Uri.parse(apiUrl),
      //   body: jsonEncode(body),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Accept': 'application/json',
      //   },
      // );

      final response = await httpClient.post(
        Uri.parse('${baseUrl}debiturs'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      debugPrint('response: ${response.body}');

      if (response.statusCode == 201) {
        return Debtor.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
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
          'Access-Control_Allow_Origin': '*'
        },
      );
      if (response.statusCode == 200) {
        debugPrint('response: ${response.body}');

        Iterable it = json.decode(response.body);
        List<Debtor> list = it.map((model) => Debtor.fromJson(model)).toList();
        return list;
      } else {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan',
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        );
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('error: $e');
      Get.snackbar(
        'Error',
        'Terjadi kesalahan',
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );

      throw Exception('Failed to load post');
    }
  }

  // Fetch debtor by id from API
  Future<Debtor> getDebtorById(id) async {
    try {
      final apiUrl = '${baseUrl}debiturs/$id';
      final response = await httpClient.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        debugPrint('response: ${response.body}');

        return Debtor.fromJson(json.decode(response.body));
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
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
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
  Future<void> updateDebtor(id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}debiturs/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      debugPrint('response: ${response.body}');

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
