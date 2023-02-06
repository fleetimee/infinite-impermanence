// 🎯 Dart imports:

// 🐦 Flutter imports:

// 📦 Package imports:
import 'dart:convert';

import 'package:akm/app/models/crypto/cryptodetail.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoDetailProvider {
  final httpClient = http.Client();

  Future<CryptoDetail> fetchDetailByTicker(String ticker) async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://api.coingecko.com/api/v3/coins/$ticker'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return CryptoDetail.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
