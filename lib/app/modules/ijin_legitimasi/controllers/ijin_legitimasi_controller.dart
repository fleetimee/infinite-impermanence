import 'package:akm/app/data/provider/ijin_legitimasi/save_ijin_legitimasi.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class IjinLegitimasiController extends GetxController {
  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  final isIjinLegitimasiProcessing = false.obs;

  var jenisIjinLegitimasi = TextEditingController();
  var keteranganIjinLegitimasi = TextEditingController();

  void saveInputIjinLegitimasi(id) {
    final body = {
      'jenis_ijin': jenisIjinLegitimasi.text,
      'keterangan_ijin': keteranganIjinLegitimasi.text,
    };

    try {
      isIjinLegitimasiProcessing(true);
      IjinLegitimasiProvider().deployIjinLegitimasi(id, body).then((resp) {
        isIjinLegitimasiProcessing(false);
        debiturController.fetchOneDebitur(id);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isIjinLegitimasiProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isIjinLegitimasiProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void editInputIjinLegitimasi(id, idIjin) {
    final body = {
      'jenis_ijin': jenisIjinLegitimasi.text,
      'keterangan_ijin': keteranganIjinLegitimasi.text,
    };

    try {
      isIjinLegitimasiProcessing(true);
      IjinLegitimasiProvider().putIjinLegitimasi(id, idIjin, body).then((resp) {
        isIjinLegitimasiProcessing(false);
        debiturController.fetchOneDebitur(id);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isIjinLegitimasiProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isIjinLegitimasiProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void deleteInputIjinLegitimasi(id, idIjin) {
    try {
      isIjinLegitimasiProcessing(true);
      IjinLegitimasiProvider().purgeIjinLegitimasi(id, idIjin).then((resp) {
        isIjinLegitimasiProcessing(false);
        debiturController.fetchOneDebitur(id);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isIjinLegitimasiProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isIjinLegitimasiProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearForm() {
    jenisIjinLegitimasi.clear();
    keteranganIjinLegitimasi.clear();
  }
}
