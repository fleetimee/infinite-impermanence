import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/agunan/agunan_input.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgunanPilihanProvider {
  final httpClient = http.Client();

  // Get all agunan by debitur id

  Future<List<AgunanInput>> deployAgunanPilihan(
      id, Map<String, dynamic> body) async {
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
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => AgunanInput.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
