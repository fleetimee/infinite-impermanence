// 🐦 Flutter imports:
import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/user/user_dropdown.model.dart';
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

class UserDropdownProvider {
  final httpClient = http.Client();

  Future<UserDropdown> fetchReviewers() async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}firebase-remote/reviewers'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*'
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('data: $data');
        return UserDropdown.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
