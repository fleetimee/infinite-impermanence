import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/neraca_model/save_neraca.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NeracaProvider {
  final httpClient = http.Client();

  Future<NeracaInput> deployNeraca(Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}input-neraca'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        return NeracaInput.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
