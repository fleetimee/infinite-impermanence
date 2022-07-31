// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/service/search_service.dart';

class SearchNikController extends GetxController {
  final currentNik = ''.obs;
  final namaDebitur = ''.obs;
  final nomorDebitur = ''.obs;
  final apicall = false.obs;

  final nikController = TextEditingController();

  void callsearchNik() {
    apicall.value = true;

    var api = DebiturSearchApi();
    var nik = nikController.text;

    api.searchNik(nik).then((debitur) {
      currentNik.value = debitur.nik;
      namaDebitur.value = debitur.namaDebitur;
      nomorDebitur.value = debitur.noDebitur;
      apicall.value = false;
    }, onError: (error) {
      print(error);
      apicall.value = false;
      currentNik.value = "Error: $error";
    });

    update();
  }
}
