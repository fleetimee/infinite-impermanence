import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/pengajuan/pengajuan_submit_reviewer.model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PengajuanSubmitReviewProvider {
  final httpClient = http.Client();

  Future<PengajuanReviewer> submitPengajuanAnalis(String id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}pengajuan/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return PengajuanReviewer.fromJson(data);
      } else {
        throw Exception('Failed to load pengajuan');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
