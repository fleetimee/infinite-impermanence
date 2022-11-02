// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
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

  // Patch progress bar
  Future<DebiturInsight> patchProgressBar(body, id) async {
    try {
      final response = await httpClient.patch(
        Uri.parse('${baseUrl}debiturs/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      debugPrint('response: ${response.body}');

      if (response.statusCode == 200) {
        return DebiturInsight.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
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
