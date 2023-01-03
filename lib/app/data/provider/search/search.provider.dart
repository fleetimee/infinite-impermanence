// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/search/search.model.dart';

class SearchNikProvider {
  final httpClient = http.Client();

  Future<List<Datum>> searchNik(String query) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            '${baseUrl}debiturs?limit=15&page=1&s={"no_ktp1": {"\$eq": $query}}&sort=id,ASC&join=inputKeuangan||kredit_diusulkan,digunakan_untuk&fields=peminjam1,bidang_usaha,jenis_usaha,tgl_sekarang,no_ktp1,userId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        return Search.fromJson(data).data!;
      } else {
        throw Exception('Failed to load debitur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
