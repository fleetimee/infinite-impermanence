// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/list_debitur.model.dart';

class DebiturInputtedByProvider {
  final httpClient = http.Client();

  Future<List<Datum>> fetchMyInputtedDebitur(
      int page, String sort, String userId) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            '${baseUrl}debiturs?page=$page&limit=999&sort=$sort&fields=$field&join=inputKeuangan||kredit_diusulkan,digunakan_untuk&filter=userId||\$eq||$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return ListDebitur.fromJson(data).data!;
      } else {
        throw Exception('Failed to load debitur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
