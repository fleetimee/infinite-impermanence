// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/list_debitur.model.dart';

class ListDebiturProvider {
  final httpClient = http.Client();

  Future<List<Datum>> fetchDebiturs(String page, String sort) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            '${baseUrl}debiturs?page=$page&limit=10&sort=$sort&fields=$field&join=inputKeuangan||kredit_diusulkan,digunakan_untuk'),
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

  Future<List<Datum>> filterDebiturs(
      String page, String sort, String filterAsal, String filterUmur) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            '${baseUrl}debiturs?page=$page&sort=$sort&fields=$field&join=inputKeuangan||kredit_diusulkan,digunakan_untuk$filterAsal$filterUmur'),
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

  Future<List<Datum>> searchDebiturs(
      String page, String sort, String query) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            '${baseUrl}debiturs?page=$page&limit=100&sort=$sort&fields=$field&s={"peminjam1":{"${'contL'}": "$query"}}'),
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
