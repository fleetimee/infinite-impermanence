// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/auth/auth.model.dart';

class AuthProvider {
  final httpClient = http.Client();

  Future<Auth> login(String email, String password) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}auth'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return Auth.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // verifyIdToken
  Future<Auth> verifyIdToken(String idToken) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}auth/verify'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'idToken': idToken,
        }),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return Auth.fromJson(data);
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> sendFcmToken(String id, String fcmToken) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}users/$id/fcmToken'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'fcmToken': fcmToken,
        }),
      );
      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
