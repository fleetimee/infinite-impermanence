// ignore_for_file: unnecessary_overrides

// 📦 Package imports:
import 'package:akm/app/service/input_neraca_service.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  var debitur = TextEditingController();
  final tanggalInput = DateTime.now().obs;

  final formKey = GlobalKey<FormBuilderState>();

  void hitungKasDanBank() {
    final cashOnHandValue = int.parse(cashOnHand.text.replaceAll('.', ''));
    final tabunganValue = int.parse(tabungan.text.replaceAll('.', ''));
    final jumlahKasDanBankValue = cashOnHandValue + tabunganValue;

    jumlahKasDanBank.text = jumlahKasDanBankValue.toString();
  }

  void saveNeraca() {
    final api = InputNeracaService();

    final data = {
      'tanggal_input': tanggalInput.value.toString(),
      'kas_on_hand': cashOnHand.text.replaceAll('.', ''),
      'tabungan': tabungan.text.replaceAll('.', ''),
      'jumlah_kas_dan_tabungan': jumlahKasDanBank.text.replaceAll('.', ''),
      'jumlah_piutang': piutangLainnya.text.replaceAll('.', ''),
      'jumlah_persediaan': persediaan.text.replaceAll('.', ''),
      'hutang_usaha': hutangUsaha.text.replaceAll('.', ''),
      'hutang_bank': hutangBank.text.replaceAll('.', ''),
      'aktiva_tetap': aktivaTetap.text.replaceAll('.', ''),
      'debitur': debitur.text,
    };

    api.addInputNeraca(data);

    update();
  }
}
