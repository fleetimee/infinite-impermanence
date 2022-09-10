// ignore_for_file: unnecessary_overrides

// 📦 Package imports:
import 'package:akm/app/service/input_neraca_service.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class InputNeracaController extends GetxController {
  var cashOnHand = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var tabungan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var jumlahKasDanBank = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
    initialValue: 0,
  );
  var piutangUsaha = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var piutangLainnya = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var persediaan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var hutangUsaha = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var hutangBank = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var aktivaTetap = MoneyMaskedTextController(
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

  void updateNeraca(String id) async {
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
    };

    await api.editInputNeraca(id, data);

    update();
  }
}
