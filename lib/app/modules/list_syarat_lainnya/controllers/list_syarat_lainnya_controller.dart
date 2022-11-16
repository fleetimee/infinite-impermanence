// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/syarat_lain/save_syarat_lain.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';

class ListSyaratLainnyaController extends GetxController {
  @override
  void onInit() {
    getAllSyaratLainnya(debiturId);
    super.onInit();
  }

  var listSyaratLainnya = List<SyaratLain>.empty(growable: true).obs;

  final isSyaratLainInputProcessing = false.obs;

  final debiturId = Get.arguments;

  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  var keterangan = TextEditingController();
  var keteranganEdit = TextEditingController();

  void getAllSyaratLainnya(int id) {
    try {
      isSyaratLainInputProcessing(true);
      SyaratLainProvider().fetchSyaratLain(id).then((resp) {
        isSyaratLainInputProcessing(false);
        listSyaratLainnya.addAll(resp);
      }, onError: (e) {
        isSyaratLainInputProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isSyaratLainInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void saveSyaratlainnya(id) {
    final body = {
      'keterangan': keterangan.text,
    };

    try {
      isSyaratLainInputProcessing(true);
      SyaratLainProvider().saveSyaratLain(id, body).then((resp) {
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        isSyaratLainInputProcessing(false);

        clearForm();
        listSyaratLainnya.clear();
        getAllSyaratLainnya(debiturId);
        debiturController.fetchOneDebitur(debiturId);
      }, onError: (e) {
        isSyaratLainInputProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isSyaratLainInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void updateSyaratLainnya(int idDebitur, int id) {
    final body = {
      'keterangan': formKey.currentState?.fields['deskripsi_pendek']?.value,
    };

    try {
      isSyaratLainInputProcessing(true);
      SyaratLainProvider().putSyaratLain(idDebitur, id, body).then((resp) {
        isSyaratLainInputProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dirubah',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearFormEdit();
        listSyaratLainnya.clear();
        getAllSyaratLainnya(debiturId);
        debiturController.fetchOneDebitur(debiturId);
      }, onError: (e) {
        isSyaratLainInputProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isSyaratLainInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteSyaratLainnya(int idDebitur, id) {
    try {
      isSyaratLainInputProcessing(true);
      SyaratLainProvider().purgeSyaratLain(idDebitur, id).then((resp) {
        isSyaratLainInputProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        listSyaratLainnya.clear();
        getAllSyaratLainnya(debiturId);
        debiturController.fetchOneDebitur(debiturId);
      }, onError: (e) {
        isSyaratLainInputProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isSyaratLainInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void clearForm() {
    keterangan.clear();
  }

  void clearFormEdit() {
    keteranganEdit.clear();
  }
}
