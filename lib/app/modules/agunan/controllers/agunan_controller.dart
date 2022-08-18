// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  // dispose getx
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  // Key for checkbox tanah
  final checkboxTanahKey = GlobalKey<FormBuilderState>();
  final checkboxTanahDeskripsiKey = GlobalKey<FormBuilderState>();

  RxBool isCheckedTanah = false.obs;

  final isCheckedTanahAndBangunan = false.obs;
  final isCheckedMesinAndPeralatan = false.obs;
  final isCheckedKendaraan = false.obs;
  final isCheckedCashCollateral = false.obs;
  final isCheckedKios = false.obs;
  final isCheckedLainnya = false.obs;
  final isExpanded = false.obs;
  final resultRatio = 0.0.obs;
  final crr = 0.0.obs;

  final tanahInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final tanahAndBangunanInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final mesinAndPeralatanInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final kendaraanInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final cashCollateralInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final kiosInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final lainnyaInput = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final totalNilaiAgunan = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final kredit = MoneyMaskedTextController(
    initialValue: 8500000,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Indonesia Currency Input Formatter as List
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter();

  void hitungTotalAgunan() {
    final parseTanahInput = int.parse(tanahInput.text.replaceAll('.', ''));
    final parseTanahDanBangunanInput =
        int.parse(tanahAndBangunanInput.text.replaceAll('.', ''));
    final parseMesinAndPeralatanInput =
        int.parse(mesinAndPeralatanInput.text.replaceAll('.', ''));
    final parseKendaraanInput =
        int.parse(kendaraanInput.text.replaceAll('.', ''));
    final parseCashCollateralInput =
        int.parse(cashCollateralInput.text.replaceAll('.', ''));
    final parseKiosInput = int.parse(kiosInput.text.replaceAll('.', ''));
    final parseLainnyaInput = int.parse(lainnyaInput.text.replaceAll('.', ''));

    final totalAgunan = parseTanahInput +
        parseTanahDanBangunanInput +
        parseMesinAndPeralatanInput +
        parseKendaraanInput +
        parseCashCollateralInput +
        parseKiosInput +
        parseLainnyaInput;

    totalNilaiAgunan.text = totalAgunan.toString();
  }

  // void reset() {
  //   tanahInput?.text = '0';
  //   tanahAndBangunanInput?.text = '0';
  //   mesinAndPeralatanInput?.text = '0';
  //   kendaraanInput?.text = '0';
  //   cashCollateralInput?.text = '0';
  //   kiosInput?.text = '0';
  //   lainnyaInput?.text = '0';
  //   totalNilaiAgunan?.text = '0';
  // }

  void hitungRatio() {
    final parseKredit = int.parse(kredit.text.replaceAll('.', ''));
    final parseTotalAgunan =
        int.parse(totalNilaiAgunan.text.replaceAll('.', ''));

    // Get kreditValue remainder
    final ratio = parseTotalAgunan / (parseKredit / 100);
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
