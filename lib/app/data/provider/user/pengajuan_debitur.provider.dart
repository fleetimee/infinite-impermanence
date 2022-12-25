import 'dart:convert';

import 'package:akm/app/models/user/user_pengajuan.model.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';

class MySubmissionProvider {
  final httpClient = http.Client();

  Future<UserPengajuan> fetchMyPengajuan(String userId) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}users/$userId?fields=pengajuan'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return UserPengajuan.fromJson(data);
      } else {
        throw Exception('Failed to load pengajuan');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserPengajuan> fetchMyReview(String userId) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}users/$userId?fields=review'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return UserPengajuan.fromJson(data);
      } else {
        throw Exception('Failed to load pengajuan');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
