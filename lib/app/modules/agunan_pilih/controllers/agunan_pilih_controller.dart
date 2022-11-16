// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/agunan/agunan_pilihan/agunan_pilih.provider.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';

class AgunanPilihController extends GetxController {
  void patchProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) +
          0.1,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().patchProgressBar(body, id).then((resp) {
        debiturController.isDataLoading(false);
        debiturController.fetchOneDebitur(id);
      }, onError: (err) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void purgeProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) -
          0.1,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().patchProgressBar(body, id).then((resp) {
        debiturController.isDataLoading(false);
        debiturController.fetchOneDebitur(id);
      }, onError: (err) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

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
        Future.delayed(const Duration(seconds: 1), () {
          patchProgressBar(data);
        });
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
