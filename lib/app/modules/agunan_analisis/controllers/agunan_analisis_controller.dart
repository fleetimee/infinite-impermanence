import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/agunan/agunan_analisa/agunan_analisa.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanAnalisisController extends GetxController {
  var isAnalisaAgunanProcessing = false.obs;

  final data = Get.arguments;

  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  void purgeProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) -
          0.2,
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

  // void getAnalisaAgunan(int id) {
  //   try {
  //     isAnalisaAgunanProcessing(true);
  //     AnalisaAgunanProvider().fetchAnalisaAgunan(id).then((resp) {
  //       isAnalisaAgunanProcessing(false);
  //       listAnalisaAgunan.addAll(resp);
  //     }, onError: (e) {
  //       isAnalisaAgunanProcessing(false);
  //       Get.snackbar('Error', e.toString());
  //     });
  //   } catch (e) {
  //     isAnalisaAgunanProcessing(false);
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  void deleteAgunanAnalisis(int id, int idAgunan) {
    try {
      isAnalisaAgunanProcessing(true);
      AnalisaAgunanProvider().purgeAnalisaAgunan(id, idAgunan).then((resp) {
        isAnalisaAgunanProcessing(false);
        debiturController.fetchOneDebitur(id);
        purgeProgressBar(id);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        isAnalisaAgunanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAnalisaAgunanProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
