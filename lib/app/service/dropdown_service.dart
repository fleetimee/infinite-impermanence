// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_dropdown.dart';
import 'package:http/http.dart' as http;

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
