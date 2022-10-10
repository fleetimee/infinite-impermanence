import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AgunanTanahProvider {
  final httpClient = http.Client();

  // Get agunan tanah by agunan id

  Future<List<FormTanah>> fetchAgunanTanah(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}agunan/$id/agunan-tanah/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => FormTanah.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FormTanah> saveFormAgunanTanah(int id, Map body) async {
    try {
      // TODO: Ini udah dapet tapi ada kesalahan di server kayaknya yang BigInt harus di replace titiknya
      final response = await httpClient.post(
        Uri.parse('${baseUrl}agunan/$id/agunan-tanah/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        return FormTanah.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
