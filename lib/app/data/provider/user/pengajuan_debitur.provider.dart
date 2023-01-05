// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';

class MySubmissionProvider {
  final httpClient = http.Client();

  Future<UserPengajuan> fetchMyPengajuan(String userId) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}users/$userId'),
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
        Uri.parse('${baseUrl}users/$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // if response is List<dynamic> then use this
        // final data = jsonDecode(response.body) as List;

        var data = jsonDecode(response.body);

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
