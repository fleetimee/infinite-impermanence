import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/pengajuan/pengajuan_submit_analis.model.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

class PengajuanSubmitProvider {
  final httpClient = http.Client();

  Future<PengajuanAnalis> submitPengajuanAnalis(Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}pengajuan'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return PengajuanAnalis.fromJson(data);
      } else {
        throw Exception('Failed to load pengajuan');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
