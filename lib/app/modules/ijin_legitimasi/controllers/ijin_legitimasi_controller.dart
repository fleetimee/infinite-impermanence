// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/ijin_legitimasi/save_ijin_legitimasi.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';

class IjinLegitimasiController extends GetxController {
  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  final isIjinLegitimasiProcessing = false.obs;

  var jenisIjinLegitimasi = TextEditingController();
  var keteranganIjinLegitimasi = TextEditingController();

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
        patchProgressBar(id);
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
        purgeProgressBar(id);
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
