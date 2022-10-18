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

class AnalisaKarakterProvider {
  final httpClient = http.Client();

  Future<AnalisaKarakter> deployAnalisaKarakter(Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}analisa-karakter'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        return AnalisaKarakter.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putAnalisaKarakter(id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}analisa-karakter/$id'),
        body: jsonEncode(body),
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

  Future<void> purgeAnalisaKarakter(id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}analisa-karakter/$id'),
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
