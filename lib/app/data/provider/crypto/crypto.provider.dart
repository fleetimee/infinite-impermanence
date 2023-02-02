// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:akm/app/models/crypto/crypto.model.dart';
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

class CryptoProvider {
  final httpClient = http.Client();

  Future<List<Crypto>> fetchCrypto() async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return data.map<Crypto>((json) => Crypto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
