// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

class SyaratLainProvider {
  final httpClient = http.Client();

  Future<List<SyaratLain>> fetchSyaratLain(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id/syarat-lain/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => SyaratLain.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
