// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:async';
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/models/Debitur.dart';
import '../common/constant.dart';

class ApiService {
  final httpClient = http.Client();

  Future<Debitur> addDebitur(body) async {
    const apiUrl = '${baseUrl}debiturs';
    final response = await httpClient
        .post(Uri.parse(apiUrl), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    print('response: ${response.body}');

    if (response.statusCode == 201) {
      return Debitur.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
