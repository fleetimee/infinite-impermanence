import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/list_debitur.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListDebiturProvider {
  final httpClient = http.Client();

  Future<List<Datum>> fetchDebiturs(String page) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs?limit=9&page=$page'),
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
