import 'package:akm/app/data/provider/agunan/agunan_tanah/agunan_tanah.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_tanah_bangunan/agunan_tanah_bangunan_provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanAnalisisCalcController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanTanahAnalisis(data[0].id);
    getAllAgunanTanahBangunanAnalisis(data[1].id ?? 0);
  }

  final data = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  var totalAgunanTanah = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);

  var listAgunanTanahAnalisis = List<FormTanah>.empty(growable: true).obs;
  final isAgunanTanahAnalisisProcessing = false.obs;
  void getAllAgunanTanahAnalisis(int id) {
    try {
      isAgunanTanahAnalisisProcessing(true);
      AgunanTanahProvider().fetchAgunanTanah(id).then((resp) {
        isAgunanTanahAnalisisProcessing(false);
        listAgunanTanahAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanTanahAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanTanahBangunanAnalisis =
      List<FormTanahBangunan>.empty(growable: true).obs;
  final isAgunanTanahBangunanAnalisisProcessing = false.obs;
  void getAllAgunanTanahBangunanAnalisis(int id) {
    try {
      isAgunanTanahBangunanAnalisisProcessing(true);
      AgunanTanahBangunanProvider().fetchAgunanTanahBangunan(id).then((resp) {
        isAgunanTanahBangunanAnalisisProcessing(false);
        listAgunanTanahBangunanAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanTanahBangunanAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahBangunanAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
