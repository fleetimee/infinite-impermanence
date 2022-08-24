import 'dart:convert';

import 'package:akm/app/common/constant.dart';
// import http as http
import 'package:http/http.dart' as http;
import 'package:akm/app/models/debtor_details.dart';
import 'package:flutter/material.dart';

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
