import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/agunan/agunan_analisa/agunan_analisa.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AgunanAnalisisController extends GetxController {
  var isAnalisaAgunanProcessing = false.obs;

  final data = Get.arguments;

  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

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
        Future.delayed(const Duration(seconds: 1), () {
          purgeProgressBar(id);
        });
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          title: 'Sukses',
          bodyHeaderDistance: 25,
          desc: 'Data berhasil dihapus',
          dismissOnTouchOutside: false,
          btnOkOnPress: () {},
        ).show();
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
