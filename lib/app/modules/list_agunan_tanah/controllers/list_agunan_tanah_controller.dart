// ignore_for_file: unnecessary_overrides

import 'package:akm/app/data/provider/agunan/agunan_tanah/agunan_tanah.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAgunanTanahController extends GetxController {
  final agunanId = Get.arguments;

  final isAgunanTanahProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAgunanTanah(agunanId.id);
  }

  var listAgunanTanah = List<FormTanah>.empty(growable: true).obs;

  void getAllAgunanTanah(int id) {
    try {
      isAgunanTanahProcessing(true);
      AgunanTanahProvider().fetchAgunanTanah(id).then((resp) {
        isAgunanTanahProcessing(false);
        listAgunanTanah.addAll(resp);
      }, onError: (e) {
        isAgunanTanahProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
