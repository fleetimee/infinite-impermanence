import 'dart:convert';

import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';

class PengajuanDetailProvider {
  final httpClient = http.Client();

  Future<PengajuanDetail> fetchPengajuanDetail(String pengajuanId) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}pengajuan/$pengajuanId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return PengajuanDetail.fromJson(data);
      } else {
        throw Exception('Failed to load pengajuan');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
