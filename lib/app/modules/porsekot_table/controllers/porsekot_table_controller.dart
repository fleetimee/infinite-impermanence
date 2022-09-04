import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PorsekotTableController extends GetxController {
  void hitungPorsekot() {
    final parseJangkaWaktu = int.parse(jangkaWaktu.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    // final parseAngsuranPokok =
    //     int.parse(angsuranPokok.text.replaceAll('.', ''));
    final parsePlafon = int.parse(plafon.text.replaceAll('.', ''));

    // Hitung Jumlah Bayar
    final jumlahBayarResult = parseJangkaWaktu / parseTurunPokok;

    jumlahBayar.text = jumlahBayarResult.toStringAsFixed(0);

    // Hitung Angsuran Pokok
    final angsuranPokokResult = parsePlafon / jumlahBayarResult;

    angsuranPokok.text = angsuranPokokResult.toStringAsFixed(0);

    hitungTable1();
  }

  void hitungTable1() {
    // Iterate Tanggal
    final parseTglMulaiKredit =
        DateFormat('yyyy MM dd').parse(tglMulaiKredit.value);
    final add30Days = parseTglMulaiKredit.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal1.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parsePlafon = int.parse(plafon.text.replaceAll('.', ''));

    final first = parsePlafon * 31 / 360 * parseSukuBunga;

    angsuranBunga1.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
  }

  final sistemAngsuran = [
    'Efektif',
    'Flat',
  ];

  final metodeBunga = ''.obs;
  final jangkaWaktu = TextEditingController();
  final turunPokok = TextEditingController();
  final sukuBunga = TextEditingController();
  final tglMulaiKredit = ''.obs;
  final jumlahBayar = TextEditingController();
  final angsuranPokok = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final plafon = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final nomor1 = TextEditingController();
  final tanggal1 = TextEditingController();
  final angsuranPokok1 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga1 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran1 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo1 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
}
