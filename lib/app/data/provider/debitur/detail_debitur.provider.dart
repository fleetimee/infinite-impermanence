// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class InsightDebiturProvider {
  final httpClient = http.Client();

  Future<DebiturInsight> fetchDebiturById(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id?$joinTable'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return DebiturInsight.fromJson(data);
      } else {
        throw Exception('Failed to load debitur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Agunan>> fetchAgunan(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id?$joinTable'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return DebiturInsight.fromJson(data).agunan!;
      } else {
        throw Exception('Failed to load debitur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<SyaratLain>> fetchSyaratLain(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id?$joinTable'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return DebiturInsight.fromJson(data).syaratLain!;
      } else {
        throw Exception('Failed to load debitur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
