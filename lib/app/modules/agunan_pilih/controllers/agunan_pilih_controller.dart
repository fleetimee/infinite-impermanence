// ignore_for_file: unnecessary_overrides

import 'package:akm/app/data/provider/agunan/agunan_pilihan/agunan_pilih.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanPilihController extends GetxController {
  // ignore: todo
  //TODO: Implement AgunanPilihController

  final data = Get.arguments;
  final debiturController = Get.put(InsightDebiturController());

  final isAgunanInputProcessing = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  void saveMultipleAgunan() {
    final body = {
      'bulk': formKey.currentState!.value['languages'],
    };

    try {
      isAgunanInputProcessing(true);
      AgunanPilihanProvider().deployAgunanPilihan(data.id, body).then((resp) {
        // isAgunanInputProcessing(false);
        debiturController.fetchOneDebitur(data.id);
      }, onError: (e) {
        isAgunanInputProcessing(false);
        // TODO: this is fake message
        debiturController.fetchOneDebitur(data.id);
        Get.snackbar(
          'Success',
          'Agunan berhasil ditambahkan',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanInputProcessing(false);
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
