// ignore_for_file: unnecessary_overrides

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgunanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  final isCheckedTanah = false.obs;
  final isCheckedTanahAndBangunan = false.obs;
  final isCheckedMesinAndPeralatan = false.obs;
  final isCheckedKendaraan = false.obs;
  final isCheckedCashCollateral = false.obs;
  final isCheckedKios = false.obs;
  final isCheckedLainnya = false.obs;
  final isExpanded = false.obs;
  final resultRatio = 0.0.obs;
  final crr = 0.0.obs;

  TextEditingController? tanahInput = TextEditingController(text: '0');
  TextEditingController? tanahAndBangunanInput =
      TextEditingController(text: '0');
  TextEditingController? mesinAndPeralatanInput =
      TextEditingController(text: '0');
  TextEditingController? kendaraanInput = TextEditingController(text: '0');
  TextEditingController? cashCollateralInput = TextEditingController(text: '0');
  TextEditingController? kiosInput = TextEditingController(text: '0');
  TextEditingController? lainnyaInput = TextEditingController(text: '0');
  TextEditingController? totalNilaiAgunan = TextEditingController(text: '0');
  TextEditingController? kredit = TextEditingController(text: '8500000');

  // Indonesia Currency Input Formatter as List
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter();

  void hitungTotalAgunan() {
    final tanah = int.tryParse(tanahInput?.text ?? '');
    int? tanahAndBangunan = int.tryParse(tanahAndBangunanInput?.text ?? '');
    int? mesinAndPeralatan = int.tryParse(mesinAndPeralatanInput?.text ?? '');
    int? kendaraan = int.tryParse(kendaraanInput?.text ?? '');
    int? cashCollateral = int.tryParse(cashCollateralInput?.text ?? '');
    int? kios = int.tryParse(kiosInput?.text ?? '');
    int? lainnya = int.tryParse(lainnyaInput?.text ?? '');

    // Sum all the values
    final totalAgunan = tanah! +
        tanahAndBangunan! +
        mesinAndPeralatan! +
        kendaraan! +
        cashCollateral! +
        kios! +
        lainnya!;

    totalNilaiAgunan?.text = totalAgunan.toString();
  }

  void hitungRatio() {
    final kreditValue = int.tryParse(kredit?.text ?? '');
    final totalAgunan = int.tryParse(totalNilaiAgunan?.text ?? '');

    // Get kreditValue remainder
    final ratio = totalAgunan! / (kreditValue! / 100);
    resultRatio.value = ratio;

    if (resultRatio.value <= 125.0) {
      crr.value = 0;
    }

    if (resultRatio.value > 125.0 && resultRatio.value <= 150.0) {
      crr.value = 65.0;
    }

    if (resultRatio.value > 150.0) {
      crr.value = 95.0;
    }
  }

  // Tab Controller
  TabController? tabController;
}
