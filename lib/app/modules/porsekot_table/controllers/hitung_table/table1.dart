// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/porsekot_table/controllers/porsekot_table_controller.dart';

class Table1 extends GetxController {
  final controller = Get.put(PorsekotTableController());

  // Bulan1
  final bulan1 = TextEditingController(text: '1');
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

  void hitungTable1() {
    // Iterate Tanggal
    final parseTglMulaiKredit =
        DateFormat('yyyy MM dd').parse(controller.tglMulaiKredit.value);
    final add30Days = parseTglMulaiKredit.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal1.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(controller.sukuBunga.text) / 100;
    final parsePlafon =
        double.parse(controller.plafon.text.replaceAll('.', ''));

    final first = parsePlafon * 31 / 360 * parseSukuBunga;

    angsuranBunga1.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan1.text);
    final parseTurunPokok = int.parse(controller.turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(controller.angsuranPokok.text.replaceAll('.', ''));

    if (parsePlafon.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok1.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok1.text = '0';
      }
    } else {
      angsuranPokok1.text = '0';
    }

    // Hitung Jml Angsuran
    final parseAngsuranPokok1 =
        double.parse(angsuranPokok1.text.replaceAll('.', ''));
    final parseAngsuranBunga1 =
        double.parse(angsuranBunga1.text.replaceAll('.', ''));

    final hasilAngsuran = parseAngsuranPokok1 + parseAngsuranBunga1;

    // Rounding down to 0.1
    final hasilAngsuranToFloor = hasilAngsuran.floorToDouble();

    jmlAngsuran1.text = (hasilAngsuranToFloor).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok1ForRemainigBalance =
        double.parse(angsuranPokok1.text.replaceAll('.', ''));
    if (parsePlafon - parseAngsuranPokok1ForRemainigBalance < 0) {
      saldo1.text = '0';
    } else {
      saldo1.text = (parsePlafon - parseAngsuranPokok1ForRemainigBalance)
          .toStringAsFixed(0);
    }
  }
}
