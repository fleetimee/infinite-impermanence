import 'package:akm/app/data/provider/agunan/agunan_cash/agunan_cash.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_kendaraan/agunan_kendaraaan.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_lainnya/agunan_lainnya.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_los/agunan_los.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_peralatan/agunan_peralatan.provider.dart';
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
    getAllAgunanTanahAnalisis(data[0].id ?? 0);
    getAllAgunanTanahBangunanAnalisis(data[1].id ?? 0);
    getAllAgunanKendaraanAnalisis(data[2].id ?? 0);
    getAllAgunanPeralatanAnalisis(data[3].id ?? 0);
    getAllAgunanCashAnalisis(data[4].id ?? 0);
    getAllAgunanLosAnalisis(data[5].id ?? 0);
    getAllAgunanLainnyaAnalisis(data[6].id ?? 0);
  }

  final data = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  var kreditYangDiajukan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: ',', precision: 0);
  var totalAgunanTanah = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanTanahBangunan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanKendaraan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanPeralatan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanCash = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanLos = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanLainnya = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var grandTotal = MoneyMaskedTextController(
      thousandSeparator: '.',
      decimalSeparator: '',
      precision: 0,
      initialValue: 0);
  var ratioAgunan = TextEditingController(text: '0');
  var crrAgunan = TextEditingController(text: '0');

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

  var listAgunanKendaraanAnalisis =
      List<FormKendaraan>.empty(growable: true).obs;
  final isAgunanKendaraanAnalisisProcessing = false.obs;
  void getAllAgunanKendaraanAnalisis(int id) {
    try {
      isAgunanKendaraanAnalisisProcessing(true);
      AgunanKendaraanProvider().fetchAgunanKendaraan(id).then((resp) {
        isAgunanKendaraanAnalisisProcessing(false);
        listAgunanKendaraanAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanKendaraanAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanKendaraanAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanPeralatanAnalisis = List<FormCommon>.empty(growable: true).obs;
  final isAgunanPeralatanAnalisisProcessing = false.obs;
  void getAllAgunanPeralatanAnalisis(int id) {
    try {
      isAgunanPeralatanAnalisisProcessing(true);
      AgunanPeralatanProvider().fetchAgunanPeralatan(id).then((resp) {
        isAgunanPeralatanAnalisisProcessing(false);
        listAgunanPeralatanAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanPeralatanAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanPeralatanAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanCashAnalisis = List<FormCommon>.empty(growable: true).obs;
  final isAgunanCashAnalisisProcessing = false.obs;
  void getAllAgunanCashAnalisis(int id) {
    try {
      isAgunanCashAnalisisProcessing(true);
      AgunanCashProvider().fetchAgunanCash(id).then((resp) {
        isAgunanCashAnalisisProcessing(false);
        listAgunanCashAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanCashAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanCashAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanLosAnalisis = List<FormLo>.empty(growable: true).obs;
  final isAgunanLosAnalisisProcessing = false.obs;
  void getAllAgunanLosAnalisis(int id) {
    try {
      isAgunanLosAnalisisProcessing(true);
      AgunanLosProvider().fetchAgunanLos(id).then((resp) {
        isAgunanLosAnalisisProcessing(false);
        listAgunanLosAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanLosAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLosAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanLainnyaAnalisis = List<FormCommon>.empty(growable: true).obs;
  final isAgunanLainnyaAnalisisProcessing = false.obs;
  void getAllAgunanLainnyaAnalisis(int id) {
    try {
      isAgunanLainnyaAnalisisProcessing(true);
      AgunanLainnyaProvider().fetchAgunanLainnya(id).then((resp) {
        isAgunanLainnyaAnalisisProcessing(false);
        listAgunanLainnyaAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanLainnyaAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLainnyaAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void hitungGrandTotal() {
    final parseAgunanTanah =
        double.parse(totalAgunanTanah.text.replaceAll('.', ''));
    final parseAgunanTanahBangunan =
        double.parse(totalAgunanTanahBangunan.text.replaceAll('.', ''));
    final parseAgunanKendaraan =
        double.parse(totalAgunanKendaraan.text.replaceAll('.', ''));
    final parseAgunanPeralatan =
        double.parse(totalAgunanPeralatan.text.replaceAll('.', ''));
    final parseAgunanCash =
        double.parse(totalAgunanCash.text.replaceAll('.', ''));
    final parseAgunanLos =
        double.parse(totalAgunanLos.text.replaceAll('.', ''));
    final parseAgunanLainnya =
        double.parse(totalAgunanLainnya.text.replaceAll('.', ''));

    final result = parseAgunanTanah +
        parseAgunanTanahBangunan +
        parseAgunanKendaraan +
        parseAgunanPeralatan +
        parseAgunanCash +
        parseAgunanLos +
        parseAgunanLainnya;

    grandTotal.text = result.toStringAsFixed(0);
  }

  void hitungRatioDanCrr() {
    // Parse kredit yang diusulkan
    final parseKredit =
        double.parse(kreditYangDiajukan.text.replaceAll('.', ''));

    // Parse grand total
    final parseGrandTotal = double.parse(grandTotal.text.replaceAll('.', ''));

    // Ratio
    final ratio = parseGrandTotal / (parseKredit / 100);

    // Result ratio
    ratioAgunan.text = ratio.toStringAsFixed(1);

    // Get CRR From ratio
    if (ratio < 0) {
      crrAgunan.text = '0';
    } else if (ratio > 150) {
      crrAgunan.text = '95.0';
    } else {
      final a = ratio - 30;
      const b = 150 - 30;
      const c = 95 - 65;

      final d = a / b;
      final e = d * c;

      final result = e + 65;

      crrAgunan.text = result.toStringAsFixed(1);
    }
  }
}
