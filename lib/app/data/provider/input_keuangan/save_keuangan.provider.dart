// ignore_for_file: unused_import

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class InputKeuanganProvider {
  final httpClient = http.Client();

  Future<InputKeuangan> deployInputKeuangan(Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}input-keuangan'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        return InputKeuangan.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putInputKeuangan(id, Map body) async {
    try {
      final response = await httpClient.patch(
        Uri.parse('${baseUrl}input-keuangan/$id'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('It works');
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> purgeInputKeuangan(int id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}input-keuangan/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
