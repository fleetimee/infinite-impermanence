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
    initialValue: 0,
  );

  final piutangUsaha = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final piutangLainnya = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final persediaan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final hutangUsaha = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final hutangBank = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final aktivaTetap = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  void hitungKasDanBank() {
    final cashOnHandValue = int.parse(cashOnHand.text.replaceAll('.', ''));
    final tabunganValue = int.parse(tabungan.text.replaceAll('.', ''));
    final jumlahKasDanBankValue = cashOnHandValue + tabunganValue;

    jumlahKasDanBank.text = jumlahKasDanBankValue.toString();
  }

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
