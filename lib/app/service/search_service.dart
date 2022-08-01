import 'dart:convert';

import 'package:http/http.dart';

import '../models/Debitur.dart';

class DebiturSearchApi {
  Future<Debitur> searchNik(String nik) async {
    // var url = 'http://10.0.2.2:3000/debiturs/?s={"nik": $nik}';
    var url = 'http://192.168.42.148:3000/debiturs/?s={"nik": $nik}';
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseJson = json.decode(response.body);
      return responseJson.map((item) => Debitur.fromJson(item)).toList().first;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
