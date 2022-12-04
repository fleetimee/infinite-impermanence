import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class MediaProvider {
  final httpClient = http.Client();

  Future<List<Upload>> fetchMedia(int id) async {
    try {
      const contL = '\$contL';
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id/uploads/?filter=file||$contL||jpg'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => Upload.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Upload>> fetchDocs(int id) async {
    try {
      const contL = '\$contL';

      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id/uploads/?filter=file||$contL||pdf'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => Upload.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

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
