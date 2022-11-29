// 🎯 Dart imports:

// 🐦 Flutter imports:

// 📦 Package imports:
import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class MediaProvider {
  final httpClient = http.Client();

  Future<Upload> saveMedia(int id, body) async {
    try {
      final response = http.MultipartRequest(
        'POST',
        Uri.parse('${baseUrl}debiturs/$id/uploads/'),
      )
        ..headers.addAll(
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )
        ..files.add(await http.MultipartFile.fromPath('file', body['file']));

      response.fields.addAll(
        Map<String, String>.from(body),
      );

      var res = await response.send();

      final resBody = await res.stream.bytesToString();

      debugPrint(resBody);

      if (res.statusCode == 201) {
        return Upload.fromJson(jsonDecode(resBody));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
