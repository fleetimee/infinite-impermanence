// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/asuransi/save_asuransi.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';

class AsuransiController extends GetxController {
  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  final isAsuransiProcessing = false.obs;

  var premi = TextEditingController();
  var namaPerusahaan = TextEditingController();
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
      'nama_perusahaan': namaPerusahaan.text,
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
      'nama_perusahaan': namaPerusahaan.text,
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

  String namaPerusahaanDeskripsi =
      'Tuliskan nama perusahaan asuransi yang akan digunakan, contoh: ASKRINDO, JAMKRINDO dll, inputtan ini akan dicetak ke dalam usulan dan putusan';
  String premiDeskripsi =
      "Persen premi yang digunakan untuk menghitung jumlah asuransi, contoh: 0.5% = 0.5, 1% = 1, 1.5% = 1.5 dll, inputtan ini akan dicetak ke dalam usulan dan putusan";
  String plafonKreditDeskripsi =
      "Nilai ini berasal dari input keuangan yang sebelumnnya sudah diinputkan";
  String hasil =
      "Hasil dari perhitungan premi dan plafon kredit, inputtan ini akan dicetak ke dalam usulan dan putusan";

  void clearForm() {
    premi.clear();
    plafonKredit.clear();
    jumlahAsuransi.clear();
  }
}
