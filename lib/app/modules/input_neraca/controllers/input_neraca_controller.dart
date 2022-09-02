// ignore_for_file: unnecessary_overrides

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:get/get.dart';

class InputNeracaController extends GetxController {
  final cashOnHand = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final tabungan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final jumlahKasDanBank = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
