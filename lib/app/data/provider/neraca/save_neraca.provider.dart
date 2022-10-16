// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/neraca_model/save_neraca.model.dart';

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

  Future<void> putNeraca(id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}input-neraca/$id'),
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

  Future<void> deleteNeraca(int id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}input-neraca/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('It works');
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
