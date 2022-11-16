// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class AnalisaAgunanProvider {
  final httpClient = http.Client();

  Future<List<AnalisaAgunan>> fetchAnalisaAgunan(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id/analisa-agunan/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => AnalisaAgunan.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<AnalisaAgunan> deployAnalisaAgunan(int id, Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}debiturs/$id/analisa-agunan/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return AnalisaAgunan.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> purgeAnalisaAgunan(int id, int idAnalisa) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}debiturs/$id/analisa-agunan/$idAnalisa/'),
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
