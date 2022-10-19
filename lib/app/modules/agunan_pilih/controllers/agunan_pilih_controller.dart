// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_pilihan/agunan_pilih.provider.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';

class AgunanPilihController extends GetxController {
  final data = Get.arguments;
  final debiturController = Get.put(InsightDebiturController());
  final keuanganController = Get.put(InputKeuanganController());

  var plafonKredit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
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
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        isAgunanInputProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanInputProcessing.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
