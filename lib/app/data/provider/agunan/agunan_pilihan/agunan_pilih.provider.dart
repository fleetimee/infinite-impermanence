import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/agunan/agunan_input.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgunanPilihanProvider {
  final httpClient = http.Client();

  Future<AgunanInput> deployAgunanPilihan(int id, body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}debiturs/$id/agunan/bulk/'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        return AgunanInput.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
