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

  Future<SyaratLain> saveSyaratLain(int id, Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}debiturs/$id/syarat-lain/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        return SyaratLain.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putSyaratLain(int idDebitur, int id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}debiturs/$idDebitur/syarat-lain/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> purgeSyaratLain(int idDebitur, int id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}debiturs/$idDebitur/syarat-lain/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);

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
