// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
 import '../common/constant.dart';
 import '../models/debtor_details.dart';

// import http as http

final httpClient = http.Client();

class DebtorDetailsService {
  Future<DebtorDetails> getDebtorDetails(int id) async {
    final apiUrl = '${baseUrl}debiturs/$id';
    final response = await httpClient.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    debugPrint('response: ${response.body}');
    if (response.statusCode == 200) {
      return DebtorDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
