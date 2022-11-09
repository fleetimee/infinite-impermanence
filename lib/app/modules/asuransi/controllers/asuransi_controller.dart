import 'package:akm/app/data/provider/asuransi/save_asuransi.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AsuransiController extends GetxController {
  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  final isAsuransiProcessing = false.obs;

  var premi = TextEditingController();
  var plafonKredit = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var jumlahAsuransi = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void saveAsuransi(id) {
    final body = {
      'premi': premi.text,
      'total_asuransi': jumlahAsuransi.text.replaceAll('.', '')
    };

    try {
      isAsuransiProcessing(true);
      AsuransiProvider().deployAsuransi(id, body).then((resp) {
        isAsuransiProcessing(false);
        debiturController.fetchOneDebitur(id);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isAsuransiProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAsuransiProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void editAsuransi(id, idAsuransi) {
    final body = {
      'premi': premi.text,
      'total_asuransi': jumlahAsuransi.text.replaceAll('.', '')
    };
    try {
      isAsuransiProcessing(true);
      AsuransiProvider().putAsuransi(id, idAsuransi, body).then((resp) {
        isAsuransiProcessing(false);
        debiturController.fetchOneDebitur(id);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isAsuransiProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAsuransiProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void deleteAsuransi(id, idAsuransi) {
    try {
      isAsuransiProcessing(true);
      AsuransiProvider().purgeAsuransi(id, idAsuransi).then((resp) {
        isAsuransiProcessing(false);
        debiturController.fetchOneDebitur(id);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isAsuransiProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAsuransiProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void hitungJumlahAsuransi() {
    final parsePremi = (double.parse(premi.text) / 100);
    final parsePlafon = double.parse(plafonKredit.text.replaceAll('.', ''));

    final result = parsePlafon * parsePremi;

    jumlahAsuransi.text = result.toStringAsFixed(0);
  }

  void clearForm() {
    premi.clear();
    plafonKredit.clear();
    jumlahAsuransi.clear();
  }
}
