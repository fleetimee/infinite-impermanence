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
  // void patchProgressBar(int id) {
  //   final body = {
  //     'progress': double.parse(
  //             debiturController.insightDebitur.value.progress.toString()) +
  //         0.1,
  //   };

  //   try {
  //     debiturController.isDataLoading(true);
  //     DebtorService().patchProgressBar(body, id).then((resp) {
  //       debiturController.isDataLoading(false);
  //       debiturController.fetchOneDebitur(id);
  //     }, onError: (err) {
  //       debiturController.isDataLoading(false);
  //       Get.snackbar(
  //         'Error',
  //         err.toString(),
  //         backgroundColor: Colors.red,
  //         colorText: secondaryColor,
  //       );
  //     });
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       backgroundColor: Colors.red,
  //       colorText: secondaryColor,
  //     );
  //   }
  // }

  // void purgeProgressBar(int id) {
  //   final body = {
  //     'progress': double.parse(
  //             debiturController.insightDebitur.value.progress.toString()) -
  //         0.1,
  //   };

  //   try {
  //     debiturController.isDataLoading(true);
  //     DebtorService().patchProgressBar(body, id).then((resp) {
  //       debiturController.isDataLoading(false);
  //       debiturController.fetchOneDebitur(id);
  //     }, onError: (err) {
  //       debiturController.isDataLoading(false);
  //       Get.snackbar(
  //         'Error',
  //         err.toString(),
  //         backgroundColor: Colors.red,
  //         colorText: secondaryColor,
  //       );
  //     });
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       backgroundColor: Colors.red,
  //       colorText: secondaryColor,
  //     );
  //   }
  // }

  final data = Get.arguments;
  final debiturController = Get.put(InsightDebiturController());
  final keuanganController = Get.put(InputKeuanganController());

  var plafonKredit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  final isAgunanInputProcessing = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  void saveMultipleAgunan() {
    final body = {
      // 'bulk': formKey.currentState!.value['languages'],

      'bulk': [
        if (formKey.currentState!.value['agunan_tanah'] == true &&
            // key: 'agunan_tanah' is enabled
            formKey.currentState!.fields['agunan_tanah']?.enabled == true)
          {
            "kode_agunan": 1,
            "jenis_agunan": "Tanah",
            "is_tanah": true,
            "is_los": false,
            "is_kendaraan": false
          },
        if (formKey.currentState!.value['agunan_tanah_bangunan'] == true &&
            formKey.currentState!.fields['agunan_tanah_bangunan']?.enabled ==
                true)
          {
            "kode_agunan": 2,
            "jenis_agunan": "Tanah dan Bangunan",
            "is_tanah": true,
            "is_los": false,
            "is_kendaraan": false
          },
        if (formKey.currentState!.value['agunan_kendaraan'] == true)
          {
            "kode_agunan": 3,
            "jenis_agunan": "Kendaraan",
            "is_tanah": false,
            "is_los": false,
            "is_kendaraan": true
          },
        if (formKey.currentState!.value['agunan_peralatan'] == true &&
            formKey.currentState!.fields['agunan_peralatan']?.enabled == true)
          {
            "kode_agunan": 4,
            "jenis_agunan": "Mesin dan Peralatan",
            "is_tanah": false,
            "is_los": false,
            "is_kendaraan": false
          },
        if (formKey.currentState!.value['agunan_cash'] == true)
          {
            "kode_agunan": 5,
            "jenis_agunan": "Cash Collateral",
            "is_tanah": false,
            "is_los": false,
            "is_kendaraan": false
          },
        if (formKey.currentState!.value['agunan_los'] == true)
          {
            "kode_agunan": 6,
            "jenis_agunan": "Kios Pasar",
            "is_tanah": false,
            "is_los": true,
            "is_kendaraan": false
          },
        if (formKey.currentState!.value['agunan_lainnya'] == true)
          {
            "kode_agunan": 7,
            "jenis_agunan": "Lainnya",
            "is_tanah": false,
            "is_los": false,
            "is_kendaraan": false
          },
      ]
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

  void deleteFirstAgunan(int agunanId, String formName) {
    try {
      isAgunanInputProcessing(true);
      AgunanPilihanProvider().purgeFirstAgunanPilihan(data, agunanId).then(
          (resp) {
        isAgunanInputProcessing(false);
        debiturController.fetchAgunan(data);
        debiturController.fetchOneDebitur(data);
        clearForm(formName);
        Get.snackbar(
          'Sukses',
          'Berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        isAgunanInputProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void clearForm(String formName) {
    formKey.currentState!.fields[formName]?.reset();
  }
}
