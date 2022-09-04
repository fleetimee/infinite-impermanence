import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PorsekotTableController extends GetxController {
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

  void hitungPorsekot() {
    final parseJangkaWaktu = int.parse(jangkaWaktu.text);
    final parseTurunPokok = int.parse(turunPokok.text);
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
    hitungTable2();
    hitungTable3();
    hitungTable4();
    hitungTable5();
    hitungTable6();
  }

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
    final parseBulan = int.parse(bulan1.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        int.parse(angsuranPokok.text.replaceAll('.', ''));

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
        int.parse(angsuranPokok1.text.replaceAll('.', ''));
    final parseAngsuranBunga1 =
        int.parse(angsuranBunga1.text.replaceAll('.', ''));

    jmlAngsuran1.text =
        (parseAngsuranPokok1 + parseAngsuranBunga1).toStringAsFixed(0);

    print(jmlAngsuran1.text);

    // Hitung sisa saldo
    final parseAngsuranPokok1ForRemainigBalance =
        int.parse(angsuranPokok1.text.replaceAll('.', ''));
    if (parsePlafon - parseAngsuranPokok1ForRemainigBalance < 0) {
      saldo1.text = '0';
    } else {
      saldo1.text = (parsePlafon - parseAngsuranPokok1ForRemainigBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan2
  final bulan2 = TextEditingController(text: '2');
  final tanggal2 = TextEditingController();
  final angsuranPokok2 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga2 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran2 = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo2 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable2() {
    // Iterate Tanggal
    final parseTglBulan1 = DateFormat('dd/MM/yyyy').parse(tanggal1.text);
    final add30Days = parseTglBulan1.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal2.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo1 = int.parse(saldo1.text.replaceAll('.', ''));

    final first = parseSaldo1 * 31 / 360 * parseSukuBunga;

    angsuranBunga2.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan2.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        int.parse(angsuranPokok.text.replaceAll('.', ''));

    if (parseSaldo1.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok2.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok2.text = '0';
      }
    } else {
      angsuranPokok2.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok2 =
        int.parse(angsuranPokok2.text.replaceAll('.', ''));
    final parseAngsuranBunga2 =
        int.parse(angsuranBunga2.text.replaceAll('.', ''));

    jmlAngsuran2.text =
        (parseAngsuranPokok2 + parseAngsuranBunga2).toStringAsFixed(0);

    print(jmlAngsuran2.text);
    // Hitung sisa saldo
    final parseAngsuranPokok2ForRemainingBalance =
        int.parse(angsuranPokok2.text.replaceAll('.', ''));

    if (parseSaldo1 - parseAngsuranPokok2ForRemainingBalance < 0) {
      saldo2.text = '0';
    } else {
      saldo2.text = (parseSaldo1 - parseAngsuranPokok2ForRemainingBalance)
          .toStringAsFixed(0);

      print(saldo2.text);
    }
  }

  // Bulan3
  final bulan3 = TextEditingController(text: '3');
  final tanggal3 = TextEditingController();
  final angsuranPokok3 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga3 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran3 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo3 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable3() {
    // Iterate Tanggal
    final parseTglBulan2 = DateFormat('dd/MM/yyyy').parse(tanggal2.text);
    final add30Days = parseTglBulan2.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal3.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo2 = int.parse(saldo2.text.replaceAll('.', ''));

    final first = parseSaldo2 * 31 / 360 * parseSukuBunga;

    angsuranBunga3.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan3.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        int.parse(angsuranPokok.text.replaceAll('.', ''));

    if (parseSaldo2.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok3.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok3.text = '0';
      }
    } else {
      angsuranPokok3.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok3 =
        int.parse(angsuranPokok3.text.replaceAll('.', ''));
    final parseAngsuranBunga3 =
        int.parse(angsuranBunga3.text.replaceAll('.', ''));

    jmlAngsuran3.text =
        (parseAngsuranPokok3 + parseAngsuranBunga3).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok3ForRemainingBalance =
        int.parse(angsuranPokok3.text.replaceAll('.', ''));

    if (parseSaldo2 - parseAngsuranPokok3ForRemainingBalance < 0) {
      saldo3.text = '0';
    } else {
      saldo3.text = (parseSaldo2 - parseAngsuranPokok3ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan4
  final bulan4 = TextEditingController(text: '4');
  final tanggal4 = TextEditingController();
  final angsuranPokok4 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga4 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran4 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo4 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable4() {
    // Iterate Tanggal
    final parseTglBulan3 = DateFormat('dd/MM/yyyy').parse(tanggal3.text);
    final add30Days = parseTglBulan3.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal4.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo3 = int.parse(saldo3.text.replaceAll('.', ''));

    final first = parseSaldo3 * 31 / 360 * parseSukuBunga;

    angsuranBunga4.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan4.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        int.parse(angsuranPokok.text.replaceAll('.', ''));

    if (parseSaldo3.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok4.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok4.text = '0';
      }
    } else {
      angsuranPokok4.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok4 =
        int.parse(angsuranPokok4.text.replaceAll('.', ''));
    final parseAngsuranBunga4 =
        int.parse(angsuranBunga4.text.replaceAll('.', ''));

    jmlAngsuran4.text =
        (parseAngsuranPokok4 + parseAngsuranBunga4).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok4ForRemainingBalance =
        int.parse(angsuranPokok4.text.replaceAll('.', ''));

    if (parseSaldo3 - parseAngsuranPokok4ForRemainingBalance < 0) {
      saldo4.text = '0';
    } else {
      saldo4.text = (parseSaldo3 - parseAngsuranPokok4ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan5
  final bulan5 = TextEditingController(text: '5');
  final tanggal5 = TextEditingController();
  final angsuranPokok5 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga5 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran5 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo5 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable5() {
    // Iterate Tanggal
    final parseTglBulan4 = DateFormat('dd/MM/yyyy').parse(tanggal4.text);
    final add30Days = parseTglBulan4.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal5.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo4 = int.parse(saldo4.text.replaceAll('.', ''));

    final first = parseSaldo4 * 31 / 360 * parseSukuBunga;

    angsuranBunga5.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan5.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        int.parse(angsuranPokok.text.replaceAll('.', ''));

    if (parseSaldo4.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok5.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok5.text = '0';
      }
    } else {
      angsuranPokok5.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok5 =
        int.parse(angsuranPokok5.text.replaceAll('.', ''));
    final parseAngsuranBunga5 =
        int.parse(angsuranBunga5.text.replaceAll('.', ''));

    jmlAngsuran5.text =
        (parseAngsuranPokok5 + parseAngsuranBunga5).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok5ForRemainingBalance =
        int.parse(angsuranPokok5.text.replaceAll('.', ''));

    if (parseSaldo4 - parseAngsuranPokok5ForRemainingBalance < 0) {
      saldo5.text = '0';
    } else {
      saldo5.text = (parseSaldo4 - parseAngsuranPokok5ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan6
  final bulan6 = TextEditingController(text: '6');
  final tanggal6 = TextEditingController();
  final angsuranPokok6 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga6 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran6 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo6 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable6() {
    // Iterate Tanggal
    final parseTglBulan5 = DateFormat('dd/MM/yyyy').parse(tanggal5.text);
    final add30Days = parseTglBulan5.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal6.text = hasil.toString();

    // Hitung bunga
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo5 = int.parse(saldo5.text.replaceAll('.', ''));

    final first = parseSaldo5 * 31 / 360 * parseSukuBunga;

    angsuranBunga6.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan6.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        int.parse(angsuranPokok.text.replaceAll('.', ''));

    if (parseSaldo5.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok6.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok6.text = '0';
      }
    } else {
      angsuranPokok6.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok6 =
        int.parse(angsuranPokok6.text.replaceAll('.', ''));
    final parseAngsuranBunga6 =
        int.parse(angsuranBunga6.text.replaceAll('.', ''));

    jmlAngsuran6.text =
        (parseAngsuranPokok6 + parseAngsuranBunga6).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok6ForRemainingBalance =
        int.parse(angsuranPokok6.text.replaceAll('.', ''));

    if (parseSaldo5 - parseAngsuranPokok6ForRemainingBalance < 0) {
      saldo6.text = '0';
    } else {
      saldo6.text = (parseSaldo5 - parseAngsuranPokok6ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  final sistemAngsuran = [
    'Efektif',
    'Flat',
  ];
}
