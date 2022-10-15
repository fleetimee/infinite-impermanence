// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class AgunanTanahBangunanProvider {
  final httpClient = http.Client();

  // Get agunan tanah bangunan by agunan id
  Future<List<FormTanahBangunan>> fetchAgunanTanahBangunan(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}agunan/$id/agunan-tanah-bangunan/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List)
            .map((e) => FormTanahBangunan.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FormTanahBangunan> saveFormAgunanTanahDanBangunan(
      int id, Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}agunan/$id/agunan-tanah-bangunan/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        return FormTanahBangunan.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putAgunanTanahBangunan(int idAgunan, int id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}agunan/$idAgunan/agunan-tanah-bangunan/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> purgeAgunanTanahBangunan(int idAgunan, int id) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}agunan/$idAgunan/agunan-tanah-bangunan/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
