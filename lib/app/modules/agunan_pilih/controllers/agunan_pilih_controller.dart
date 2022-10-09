// ignore_for_file: unnecessary_overrides

import 'package:akm/app/data/provider/agunan/agunan_pilihan/agunan_pilih.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanPilihController extends GetxController {
  // ignore: todo
  //TODO: Implement AgunanPilihController

  final int data = Get.arguments;
  final debiturController = Get.put(InsightDebiturController());

  final isAgunanInputProcessing = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  void saveMultipleAgunan() {
    final body = {
      'bulk': formKey.currentState!.value['languages'],
    };
    try {
      isAgunanInputProcessing.value = true;
      AgunanPilihanProvider().deployAgunanPilihan(data, body).then((resp) {
        isAgunanInputProcessing.value = false;
        debiturController.fetchAgunan(data);
        debiturController.fetchOneDebitur(data);

        Get.snackbar(
          'Sukses',
          'Agunan berhasil ditambahkan',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        isAgunanInputProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanInputProcessing.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
