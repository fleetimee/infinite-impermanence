// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class AgunanLainnyaProvider {
  final httpClient = http.Client();

  Future<List<FormCommon>> fetchAgunanLainnya(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}agunan/$id/agunan-lainnya/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => FormCommon.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FormCommon> saveFormAgunanLainnya(int id, Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}agunan/$id/agunan-lainnya/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        return FormCommon.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // Future<void> putAgunanLainnya(int idAgunan, int idAgunanLainnya) async {
  //   try {
  //     final response = await httpClient.put(
  //       Uri.parse('${baseUrl}agunan/$idAgunan/agunan-lainnya/$idAgunanLainnya/'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json'
  //       },
  //     );
  //     debugPrint(response.body);

  //     if (response.statusCode == 200) {
  //       return FormCommon.fromJson(jsonDecode(response.body));
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     return Future.error(e);
  //   }
  // }

  Future<void> deleteAgunanLainnya(int idAgunan, int idAgunanLainnya) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}agunan/$idAgunan/agunan-lainnya/$idAgunanLainnya'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
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
