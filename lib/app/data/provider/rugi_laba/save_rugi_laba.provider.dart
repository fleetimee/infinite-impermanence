// ignore_for_file: unused_import

import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/rugi_laba_model/save_rugi_laba.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RugiLabaProvider {
  final httpClient = http.Client();

  Future<RugiLabaInput> deployRugiLaba(Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}input-rugi-laba'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        return RugiLabaInput.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putRugiLaba(id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}input-rugi-laba/$id'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('It works');
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
