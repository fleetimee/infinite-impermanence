// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
 import '../common/constant.dart';
 import '../models/debitur_dropdown.dart';

// Get debitur name
Future<List<Dropdown>> getData() async {
  final httpClient = http.Client();

  var response = await httpClient.get(
    Uri.parse('$baseUrl/debiturs/?fields=id,nama_debitur'),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  // Return as list
  List<Dropdown> debiturList = (json.decode(response.body) as List)
      .map((i) => Dropdown.fromJson(i))
      .toList();

  for (var element in debiturList) {
    print('Row Contains ${element.id} - ${element.namaDebitur} ');
  }

  return debiturList;
}
