// 🐦 Flutter imports:

import 'dart:convert';

import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';

class IjinLegitimasiProvider {
  final httpClient = http.Client();

  Future<List<IjinLegitimasi>> fetchIjinLegitimasi(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}debiturs/$id/ijin-legitimasi/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => IjinLegitimasi.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<IjinLegitimasi> deployIjinLegitimasi(int id, Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}debiturs/$id/ijin-legitimasi/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return IjinLegitimasi.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putIjinLegitimasi(int id, int idIjin, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}debiturs/$id/ijin-legitimasi/$idIjin/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> purgeIjinLegitimasi(int id, int idIjin) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('${baseUrl}debiturs/$id/ijin-legitimasi/$idIjin/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
