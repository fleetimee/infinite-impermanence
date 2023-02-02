import 'dart:convert';

import 'package:akm/app/models/kurs/kurs.model.dart';
import 'package:http/http.dart' as http;

class KursProvider {
  final httpClient = http.Client();

  Future<List<Kurs>> fetchKurs() async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://bca-exchange-rates.vercel.app/api'),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return (data as List).map((e) => Kurs.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load url');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
