// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:finance/finance.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PorsekotTableController extends GetxController {
  final metodeBunga = ''.obs;
  final jangkaWaktu = TextEditingController(text: '0');
  final turunPokok = TextEditingController();
  final sukuBunga = TextEditingController();
  final tglMulaiKredit = ''.obs;
  final jumlahBayar = TextEditingController();
  final angsuranPokok = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final sumAngsuranPokok = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final sumAngsuranBunga = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final sumAngsuranTotal = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final rerataPerbulan = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final umum = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final selisih = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final bungaKeseluruhan = TextEditingController();
  final bungaFinal = TextEditingController();
  final plafon = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  void warning() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Perhatian',
      desc:
          'Simulasi Angsuran ini tidak mengikat ke debitur manapun, perhitungan ini hanya untuk simulasi secara standalone saja, jika ingin menghitung Angsuran untuk debitur silahkan masuk ke menu Debitur pada halaman Homepage.',
      dialogBackgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.poppins(
        color: secondaryColor,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      descTextStyle: GoogleFonts.poppins(
        color: secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      btnOkOnPress: () {},
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      btnOkText: 'Baik, saya mengerti',
    ).show();
  }

  @override
  void onReady() {
    warning();
    super.onReady();
  }

  final sistemAngsuran = [
    'Efektif',
    'Flat',
  ];

  void hitungPorsekot() {
    final parseJangkaWaktu = int.parse(jangkaWaktu.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    // final parseAngsuranPokok =
    //     int.parse(angsuranPokok.text.replaceAll('.', ''));
    final parsePlafon = double.parse(plafon.text.replaceAll('.', ''));

    // Hitung Jumlah Bayar
    final jumlahBayarResult = parseJangkaWaktu / parseTurunPokok;

    jumlahBayar.text = jumlahBayarResult.toStringAsFixed(0);

    // Hitung Angsuran Pokok
    final angsuranPokokResult = parsePlafon / jumlahBayarResult;

    angsuranPokok.text = angsuranPokokResult.toStringAsFixed(0);

    // Table1().hitungTable1();

    hitungTable1();
    hitungTable2();
    hitungTable3();
    hitungTable4();
    hitungTable5();
    hitungTable6();
    hitungTable7();
    hitungTable8();
    hitungTable9();
    hitungTable10();
    hitungTable11();
    hitungTable12();
    hitungTable13();
    hitungTable14();
    hitungTable15();
    hitungTable16();
    hitungTable17();
    hitungTable18();
    hitungTable19();
    hitungTable20();
    hitungTable21();
    hitungTable22();
    hitungTable23();
    hitungTable24();
    hitungTable25();
    hitungTable26();
    hitungTable27();
    hitungTable28();
    hitungTable29();
    hitungTable30();
    hitungTable31();
    hitungTable32();
    hitungTable33();
    hitungTable34();
    hitungTable35();
    hitungTable36();
    hitungTable37();
    hitungTable38();
    hitungTable39();
    hitungTable40();
    hitungTable41();
    hitungTable42();
    hitungTable43();
    hitungTable44();
    hitungTable45();
    hitungTable46();
    hitungTable47();
    hitungTable48();

    final parseAngsuranBunga1 =
        double.parse(angsuranBunga1.text.replaceAll('.', ''));
    final parseAngsuranBunga2 =
        double.parse(angsuranBunga2.text.replaceAll('.', ''));
    final parseAngsuranBunga3 =
        double.parse(angsuranBunga3.text.replaceAll('.', ''));
    final parseAngsuranBunga4 =
        double.parse(angsuranBunga4.text.replaceAll('.', ''));
    final parseAngsuranBunga5 =
        double.parse(angsuranBunga5.text.replaceAll('.', ''));
    final parseAngsuranBunga6 =
        double.parse(angsuranBunga6.text.replaceAll('.', ''));
    final parseAngsuranBunga7 =
        double.parse(angsuranBunga7.text.replaceAll('.', ''));
    final parseAngsuranBunga8 =
        double.parse(angsuranBunga8.text.replaceAll('.', ''));
    final parseAngsuranBunga9 =
        double.parse(angsuranBunga9.text.replaceAll('.', ''));
    final parseAngsuranBunga10 =
        double.parse(angsuranBunga10.text.replaceAll('.', ''));
    final parseAngsuranBunga11 =
        double.parse(angsuranBunga11.text.replaceAll('.', ''));
    final parseAngsuranBunga12 =
        double.parse(angsuranBunga12.text.replaceAll('.', ''));
    final parseAngsuranBunga13 =
        double.parse(angsuranBunga13.text.replaceAll('.', ''));
    final parseAngsuranBunga14 =
        double.parse(angsuranBunga14.text.replaceAll('.', ''));
    final parseAngsuranBunga15 =
        double.parse(angsuranBunga15.text.replaceAll('.', ''));
    final parseAngsuranBunga16 =
        double.parse(angsuranBunga16.text.replaceAll('.', ''));
    final parseAngsuranBunga17 =
        double.parse(angsuranBunga17.text.replaceAll('.', ''));
    final parseAngsuranBunga18 =
        double.parse(angsuranBunga18.text.replaceAll('.', ''));
    final parseAngsuranBunga19 =
        double.parse(angsuranBunga19.text.replaceAll('.', ''));
    final parseAngsuranBunga20 =
        double.parse(angsuranBunga20.text.replaceAll('.', ''));
    final parseAngsuranBunga21 =
        double.parse(angsuranBunga21.text.replaceAll('.', ''));
    final parseAngsuranBunga22 =
        double.parse(angsuranBunga22.text.replaceAll('.', ''));
    final parseAngsuranBunga23 =
        double.parse(angsuranBunga23.text.replaceAll('.', ''));
    final parseAngsuranBunga24 =
        double.parse(angsuranBunga24.text.replaceAll('.', ''));
    final parseAngsuranBunga25 =
        double.parse(angsuranBunga25.text.replaceAll('.', ''));
    final parseAngsuranBunga26 =
        double.parse(angsuranBunga26.text.replaceAll('.', ''));
    final parseAngsuranBunga27 =
        double.parse(angsuranBunga27.text.replaceAll('.', ''));
    final parseAngsuranBunga28 =
        double.parse(angsuranBunga28.text.replaceAll('.', ''));
    final parseAngsuranBunga29 =
        double.parse(angsuranBunga29.text.replaceAll('.', ''));
    final parseAngsuranBunga30 =
        double.parse(angsuranBunga30.text.replaceAll('.', ''));
    final parseAngsuranBunga31 =
        double.parse(angsuranBunga31.text.replaceAll('.', ''));
    final parseAngsuranBunga32 =
        double.parse(angsuranBunga32.text.replaceAll('.', ''));
    final parseAngsuranBunga33 =
        double.parse(angsuranBunga33.text.replaceAll('.', ''));
    final parseAngsuranBunga34 =
        double.parse(angsuranBunga34.text.replaceAll('.', ''));
    final parseAngsuranBunga35 =
        double.parse(angsuranBunga35.text.replaceAll('.', ''));
    final parseAngsuranBunga36 =
        double.parse(angsuranBunga36.text.replaceAll('.', ''));
    final parseAngsuranBunga37 =
        double.parse(angsuranBunga37.text.replaceAll('.', ''));
    final parseAngsuranBunga38 =
        double.parse(angsuranBunga38.text.replaceAll('.', ''));
    final parseAngsuranBunga39 =
        double.parse(angsuranBunga39.text.replaceAll('.', ''));
    final parseAngsuranBunga40 =
        double.parse(angsuranBunga40.text.replaceAll('.', ''));
    final parseAngsuranBunga41 =
        double.parse(angsuranBunga41.text.replaceAll('.', ''));
    final parseAngsuranBunga42 =
        double.parse(angsuranBunga42.text.replaceAll('.', ''));
    final parseAngsuranBunga43 =
        double.parse(angsuranBunga43.text.replaceAll('.', ''));
    final parseAngsuranBunga44 =
        double.parse(angsuranBunga44.text.replaceAll('.', ''));
    final parseAngsuranBunga45 =
        double.parse(angsuranBunga45.text.replaceAll('.', ''));
    final parseAngsuranBunga46 =
        double.parse(angsuranBunga46.text.replaceAll('.', ''));
    final parseAngsuranBunga47 =
        double.parse(angsuranBunga47.text.replaceAll('.', ''));
    final parseAngsuranBunga48 =
        double.parse(angsuranBunga48.text.replaceAll('.', ''));

    final hasilSumAngsuranBunga = parseAngsuranBunga1 +
        parseAngsuranBunga2 +
        parseAngsuranBunga3 +
        parseAngsuranBunga4 +
        parseAngsuranBunga5 +
        parseAngsuranBunga6 +
        parseAngsuranBunga7 +
        parseAngsuranBunga8 +
        parseAngsuranBunga9 +
        parseAngsuranBunga10 +
        parseAngsuranBunga11 +
        parseAngsuranBunga12 +
        parseAngsuranBunga13 +
        parseAngsuranBunga14 +
        parseAngsuranBunga15 +
        parseAngsuranBunga16 +
        parseAngsuranBunga17 +
        parseAngsuranBunga18 +
        parseAngsuranBunga19 +
        parseAngsuranBunga20 +
        parseAngsuranBunga21 +
        parseAngsuranBunga22 +
        parseAngsuranBunga23 +
        parseAngsuranBunga24 +
        parseAngsuranBunga25 +
        parseAngsuranBunga26 +
        parseAngsuranBunga27 +
        parseAngsuranBunga28 +
        parseAngsuranBunga29 +
        parseAngsuranBunga30 +
        parseAngsuranBunga31 +
        parseAngsuranBunga32 +
        parseAngsuranBunga33 +
        parseAngsuranBunga34 +
        parseAngsuranBunga35 +
        parseAngsuranBunga36 +
        parseAngsuranBunga37 +
        parseAngsuranBunga38 +
        parseAngsuranBunga39 +
        parseAngsuranBunga40 +
        parseAngsuranBunga41 +
        parseAngsuranBunga42 +
        parseAngsuranBunga43 +
        parseAngsuranBunga44 +
        parseAngsuranBunga45 +
        parseAngsuranBunga46 +
        parseAngsuranBunga47 +
        parseAngsuranBunga48;

    // Rounded to nearest 1000
    // final hasilSumAngsuranBungaRounded =
    //     (hasilSumAngsuranBunga / 1000).round() * 1000;

    sumAngsuranBunga.text = hasilSumAngsuranBunga.toStringAsFixed(0);

    // sumAngsuranBunga.text = (parseAngsuranBunga1 +
    //         parseAngsuranBunga2 +
    //         parseAngsuranBunga3 +
    //         parseAngsuranBunga4 +
    //         parseAngsuranBunga5 +
    //         parseAngsuranBunga6 +
    //         parseAngsuranBunga7 +
    //         parseAngsuranBunga8 +
    //         parseAngsuranBunga9 +
    //         parseAngsuranBunga10 +
    //         parseAngsuranBunga11 +
    //         parseAngsuranBunga12 +
    //         parseAngsuranBunga13 +
    //         parseAngsuranBunga14 +
    //         parseAngsuranBunga15 +
    //         parseAngsuranBunga16 +
    //         parseAngsuranBunga17 +
    //         parseAngsuranBunga18 +
    //         parseAngsuranBunga19 +
    //         parseAngsuranBunga20 +
    //         parseAngsuranBunga21 +
    //         parseAngsuranBunga22 +
    //         parseAngsuranBunga23 +
    //         parseAngsuranBunga24 +
    //         parseAngsuranBunga25 +
    //         parseAngsuranBunga26 +
    //         parseAngsuranBunga27 +
    //         parseAngsuranBunga28 +
    //         parseAngsuranBunga29 +
    //         parseAngsuranBunga30 +
    //         parseAngsuranBunga31 +
    //         parseAngsuranBunga32 +
    //         parseAngsuranBunga33 +
    //         parseAngsuranBunga34 +
    //         parseAngsuranBunga35 +
    //         parseAngsuranBunga36 +
    //         parseAngsuranBunga37 +
    //         parseAngsuranBunga38 +
    //         parseAngsuranBunga39 +
    //         parseAngsuranBunga40 +
    //         parseAngsuranBunga41 +
    //         parseAngsuranBunga42 +
    //         parseAngsuranBunga43 +
    //         parseAngsuranBunga44 +
    //         parseAngsuranBunga45 +
    //         parseAngsuranBunga46 +
    //         parseAngsuranBunga47 +
    //         parseAngsuranBunga48)
    //     .toStringAsFixed(0);

    final parseAngsuranPokok1 =
        double.parse(angsuranPokok1.text.replaceAll('.', ''));
    final parseAngsuranPokok2 =
        double.parse(angsuranPokok2.text.replaceAll('.', ''));
    final parseAngsuranPokok3 =
        double.parse(angsuranPokok3.text.replaceAll('.', ''));
    final parseAngsuranPokok4 =
        double.parse(angsuranPokok4.text.replaceAll('.', ''));
    final parseAngsuranPokok5 =
        double.parse(angsuranPokok5.text.replaceAll('.', ''));
    final parseAngsuranPokok6 =
        double.parse(angsuranPokok6.text.replaceAll('.', ''));
    final parseAngsuranPokok7 =
        double.parse(angsuranPokok7.text.replaceAll('.', ''));
    final parseAngsuranPokok8 =
        double.parse(angsuranPokok8.text.replaceAll('.', ''));
    final parseAngsuranPokok9 =
        double.parse(angsuranPokok9.text.replaceAll('.', ''));
    final parseAngsuranPokok10 =
        double.parse(angsuranPokok10.text.replaceAll('.', ''));
    final parseAngsuranPokok11 =
        double.parse(angsuranPokok11.text.replaceAll('.', ''));
    final parseAngsuranPokok12 =
        double.parse(angsuranPokok12.text.replaceAll('.', ''));
    final parseAngsuranPokok13 =
        double.parse(angsuranPokok13.text.replaceAll('.', ''));
    final parseAngsuranPokok14 =
        double.parse(angsuranPokok14.text.replaceAll('.', ''));
    final parseAngsuranPokok15 =
        double.parse(angsuranPokok15.text.replaceAll('.', ''));
    final parseAngsuranPokok16 =
        double.parse(angsuranPokok16.text.replaceAll('.', ''));
    final parseAngsuranPokok17 =
        double.parse(angsuranPokok17.text.replaceAll('.', ''));
    final parseAngsuranPokok18 =
        double.parse(angsuranPokok18.text.replaceAll('.', ''));
    final parseAngsuranPokok19 =
        double.parse(angsuranPokok19.text.replaceAll('.', ''));
    final parseAngsuranPokok20 =
        double.parse(angsuranPokok20.text.replaceAll('.', ''));
    final parseAngsuranPokok21 =
        double.parse(angsuranPokok21.text.replaceAll('.', ''));
    final parseAngsuranPokok22 =
        double.parse(angsuranPokok22.text.replaceAll('.', ''));
    final parseAngsuranPokok23 =
        double.parse(angsuranPokok23.text.replaceAll('.', ''));
    final parseAngsuranPokok24 =
        double.parse(angsuranPokok24.text.replaceAll('.', ''));
    final parseAngsuranPokok25 =
        double.parse(angsuranPokok25.text.replaceAll('.', ''));
    final parseAngsuranPokok26 =
        double.parse(angsuranPokok26.text.replaceAll('.', ''));
    final parseAngsuranPokok27 =
        double.parse(angsuranPokok27.text.replaceAll('.', ''));
    final parseAngsuranPokok28 =
        double.parse(angsuranPokok28.text.replaceAll('.', ''));
    final parseAngsuranPokok29 =
        double.parse(angsuranPokok29.text.replaceAll('.', ''));
    final parseAngsuranPokok30 =
        double.parse(angsuranPokok30.text.replaceAll('.', ''));
    final parseAngsuranPokok31 =
        double.parse(angsuranPokok31.text.replaceAll('.', ''));
    final parseAngsuranPokok32 =
        double.parse(angsuranPokok32.text.replaceAll('.', ''));
    final parseAngsuranPokok33 =
        double.parse(angsuranPokok33.text.replaceAll('.', ''));
    final parseAngsuranPokok34 =
        double.parse(angsuranPokok34.text.replaceAll('.', ''));
    final parseAngsuranPokok35 =
        double.parse(angsuranPokok35.text.replaceAll('.', ''));
    final parseAngsuranPokok36 =
        double.parse(angsuranPokok36.text.replaceAll('.', ''));
    final parseAngsuranPokok37 =
        double.parse(angsuranPokok37.text.replaceAll('.', ''));
    final parseAngsuranPokok38 =
        double.parse(angsuranPokok38.text.replaceAll('.', ''));
    final parseAngsuranPokok39 =
        double.parse(angsuranPokok39.text.replaceAll('.', ''));
    final parseAngsuranPokok40 =
        double.parse(angsuranPokok40.text.replaceAll('.', ''));
    final parseAngsuranPokok41 =
        double.parse(angsuranPokok41.text.replaceAll('.', ''));
    final parseAngsuranPokok42 =
        double.parse(angsuranPokok42.text.replaceAll('.', ''));
    final parseAngsuranPokok43 =
        double.parse(angsuranPokok43.text.replaceAll('.', ''));
    final parseAngsuranPokok44 =
        double.parse(angsuranPokok44.text.replaceAll('.', ''));
    final parseAngsuranPokok45 =
        double.parse(angsuranPokok45.text.replaceAll('.', ''));
    final parseAngsuranPokok46 =
        double.parse(angsuranPokok46.text.replaceAll('.', ''));
    final parseAngsuranPokok47 =
        double.parse(angsuranPokok47.text.replaceAll('.', ''));
    final parseAngsuranPokok48 =
        double.parse(angsuranPokok48.text.replaceAll('.', ''));

    sumAngsuranPokok.text = (parseAngsuranPokok1 +
            parseAngsuranPokok2 +
            parseAngsuranPokok3 +
            parseAngsuranPokok4 +
            parseAngsuranPokok5 +
            parseAngsuranPokok6 +
            parseAngsuranPokok7 +
            parseAngsuranPokok8 +
            parseAngsuranPokok9 +
            parseAngsuranPokok10 +
            parseAngsuranPokok11 +
            parseAngsuranPokok12 +
            parseAngsuranPokok13 +
            parseAngsuranPokok14 +
            parseAngsuranPokok15 +
            parseAngsuranPokok16 +
            parseAngsuranPokok17 +
            parseAngsuranPokok18 +
            parseAngsuranPokok19 +
            parseAngsuranPokok20 +
            parseAngsuranPokok21 +
            parseAngsuranPokok22 +
            parseAngsuranPokok23 +
            parseAngsuranPokok24 +
            parseAngsuranPokok25 +
            parseAngsuranPokok26 +
            parseAngsuranPokok27 +
            parseAngsuranPokok28 +
            parseAngsuranPokok29 +
            parseAngsuranPokok30 +
            parseAngsuranPokok31 +
            parseAngsuranPokok32 +
            parseAngsuranPokok33 +
            parseAngsuranPokok34 +
            parseAngsuranPokok35 +
            parseAngsuranPokok36 +
            parseAngsuranPokok37 +
            parseAngsuranPokok38 +
            parseAngsuranPokok39 +
            parseAngsuranPokok40 +
            parseAngsuranPokok41 +
            parseAngsuranPokok42 +
            parseAngsuranPokok43 +
            parseAngsuranPokok44 +
            parseAngsuranPokok45 +
            parseAngsuranPokok46 +
            parseAngsuranPokok47 +
            parseAngsuranPokok48)
        .toStringAsFixed(0);

    final parseSumAngsuranPokok =
        double.parse(sumAngsuranPokok.text.replaceAll('.', ''));
    final parseSumAngsuranBunga =
        double.parse(sumAngsuranBunga.text.replaceAll('.', ''));

    sumAngsuranTotal.text =
        (parseSumAngsuranPokok + parseSumAngsuranBunga).toStringAsFixed(0);

    final parseBungaSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSumAngsuranTotal =
        double.parse(sumAngsuranTotal.text.replaceAll('.', ''));

    final hasil = parseSumAngsuranTotal / parseJangkaWaktu;

    rerataPerbulan.text = hasil.toStringAsFixed(0);

    final hitungUmum = Finance.pmt(
          rate: parseBungaSukuBunga / 12,
          nper: parseJangkaWaktu,
          pv: parsePlafon,
        ) *
        -1;

    umum.text = hitungUmum.toStringAsFixed(0);

    final parseRerataPerbulan =
        double.parse(rerataPerbulan.text.replaceAll('.', ''));
    final parseUmum = double.parse(umum.text.replaceAll('.', ''));

    final hasilSelisih = parseRerataPerbulan - parseUmum;
    final hasilSelisihToAbsolute = hasilSelisih.abs();

    final hitungSelisih = hasilSelisihToAbsolute * parseJangkaWaktu;

    selisih.text = hitungSelisih.toStringAsFixed(0);

    final hitungBungaKeseluruhanFirst =
        parseSumAngsuranBunga / parseSumAngsuranPokok;
    final hitungBungaKeseluruhanSecond = hitungBungaKeseluruhanFirst * 100;

    bungaKeseluruhan.text = hitungBungaKeseluruhanSecond.toStringAsFixed(0);

    final parseBungaKeseluruhan = double.parse(bungaKeseluruhan.text) / 100;

    final hitungBungaFinal = (parseBungaKeseluruhan / parseJangkaWaktu) * 100;

    bungaFinal.text = hitungBungaFinal.toStringAsFixed(2);
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
    final parsePlafon = double.parse(plafon.text.replaceAll('.', ''));

    final first = parsePlafon * 31 / 360 * parseSukuBunga;

    angsuranBunga1.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan1.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));

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
    final parseSaldo1 = double.parse(saldo1.text.replaceAll('.', ''));

    final first = parseSaldo1 * 31 / 360 * parseSukuBunga;

    angsuranBunga2.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan2.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));

    if (parseSaldo1.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok2.text = parseAngsuranPokok.toStringAsFixed(1);
      } else {
        angsuranPokok2.text = '0';
      }
    } else {
      angsuranPokok2.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok2 =
        double.parse(angsuranPokok2.text.replaceAll('.', ''));
    final parseAngsuranBunga2 =
        double.parse(angsuranBunga2.text.replaceAll('.', ''));

    final hasilAngsuran = parseAngsuranPokok2 + parseAngsuranBunga2;

    // Decrease decimal to 0.1
    final hasilAngsuranToDouble = hasilAngsuran.floorToDouble();

    jmlAngsuran2.text = (hasilAngsuranToDouble).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok2ForRemainingBalance =
        double.parse(angsuranPokok2.text.replaceAll('.', ''));

    if (parseSaldo1 - parseAngsuranPokok2ForRemainingBalance < 0) {
      saldo2.text = '0';
    } else {
      saldo2.text = (parseSaldo1 - parseAngsuranPokok2ForRemainingBalance)
          .toStringAsFixed(0);
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
    final parseSaldo2 = double.parse(saldo2.text.replaceAll('.', ''));

    final first = parseSaldo2 * 31 / 360 * parseSukuBunga;

    angsuranBunga3.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan3.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));

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
        double.parse(angsuranPokok3.text.replaceAll('.', ''));
    final parseAngsuranBunga3 =
        double.parse(angsuranBunga3.text.replaceAll('.', ''));

    jmlAngsuran3.text =
        (parseAngsuranPokok3 + parseAngsuranBunga3).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok3ForRemainingBalance =
        double.parse(angsuranPokok3.text.replaceAll('.', ''));

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
    final parseSaldo3 = double.parse(saldo3.text.replaceAll('.', ''));

    final first = parseSaldo3 * 31 / 360 * parseSukuBunga;

    angsuranBunga4.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan4.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));

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
        double.parse(angsuranPokok4.text.replaceAll('.', ''));
    final parseAngsuranBunga4 =
        double.parse(angsuranBunga4.text.replaceAll('.', ''));

    jmlAngsuran4.text =
        (parseAngsuranPokok4 + parseAngsuranBunga4).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok4ForRemainingBalance =
        double.parse(angsuranPokok4.text.replaceAll('.', ''));

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
    final parseSaldo4 = double.parse(saldo4.text.replaceAll('.', ''));

    final first = parseSaldo4 * 31 / 360 * parseSukuBunga;

    angsuranBunga5.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan5.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));

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
        double.parse(angsuranPokok5.text.replaceAll('.', ''));
    final parseAngsuranBunga5 =
        double.parse(angsuranBunga5.text.replaceAll('.', ''));

    jmlAngsuran5.text =
        (parseAngsuranPokok5 + parseAngsuranBunga5).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok5ForRemainingBalance =
        double.parse(angsuranPokok5.text.replaceAll('.', ''));

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
    final parseSaldo5 = double.parse(saldo5.text.replaceAll('.', ''));

    final first = parseSaldo5 * 31 / 360 * parseSukuBunga;

    angsuranBunga6.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan6.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));

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
        double.parse(angsuranPokok6.text.replaceAll('.', ''));
    final parseAngsuranBunga6 =
        double.parse(angsuranBunga6.text.replaceAll('.', ''));

    final hasilAngsuran = parseAngsuranPokok6 + parseAngsuranBunga6;

    jmlAngsuran6.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok6ForRemainingBalance =
        double.parse(angsuranPokok6.text.replaceAll('.', ''));

    if (parseSaldo5 - parseAngsuranPokok6ForRemainingBalance < 0) {
      saldo6.text = '0';
    } else {
      saldo6.text = (parseSaldo5 - parseAngsuranPokok6ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan7
  final bulan7 = TextEditingController(text: '7');
  final tanggal7 = TextEditingController();
  final angsuranPokok7 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga7 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran7 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo7 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable7() {
    // Iterate Tanggal
    final parseTglBulan6 = DateFormat('dd/MM/yyyy').parse(tanggal6.text);
    final add30Days = parseTglBulan6.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal7.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo6 = double.parse(saldo6.text.replaceAll('.', ''));
    final first = parseSaldo6 * 31 / 360 * parseSukuBunga;

    angsuranBunga7.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan7.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo6.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok7.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok7.text = '0';
      }
    } else {
      angsuranPokok7.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok7 =
        double.parse(angsuranPokok7.text.replaceAll('.', ''));
    final parseAngsuranBunga7 =
        double.parse(angsuranBunga7.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok7 + parseAngsuranBunga7;

    jmlAngsuran7.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok7ForRemainingBalance =
        double.parse(angsuranPokok7.text.replaceAll('.', ''));
    if (parseSaldo6 - parseAngsuranPokok7ForRemainingBalance < 0) {
      saldo7.text = '0';
    } else {
      saldo7.text = (parseSaldo6 - parseAngsuranPokok7ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan8
  final bulan8 = TextEditingController(text: '8');
  final tanggal8 = TextEditingController();
  final angsuranPokok8 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga8 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran8 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo8 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable8() {
    // Iterate Tanggal
    final parseTglBulan7 = DateFormat('dd/MM/yyyy').parse(tanggal7.text);
    final add30Days = parseTglBulan7.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal8.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo7 = double.parse(saldo7.text.replaceAll('.', ''));
    final first = parseSaldo7 * 31 / 360 * parseSukuBunga;

    angsuranBunga8.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan8.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo7.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok8.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok8.text = '0';
      }
    } else {
      angsuranPokok8.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok8 =
        double.parse(angsuranPokok8.text.replaceAll('.', ''));
    final parseAngsuranBunga8 =
        double.parse(angsuranBunga8.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok8 + parseAngsuranBunga8;

    jmlAngsuran8.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok8ForRemainingBalance =
        double.parse(angsuranPokok8.text.replaceAll('.', ''));
    if (parseSaldo7 - parseAngsuranPokok8ForRemainingBalance < 0) {
      saldo8.text = '0';
    } else {
      saldo8.text = (parseSaldo7 - parseAngsuranPokok8ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan9
  final bulan9 = TextEditingController(text: '9');
  final tanggal9 = TextEditingController();
  final angsuranPokok9 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga9 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran9 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo9 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable9() {
    // Iterate Tanggal
    final parseTglBulan8 = DateFormat('dd/MM/yyyy').parse(tanggal8.text);
    final add30Days = parseTglBulan8.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal9.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo8 = double.parse(saldo8.text.replaceAll('.', ''));
    final first = parseSaldo8 * 31 / 360 * parseSukuBunga;

    angsuranBunga9.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan9.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo8.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok9.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok9.text = '0';
      }
    } else {
      angsuranPokok9.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok9 =
        double.parse(angsuranPokok9.text.replaceAll('.', ''));
    final parseAngsuranBunga9 =
        double.parse(angsuranBunga9.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok9 + parseAngsuranBunga9;

    jmlAngsuran9.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok9ForRemainingBalance =
        double.parse(angsuranPokok9.text.replaceAll('.', ''));
    if (parseSaldo8 - parseAngsuranPokok9ForRemainingBalance < 0) {
      saldo9.text = '0';
    } else {
      saldo9.text = (parseSaldo8 - parseAngsuranPokok9ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan10
  final bulan10 = TextEditingController(text: '10');
  final tanggal10 = TextEditingController();
  final angsuranPokok10 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga10 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran10 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo10 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable10() {
    // Iterate Tanggal
    final parseTglBulan9 = DateFormat('dd/MM/yyyy').parse(tanggal9.text);
    final add30Days = parseTglBulan9.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal10.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo9 = double.parse(saldo9.text.replaceAll('.', ''));
    final first = parseSaldo9 * 31 / 360 * parseSukuBunga;

    angsuranBunga10.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan10.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo9.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok10.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok10.text = '0';
      }
    } else {
      angsuranPokok10.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok10 =
        double.parse(angsuranPokok10.text.replaceAll('.', ''));
    final parseAngsuranBunga10 =
        double.parse(angsuranBunga10.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok10 + parseAngsuranBunga10;

    jmlAngsuran10.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok10ForRemainingBalance =
        double.parse(angsuranPokok10.text.replaceAll('.', ''));
    if (parseSaldo9 - parseAngsuranPokok10ForRemainingBalance < 0) {
      saldo10.text = '0';
    } else {
      saldo10.text = (parseSaldo9 - parseAngsuranPokok10ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan11
  final bulan11 = TextEditingController(text: '11');
  final tanggal11 = TextEditingController();
  final angsuranPokok11 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga11 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran11 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo11 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable11() {
    // Iterate Tanggal
    final parseTglBulan10 = DateFormat('dd/MM/yyyy').parse(tanggal10.text);
    final add30Days = parseTglBulan10.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal11.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo10 = double.parse(saldo10.text.replaceAll('.', ''));
    final first = parseSaldo10 * 31 / 360 * parseSukuBunga;

    angsuranBunga11.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan11.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo10.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok11.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok11.text = '0';
      }
    } else {
      angsuranPokok11.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok11 =
        double.parse(angsuranPokok11.text.replaceAll('.', ''));
    final parseAngsuranBunga11 =
        double.parse(angsuranBunga11.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok11 + parseAngsuranBunga11;

    jmlAngsuran11.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok11ForRemainingBalance =
        double.parse(angsuranPokok11.text.replaceAll('.', ''));
    if (parseSaldo10 - parseAngsuranPokok11ForRemainingBalance < 0) {
      saldo11.text = '0';
    } else {
      saldo11.text = (parseSaldo10 - parseAngsuranPokok11ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan12
  final bulan12 = TextEditingController(text: '12');
  final tanggal12 = TextEditingController();
  final angsuranPokok12 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga12 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran12 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo12 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable12() {
    // Iterate Tanggal
    final parseTglBulan11 = DateFormat('dd/MM/yyyy').parse(tanggal11.text);
    final add30Days = parseTglBulan11.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal12.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo11 = double.parse(saldo11.text.replaceAll('.', ''));
    final first = parseSaldo11 * 31 / 360 * parseSukuBunga;

    angsuranBunga12.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan12.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo11.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok12.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok12.text = '0';
      }
    } else {
      angsuranPokok12.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok12 =
        double.parse(angsuranPokok12.text.replaceAll('.', ''));
    final parseAngsuranBunga12 =
        double.parse(angsuranBunga12.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok12 + parseAngsuranBunga12;

    jmlAngsuran12.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok12ForRemainingBalance =
        double.parse(angsuranPokok12.text.replaceAll('.', ''));
    if (parseSaldo11 - parseAngsuranPokok12ForRemainingBalance < 0) {
      saldo12.text = '0';
    } else {
      saldo12.text = (parseSaldo11 - parseAngsuranPokok12ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan13
  final bulan13 = TextEditingController(text: '13');
  final tanggal13 = TextEditingController();
  final angsuranPokok13 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga13 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran13 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo13 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable13() {
    // Iterate Tanggal
    final parseTglBulan12 = DateFormat('dd/MM/yyyy').parse(tanggal12.text);
    final add30Days = parseTglBulan12.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal13.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo12 = double.parse(saldo12.text.replaceAll('.', ''));
    final first = parseSaldo12 * 31 / 360 * parseSukuBunga;

    angsuranBunga13.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan13.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo12.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok13.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok13.text = '0';
      }
    } else {
      angsuranPokok13.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok13 =
        double.parse(angsuranPokok13.text.replaceAll('.', ''));
    final parseAngsuranBunga13 =
        double.parse(angsuranBunga13.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok13 + parseAngsuranBunga13;

    jmlAngsuran13.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok13ForRemainingBalance =
        double.parse(angsuranPokok13.text.replaceAll('.', ''));
    if (parseSaldo12 - parseAngsuranPokok13ForRemainingBalance < 0) {
      saldo13.text = '0';
    } else {
      saldo13.text = (parseSaldo12 - parseAngsuranPokok13ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan14
  final bulan14 = TextEditingController(text: '14');
  final tanggal14 = TextEditingController();
  final angsuranPokok14 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga14 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran14 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo14 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable14() {
    // Iterate Tanggal
    final parseTglBulan13 = DateFormat('dd/MM/yyyy').parse(tanggal13.text);
    final add30Days = parseTglBulan13.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal14.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo13 = double.parse(saldo13.text.replaceAll('.', ''));
    final first = parseSaldo13 * 31 / 360 * parseSukuBunga;

    angsuranBunga14.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan14.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo13.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok14.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok14.text = '0';
      }
    } else {
      angsuranPokok14.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok14 =
        double.parse(angsuranPokok14.text.replaceAll('.', ''));
    final parseAngsuranBunga14 =
        double.parse(angsuranBunga14.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok14 + parseAngsuranBunga14;

    jmlAngsuran14.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok14ForRemainingBalance =
        double.parse(angsuranPokok14.text.replaceAll('.', ''));
    if (parseSaldo13 - parseAngsuranPokok14ForRemainingBalance < 0) {
      saldo14.text = '0';
    } else {
      saldo14.text = (parseSaldo13 - parseAngsuranPokok14ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan15
  final bulan15 = TextEditingController(text: '15');
  final tanggal15 = TextEditingController();
  final angsuranPokok15 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga15 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran15 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo15 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable15() {
    // Iterate Tanggal
    final parseTglBulan14 = DateFormat('dd/MM/yyyy').parse(tanggal14.text);
    final add30Days = parseTglBulan14.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal15.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo14 = double.parse(saldo14.text.replaceAll('.', ''));
    final first = parseSaldo14 * 31 / 360 * parseSukuBunga;

    angsuranBunga15.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan15.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo14.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok15.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok15.text = '0';
      }
    } else {
      angsuranPokok15.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok15 =
        double.parse(angsuranPokok15.text.replaceAll('.', ''));
    final parseAngsuranBunga15 =
        double.parse(angsuranBunga15.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok15 + parseAngsuranBunga15;

    jmlAngsuran15.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok15ForRemainingBalance =
        double.parse(angsuranPokok15.text.replaceAll('.', ''));
    if (parseSaldo14 - parseAngsuranPokok15ForRemainingBalance < 0) {
      saldo15.text = '0';
    } else {
      saldo15.text = (parseSaldo14 - parseAngsuranPokok15ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan16
  final bulan16 = TextEditingController(text: '16');
  final tanggal16 = TextEditingController();
  final angsuranPokok16 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga16 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran16 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo16 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable16() {
    // Iterate Tanggal
    final parseTglBulan15 = DateFormat('dd/MM/yyyy').parse(tanggal15.text);
    final add30Days = parseTglBulan15.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal16.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo15 = double.parse(saldo15.text.replaceAll('.', ''));
    final first = parseSaldo15 * 31 / 360 * parseSukuBunga;

    angsuranBunga16.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan16.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo15.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok16.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok16.text = '0';
      }
    } else {
      angsuranPokok16.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok16 =
        double.parse(angsuranPokok16.text.replaceAll('.', ''));
    final parseAngsuranBunga16 =
        double.parse(angsuranBunga16.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok16 + parseAngsuranBunga16;

    jmlAngsuran16.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok16ForRemainingBalance =
        double.parse(angsuranPokok16.text.replaceAll('.', ''));
    if (parseSaldo15 - parseAngsuranPokok16ForRemainingBalance < 0) {
      saldo16.text = '0';
    } else {
      saldo16.text = (parseSaldo15 - parseAngsuranPokok16ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan17
  final bulan17 = TextEditingController(text: '17');
  final tanggal17 = TextEditingController();
  final angsuranPokok17 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga17 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran17 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo17 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable17() {
    // Iterate Tanggal
    final parseTglBulan16 = DateFormat('dd/MM/yyyy').parse(tanggal16.text);
    final add30Days = parseTglBulan16.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal17.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo16 = double.parse(saldo16.text.replaceAll('.', ''));
    final first = parseSaldo16 * 31 / 360 * parseSukuBunga;

    angsuranBunga17.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan17.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo16.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok17.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok17.text = '0';
      }
    } else {
      angsuranPokok17.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok17 =
        double.parse(angsuranPokok17.text.replaceAll('.', ''));
    final parseAngsuranBunga17 =
        double.parse(angsuranBunga17.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok17 + parseAngsuranBunga17;

    jmlAngsuran17.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok17ForRemainingBalance =
        double.parse(angsuranPokok17.text.replaceAll('.', ''));
    if (parseSaldo16 - parseAngsuranPokok17ForRemainingBalance < 0) {
      saldo17.text = '0';
    } else {
      saldo17.text = (parseSaldo16 - parseAngsuranPokok17ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan18
  final bulan18 = TextEditingController(text: '18');
  final tanggal18 = TextEditingController();
  final angsuranPokok18 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga18 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran18 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo18 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable18() {
    // Iterate Tanggal
    final parseTglBulan17 = DateFormat('dd/MM/yyyy').parse(tanggal17.text);
    final add30Days = parseTglBulan17.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal18.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo17 = double.parse(saldo17.text.replaceAll('.', ''));
    final first = parseSaldo17 * 31 / 360 * parseSukuBunga;

    angsuranBunga18.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan18.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo17.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok18.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok18.text = '0';
      }
    } else {
      angsuranPokok18.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok18 =
        double.parse(angsuranPokok18.text.replaceAll('.', ''));
    final parseAngsuranBunga18 =
        double.parse(angsuranBunga18.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok18 + parseAngsuranBunga18;

    jmlAngsuran18.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok18ForRemainingBalance =
        double.parse(angsuranPokok18.text.replaceAll('.', ''));
    if (parseSaldo17 - parseAngsuranPokok18ForRemainingBalance < 0) {
      saldo18.text = '0';
    } else {
      saldo18.text = (parseSaldo17 - parseAngsuranPokok18ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan19
  final bulan19 = TextEditingController(text: '19');
  final tanggal19 = TextEditingController();
  final angsuranPokok19 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga19 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran19 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo19 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable19() {
    // Iterate Tanggal
    final parseTglBulan18 = DateFormat('dd/MM/yyyy').parse(tanggal18.text);
    final add30Days = parseTglBulan18.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal19.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo18 = double.parse(saldo18.text.replaceAll('.', ''));
    final first = parseSaldo18 * 31 / 360 * parseSukuBunga;

    angsuranBunga19.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan19.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo18.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok19.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok19.text = '0';
      }
    } else {
      angsuranPokok19.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok19 =
        double.parse(angsuranPokok19.text.replaceAll('.', ''));
    final parseAngsuranBunga19 =
        double.parse(angsuranBunga19.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok19 + parseAngsuranBunga19;

    jmlAngsuran19.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok19ForRemainingBalance =
        double.parse(angsuranPokok19.text.replaceAll('.', ''));
    if (parseSaldo18 - parseAngsuranPokok19ForRemainingBalance < 0) {
      saldo19.text = '0';
    } else {
      saldo19.text = (parseSaldo18 - parseAngsuranPokok19ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan20
  final bulan20 = TextEditingController(text: '20');
  final tanggal20 = TextEditingController();
  final angsuranPokok20 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga20 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran20 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo20 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable20() {
    // Iterate Tanggal
    final parseTglBulan19 = DateFormat('dd/MM/yyyy').parse(tanggal19.text);
    final add30Days = parseTglBulan19.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal20.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo19 = double.parse(saldo19.text.replaceAll('.', ''));
    final first = parseSaldo19 * 31 / 360 * parseSukuBunga;

    angsuranBunga20.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan20.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo19.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok20.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok20.text = '0';
      }
    } else {
      angsuranPokok20.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok20 =
        double.parse(angsuranPokok20.text.replaceAll('.', ''));
    final parseAngsuranBunga20 =
        double.parse(angsuranBunga20.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok20 + parseAngsuranBunga20;

    jmlAngsuran20.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok20ForRemainingBalance =
        double.parse(angsuranPokok20.text.replaceAll('.', ''));
    if (parseSaldo19 - parseAngsuranPokok20ForRemainingBalance < 0) {
      saldo20.text = '0';
    } else {
      saldo20.text = (parseSaldo19 - parseAngsuranPokok20ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan21
  final bulan21 = TextEditingController(text: '21');
  final tanggal21 = TextEditingController();
  final angsuranPokok21 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga21 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran21 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo21 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable21() {
    // Iterate Tanggal
    final parseTglBulan20 = DateFormat('dd/MM/yyyy').parse(tanggal20.text);
    final add30Days = parseTglBulan20.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal21.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo20 = double.parse(saldo20.text.replaceAll('.', ''));
    final first = parseSaldo20 * 31 / 360 * parseSukuBunga;

    angsuranBunga21.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan21.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo20.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok21.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok21.text = '0';
      }
    } else {
      angsuranPokok21.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok21 =
        double.parse(angsuranPokok21.text.replaceAll('.', ''));
    final parseAngsuranBunga21 =
        double.parse(angsuranBunga21.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok21 + parseAngsuranBunga21;

    jmlAngsuran21.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok21ForRemainingBalance =
        double.parse(angsuranPokok21.text.replaceAll('.', ''));
    if (parseSaldo20 - parseAngsuranPokok21ForRemainingBalance < 0) {
      saldo21.text = '0';
    } else {
      saldo21.text = (parseSaldo20 - parseAngsuranPokok21ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan22
  final bulan22 = TextEditingController(text: '22');
  final tanggal22 = TextEditingController();
  final angsuranPokok22 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga22 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran22 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo22 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable22() {
    // Iterate Tanggal
    final parseTglBulan21 = DateFormat('dd/MM/yyyy').parse(tanggal21.text);
    final add30Days = parseTglBulan21.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal22.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo21 = double.parse(saldo21.text.replaceAll('.', ''));
    final first = parseSaldo21 * 31 / 360 * parseSukuBunga;

    angsuranBunga22.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan22.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo21.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok22.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok22.text = '0';
      }
    } else {
      angsuranPokok22.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok22 =
        double.parse(angsuranPokok22.text.replaceAll('.', ''));
    final parseAngsuranBunga22 =
        double.parse(angsuranBunga22.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok22 + parseAngsuranBunga22;

    jmlAngsuran22.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok22ForRemainingBalance =
        double.parse(angsuranPokok22.text.replaceAll('.', ''));
    if (parseSaldo21 - parseAngsuranPokok22ForRemainingBalance < 0) {
      saldo22.text = '0';
    } else {
      saldo22.text = (parseSaldo21 - parseAngsuranPokok22ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan23
  final bulan23 = TextEditingController(text: '23');
  final tanggal23 = TextEditingController();
  final angsuranPokok23 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga23 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran23 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo23 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable23() {
    // Iterate Tanggal
    final parseTglBulan22 = DateFormat('dd/MM/yyyy').parse(tanggal22.text);
    final add30Days = parseTglBulan22.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal23.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo22 = double.parse(saldo22.text.replaceAll('.', ''));
    final first = parseSaldo22 * 31 / 360 * parseSukuBunga;

    angsuranBunga23.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan23.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo22.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok23.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok23.text = '0';
      }
    } else {
      angsuranPokok23.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok23 =
        double.parse(angsuranPokok23.text.replaceAll('.', ''));
    final parseAngsuranBunga23 =
        double.parse(angsuranBunga23.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok23 + parseAngsuranBunga23;

    jmlAngsuran23.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok23ForRemainingBalance =
        double.parse(angsuranPokok23.text.replaceAll('.', ''));
    if (parseSaldo22 - parseAngsuranPokok23ForRemainingBalance < 0) {
      saldo23.text = '0';
    } else {
      saldo23.text = (parseSaldo22 - parseAngsuranPokok23ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan24
  final bulan24 = TextEditingController(text: '24');
  final tanggal24 = TextEditingController();
  final angsuranPokok24 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga24 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran24 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo24 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable24() {
    // Iterate Tanggal
    final parseTglBulan23 = DateFormat('dd/MM/yyyy').parse(tanggal23.text);
    final add30Days = parseTglBulan23.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal24.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo23 = double.parse(saldo23.text.replaceAll('.', ''));
    final first = parseSaldo23 * 31 / 360 * parseSukuBunga;

    angsuranBunga24.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan24.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo23.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok24.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok24.text = '0';
      }
    } else {
      angsuranPokok24.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok24 =
        double.parse(angsuranPokok24.text.replaceAll('.', ''));
    final parseAngsuranBunga24 =
        double.parse(angsuranBunga24.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok24 + parseAngsuranBunga24;

    jmlAngsuran24.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok24ForRemainingBalance =
        double.parse(angsuranPokok24.text.replaceAll('.', ''));
    if (parseSaldo23 - parseAngsuranPokok24ForRemainingBalance < 0) {
      saldo24.text = '0';
    } else {
      saldo24.text = (parseSaldo23 - parseAngsuranPokok24ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan25
  final bulan25 = TextEditingController(text: '25');
  final tanggal25 = TextEditingController();
  final angsuranPokok25 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga25 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jmlAngsuran25 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo25 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable25() {
    // Iterate Tanggal
    final parseTglBulan24 = DateFormat('dd/MM/yyyy').parse(tanggal24.text);
    final add30Days = parseTglBulan24.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal25.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo24 = double.parse(saldo24.text.replaceAll('.', ''));
    final first = parseSaldo24 * 31 / 360 * parseSukuBunga;

    angsuranBunga25.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan25.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo24.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok25.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok25.text = '0';
      }
    } else {
      angsuranPokok25.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok25 =
        double.parse(angsuranPokok25.text.replaceAll('.', ''));
    final parseAngsuranBunga25 =
        double.parse(angsuranBunga25.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok25 + parseAngsuranBunga25;

    jmlAngsuran25.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok25ForRemainingBalance =
        double.parse(angsuranPokok25.text.replaceAll('.', ''));
    if (parseSaldo24 - parseAngsuranPokok25ForRemainingBalance < 0) {
      saldo25.text = '0';
    } else {
      saldo25.text = (parseSaldo24 - parseAngsuranPokok25ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan26
  final bulan26 = TextEditingController(text: '26');
  final tanggal26 = TextEditingController();
  final angsuranPokok26 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga26 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran26 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo26 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable26() {
    // Iterate Tanggal
    final parseTglBulan25 = DateFormat('dd/MM/yyyy').parse(tanggal25.text);
    final add30Days = parseTglBulan25.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal26.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo25 = double.parse(saldo25.text.replaceAll('.', ''));
    final first = parseSaldo25 * 31 / 360 * parseSukuBunga;

    angsuranBunga26.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan26.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo25.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok26.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok26.text = '0';
      }
    } else {
      angsuranPokok26.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok26 =
        double.parse(angsuranPokok26.text.replaceAll('.', ''));
    final parseAngsuranBunga26 =
        double.parse(angsuranBunga26.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok26 + parseAngsuranBunga26;

    jmlAngsuran26.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok26ForRemainingBalance =
        double.parse(angsuranPokok26.text.replaceAll('.', ''));
    if (parseSaldo25 - parseAngsuranPokok26ForRemainingBalance < 0) {
      saldo26.text = '0';
    } else {
      saldo26.text = (parseSaldo25 - parseAngsuranPokok26ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan27
  final bulan27 = TextEditingController(text: '27');
  final tanggal27 = TextEditingController();
  final angsuranPokok27 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga27 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran27 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo27 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable27() {
    // Iterate Tanggal
    final parseTglBulan26 = DateFormat('dd/MM/yyyy').parse(tanggal26.text);
    final add30Days = parseTglBulan26.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal27.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo26 = double.parse(saldo26.text.replaceAll('.', ''));
    final first = parseSaldo26 * 31 / 360 * parseSukuBunga;

    angsuranBunga27.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan27.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo26.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok27.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok27.text = '0';
      }
    } else {
      angsuranPokok27.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok27 =
        double.parse(angsuranPokok27.text.replaceAll('.', ''));
    final parseAngsuranBunga27 =
        double.parse(angsuranBunga27.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok27 + parseAngsuranBunga27;

    jmlAngsuran27.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok27ForRemainingBalance =
        double.parse(angsuranPokok27.text.replaceAll('.', ''));
    if (parseSaldo26 - parseAngsuranPokok27ForRemainingBalance < 0) {
      saldo27.text = '0';
    } else {
      saldo27.text = (parseSaldo26 - parseAngsuranPokok27ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan28
  final bulan28 = TextEditingController(text: '28');
  final tanggal28 = TextEditingController();
  final angsuranPokok28 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga28 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran28 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo28 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable28() {
    // Iterate Tanggal
    final parseTglBulan27 = DateFormat('dd/MM/yyyy').parse(tanggal27.text);
    final add30Days = parseTglBulan27.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal28.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo27 = double.parse(saldo27.text.replaceAll('.', ''));
    final first = parseSaldo27 * 31 / 360 * parseSukuBunga;

    angsuranBunga28.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan28.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo27.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok28.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok28.text = '0';
      }
    } else {
      angsuranPokok28.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok28 =
        double.parse(angsuranPokok28.text.replaceAll('.', ''));
    final parseAngsuranBunga28 =
        double.parse(angsuranBunga28.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok28 + parseAngsuranBunga28;

    jmlAngsuran28.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok28ForRemainingBalance =
        double.parse(angsuranPokok28.text.replaceAll('.', ''));
    if (parseSaldo27 - parseAngsuranPokok28ForRemainingBalance < 0) {
      saldo28.text = '0';
    } else {
      saldo28.text = (parseSaldo27 - parseAngsuranPokok28ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan29
  final bulan29 = TextEditingController(text: '29');
  final tanggal29 = TextEditingController();
  final angsuranPokok29 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga29 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran29 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo29 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable29() {
    // Iterate Tanggal
    final parseTglBulan28 = DateFormat('dd/MM/yyyy').parse(tanggal28.text);
    final add30Days = parseTglBulan28.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal29.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo28 = double.parse(saldo28.text.replaceAll('.', ''));
    final first = parseSaldo28 * 31 / 360 * parseSukuBunga;

    angsuranBunga29.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan29.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo28.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok29.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok29.text = '0';
      }
    } else {
      angsuranPokok29.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok29 =
        double.parse(angsuranPokok29.text.replaceAll('.', ''));
    final parseAngsuranBunga29 =
        double.parse(angsuranBunga29.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok29 + parseAngsuranBunga29;

    jmlAngsuran29.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok29ForRemainingBalance =
        double.parse(angsuranPokok29.text.replaceAll('.', ''));
    if (parseSaldo28 - parseAngsuranPokok29ForRemainingBalance < 0) {
      saldo29.text = '0';
    } else {
      saldo29.text = (parseSaldo28 - parseAngsuranPokok29ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan30
  final bulan30 = TextEditingController(text: '30');
  final tanggal30 = TextEditingController();
  final angsuranPokok30 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga30 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran30 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo30 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable30() {
    // Iterate Tanggal
    final parseTglBulan29 = DateFormat('dd/MM/yyyy').parse(tanggal29.text);
    final add30Days = parseTglBulan29.add(const Duration(days: 30));
    final hasil = DateFormat('dd/MM/yyyy').format(add30Days);

    tanggal30.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo29 = double.parse(saldo29.text.replaceAll('.', ''));
    final first = parseSaldo29 * 31 / 360 * parseSukuBunga;

    angsuranBunga30.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan30.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo29.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok30.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok30.text = '0';
      }
    } else {
      angsuranPokok30.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok30 =
        double.parse(angsuranPokok30.text.replaceAll('.', ''));
    final parseAngsuranBunga30 =
        double.parse(angsuranBunga30.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok30 + parseAngsuranBunga30;

    jmlAngsuran30.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok30ForRemainingBalance =
        double.parse(angsuranPokok30.text.replaceAll('.', ''));
    if (parseSaldo29 - parseAngsuranPokok30ForRemainingBalance < 0) {
      saldo30.text = '0';
    } else {
      saldo30.text = (parseSaldo29 - parseAngsuranPokok30ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan31
  final bulan31 = TextEditingController(text: '31');
  final tanggal31 = TextEditingController();
  final angsuranPokok31 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga31 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran31 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo31 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable31() {
    // Iterate Tanggal
    final parseTglBulan30 = DateFormat('dd/MM/yyyy').parse(tanggal30.text);
    final add31Days = parseTglBulan30.add(const Duration(days: 31));
    final hasil = DateFormat('dd/MM/yyyy').format(add31Days);

    tanggal31.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo30 = double.parse(saldo30.text.replaceAll('.', ''));
    final first = parseSaldo30 * 31 / 360 * parseSukuBunga;

    angsuranBunga31.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan31.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo30.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok31.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok31.text = '0';
      }
    } else {
      angsuranPokok31.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok31 =
        double.parse(angsuranPokok31.text.replaceAll('.', ''));
    final parseAngsuranBunga31 =
        double.parse(angsuranBunga31.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok31 + parseAngsuranBunga31;

    jmlAngsuran31.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok31ForRemainingBalance =
        double.parse(angsuranPokok31.text.replaceAll('.', ''));
    if (parseSaldo30 - parseAngsuranPokok31ForRemainingBalance < 0) {
      saldo31.text = '0';
    } else {
      saldo31.text = (parseSaldo30 - parseAngsuranPokok31ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan32
  final bulan32 = TextEditingController(text: '32');
  final tanggal32 = TextEditingController();
  final angsuranPokok32 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga32 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran32 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo32 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  void hitungTable32() {
    // Iterate Tanggal
    final parseTglBulan31 = DateFormat('dd/MM/yyyy').parse(tanggal31.text);
    final add32Days = parseTglBulan31.add(const Duration(days: 32));
    final hasil = DateFormat('dd/MM/yyyy').format(add32Days);

    tanggal32.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo31 = double.parse(saldo31.text.replaceAll('.', ''));
    final first = parseSaldo31 * 31 / 360 * parseSukuBunga;

    angsuranBunga32.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan32.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo31.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok32.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok32.text = '0';
      }
    } else {
      angsuranPokok32.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok32 =
        double.parse(angsuranPokok32.text.replaceAll('.', ''));
    final parseAngsuranBunga32 =
        double.parse(angsuranBunga32.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok32 + parseAngsuranBunga32;

    jmlAngsuran32.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok32ForRemainingBalance =
        double.parse(angsuranPokok32.text.replaceAll('.', ''));
    if (parseSaldo31 - parseAngsuranPokok32ForRemainingBalance < 0) {
      saldo32.text = '0';
    } else {
      saldo32.text = (parseSaldo31 - parseAngsuranPokok32ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan33
  final bulan33 = TextEditingController(text: '33');
  final tanggal33 = TextEditingController();
  final angsuranPokok33 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga33 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran33 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo33 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable33() {
    // Iterate Tanggal
    final parseTglBulan32 = DateFormat('dd/MM/yyyy').parse(tanggal32.text);
    final add33Days = parseTglBulan32.add(const Duration(days: 33));
    final hasil = DateFormat('dd/MM/yyyy').format(add33Days);

    tanggal33.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo32 = double.parse(saldo32.text.replaceAll('.', ''));
    final first = parseSaldo32 * 31 / 360 * parseSukuBunga;

    angsuranBunga33.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan33.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo32.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok33.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok33.text = '0';
      }
    } else {
      angsuranPokok33.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok33 =
        double.parse(angsuranPokok33.text.replaceAll('.', ''));
    final parseAngsuranBunga33 =
        double.parse(angsuranBunga33.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok33 + parseAngsuranBunga33;

    jmlAngsuran33.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok33ForRemainingBalance =
        double.parse(angsuranPokok33.text.replaceAll('.', ''));
    if (parseSaldo32 - parseAngsuranPokok33ForRemainingBalance < 0) {
      saldo33.text = '0';
    } else {
      saldo33.text = (parseSaldo32 - parseAngsuranPokok33ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan34
  final bulan34 = TextEditingController(text: '34');
  final tanggal34 = TextEditingController();
  final angsuranPokok34 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga34 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran34 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo34 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable34() {
    // Iterate Tanggal
    final parseTglBulan33 = DateFormat('dd/MM/yyyy').parse(tanggal33.text);
    final add34Days = parseTglBulan33.add(const Duration(days: 34));
    final hasil = DateFormat('dd/MM/yyyy').format(add34Days);

    tanggal34.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo33 = double.parse(saldo33.text.replaceAll('.', ''));
    final first = parseSaldo33 * 31 / 360 * parseSukuBunga;

    angsuranBunga34.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan34.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo33.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok34.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok34.text = '0';
      }
    } else {
      angsuranPokok34.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok34 =
        double.parse(angsuranPokok34.text.replaceAll('.', ''));
    final parseAngsuranBunga34 =
        double.parse(angsuranBunga34.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok34 + parseAngsuranBunga34;

    jmlAngsuran34.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok34ForRemainingBalance =
        double.parse(angsuranPokok34.text.replaceAll('.', ''));
    if (parseSaldo33 - parseAngsuranPokok34ForRemainingBalance < 0) {
      saldo34.text = '0';
    } else {
      saldo34.text = (parseSaldo33 - parseAngsuranPokok34ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan35
  final bulan35 = TextEditingController(text: '35');
  final tanggal35 = TextEditingController();
  final angsuranPokok35 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga35 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran35 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo35 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable35() {
    // Iterate Tanggal
    final parseTglBulan34 = DateFormat('dd/MM/yyyy').parse(tanggal34.text);
    final add35Days = parseTglBulan34.add(const Duration(days: 35));
    final hasil = DateFormat('dd/MM/yyyy').format(add35Days);

    tanggal35.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo34 = double.parse(saldo34.text.replaceAll('.', ''));
    final first = parseSaldo34 * 31 / 360 * parseSukuBunga;

    angsuranBunga35.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan35.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo34.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok35.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok35.text = '0';
      }
    } else {
      angsuranPokok35.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok35 =
        double.parse(angsuranPokok35.text.replaceAll('.', ''));
    final parseAngsuranBunga35 =
        double.parse(angsuranBunga35.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok35 + parseAngsuranBunga35;

    jmlAngsuran35.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok35ForRemainingBalance =
        double.parse(angsuranPokok35.text.replaceAll('.', ''));
    if (parseSaldo34 - parseAngsuranPokok35ForRemainingBalance < 0) {
      saldo35.text = '0';
    } else {
      saldo35.text = (parseSaldo34 - parseAngsuranPokok35ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan36
  final bulan36 = TextEditingController(text: '36');
  final tanggal36 = TextEditingController();
  final angsuranPokok36 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga36 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran36 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo36 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable36() {
    // Iterate Tanggal
    final parseTglBulan35 = DateFormat('dd/MM/yyyy').parse(tanggal35.text);
    final add36Days = parseTglBulan35.add(const Duration(days: 36));
    final hasil = DateFormat('dd/MM/yyyy').format(add36Days);

    tanggal36.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo35 = double.parse(saldo35.text.replaceAll('.', ''));
    final first = parseSaldo35 * 31 / 360 * parseSukuBunga;

    angsuranBunga36.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan36.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo35.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok36.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok36.text = '0';
      }
    } else {
      angsuranPokok36.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok36 =
        double.parse(angsuranPokok36.text.replaceAll('.', ''));
    final parseAngsuranBunga36 =
        double.parse(angsuranBunga36.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok36 + parseAngsuranBunga36;

    jmlAngsuran36.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok36ForRemainingBalance =
        double.parse(angsuranPokok36.text.replaceAll('.', ''));
    if (parseSaldo35 - parseAngsuranPokok36ForRemainingBalance < 0) {
      saldo36.text = '0';
    } else {
      saldo36.text = (parseSaldo35 - parseAngsuranPokok36ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan37
  final bulan37 = TextEditingController(text: '37');
  final tanggal37 = TextEditingController();
  final angsuranPokok37 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final angsuranBunga37 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran37 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo37 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable37() {
    // Iterate Tanggal
    final parseTglBulan36 = DateFormat('dd/MM/yyyy').parse(tanggal36.text);
    final add37Days = parseTglBulan36.add(const Duration(days: 37));
    final hasil = DateFormat('dd/MM/yyyy').format(add37Days);

    tanggal37.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo36 = double.parse(saldo36.text.replaceAll('.', ''));
    final first = parseSaldo36 * 31 / 360 * parseSukuBunga;

    angsuranBunga37.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan37.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo36.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok37.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok37.text = '0';
      }
    } else {
      angsuranPokok37.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok37 =
        double.parse(angsuranPokok37.text.replaceAll('.', ''));
    final parseAngsuranBunga37 =
        double.parse(angsuranBunga37.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok37 + parseAngsuranBunga37;

    jmlAngsuran37.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok37ForRemainingBalance =
        double.parse(angsuranPokok37.text.replaceAll('.', ''));
    if (parseSaldo36 - parseAngsuranPokok37ForRemainingBalance < 0) {
      saldo37.text = '0';
    } else {
      saldo37.text = (parseSaldo36 - parseAngsuranPokok37ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan38
  final bulan38 = TextEditingController(text: '38');
  final tanggal38 = TextEditingController();

  final angsuranPokok38 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga38 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran38 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo38 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable38() {
    // Iterate Tanggal
    final parseTglBulan37 = DateFormat('dd/MM/yyyy').parse(tanggal37.text);
    final add38Days = parseTglBulan37.add(const Duration(days: 38));
    final hasil = DateFormat('dd/MM/yyyy').format(add38Days);

    tanggal38.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo37 = double.parse(saldo37.text.replaceAll('.', ''));
    final first = parseSaldo37 * 31 / 360 * parseSukuBunga;

    angsuranBunga38.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan38.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo37.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok38.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok38.text = '0';
      }
    } else {
      angsuranPokok38.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok38 =
        double.parse(angsuranPokok38.text.replaceAll('.', ''));
    final parseAngsuranBunga38 =
        double.parse(angsuranBunga38.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok38 + parseAngsuranBunga38;

    jmlAngsuran38.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok38ForRemainingBalance =
        double.parse(angsuranPokok38.text.replaceAll('.', ''));
    if (parseSaldo37 - parseAngsuranPokok38ForRemainingBalance < 0) {
      saldo38.text = '0';
    } else {
      saldo38.text = (parseSaldo37 - parseAngsuranPokok38ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan39
  final bulan39 = TextEditingController(text: '39');
  final tanggal39 = TextEditingController();

  final angsuranPokok39 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga39 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran39 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo39 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable39() {
    // Iterate Tanggal
    final parseTglBulan38 = DateFormat('dd/MM/yyyy').parse(tanggal38.text);
    final add39Days = parseTglBulan38.add(const Duration(days: 39));
    final hasil = DateFormat('dd/MM/yyyy').format(add39Days);

    tanggal39.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo38 = double.parse(saldo38.text.replaceAll('.', ''));
    final first = parseSaldo38 * 31 / 360 * parseSukuBunga;

    angsuranBunga39.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan39.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo38.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok39.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok39.text = '0';
      }
    } else {
      angsuranPokok39.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok39 =
        double.parse(angsuranPokok39.text.replaceAll('.', ''));
    final parseAngsuranBunga39 =
        double.parse(angsuranBunga39.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok39 + parseAngsuranBunga39;

    jmlAngsuran39.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok39ForRemainingBalance =
        double.parse(angsuranPokok39.text.replaceAll('.', ''));
    if (parseSaldo38 - parseAngsuranPokok39ForRemainingBalance < 0) {
      saldo39.text = '0';
    } else {
      saldo39.text = (parseSaldo38 - parseAngsuranPokok39ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan40
  final bulan40 = TextEditingController(text: '40');
  final tanggal40 = TextEditingController();

  final angsuranPokok40 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga40 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran40 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo40 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable40() {
    // Iterate Tanggal
    final parseTglBulan39 = DateFormat('dd/MM/yyyy').parse(tanggal39.text);
    final add40Days = parseTglBulan39.add(const Duration(days: 40));
    final hasil = DateFormat('dd/MM/yyyy').format(add40Days);

    tanggal40.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo39 = double.parse(saldo39.text.replaceAll('.', ''));
    final first = parseSaldo39 * 31 / 360 * parseSukuBunga;

    angsuranBunga40.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan40.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo39.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok40.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok40.text = '0';
      }
    } else {
      angsuranPokok40.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok40 =
        double.parse(angsuranPokok40.text.replaceAll('.', ''));
    final parseAngsuranBunga40 =
        double.parse(angsuranBunga40.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok40 + parseAngsuranBunga40;

    jmlAngsuran40.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok40ForRemainingBalance =
        double.parse(angsuranPokok40.text.replaceAll('.', ''));
    if (parseSaldo39 - parseAngsuranPokok40ForRemainingBalance < 0) {
      saldo40.text = '0';
    } else {
      saldo40.text = (parseSaldo39 - parseAngsuranPokok40ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan41
  final bulan41 = TextEditingController(text: '41');
  final tanggal41 = TextEditingController();

  final angsuranPokok41 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga41 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran41 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo41 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable41() {
    // Iterate Tanggal
    final parseTglBulan40 = DateFormat('dd/MM/yyyy').parse(tanggal40.text);
    final add41Days = parseTglBulan40.add(const Duration(days: 41));
    final hasil = DateFormat('dd/MM/yyyy').format(add41Days);

    tanggal41.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo40 = double.parse(saldo40.text.replaceAll('.', ''));
    final first = parseSaldo40 * 31 / 360 * parseSukuBunga;

    angsuranBunga41.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan41.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo40.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok41.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok41.text = '0';
      }
    } else {
      angsuranPokok41.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok41 =
        double.parse(angsuranPokok41.text.replaceAll('.', ''));
    final parseAngsuranBunga41 =
        double.parse(angsuranBunga41.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok41 + parseAngsuranBunga41;

    jmlAngsuran41.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok41ForRemainingBalance =
        double.parse(angsuranPokok41.text.replaceAll('.', ''));
    if (parseSaldo40 - parseAngsuranPokok41ForRemainingBalance < 0) {
      saldo41.text = '0';
    } else {
      saldo41.text = (parseSaldo40 - parseAngsuranPokok41ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan42
  final bulan42 = TextEditingController(text: '42');
  final tanggal42 = TextEditingController();

  final angsuranPokok42 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga42 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran42 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo42 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable42() {
    // Iterate Tanggal
    final parseTglBulan41 = DateFormat('dd/MM/yyyy').parse(tanggal41.text);
    final add42Days = parseTglBulan41.add(const Duration(days: 42));
    final hasil = DateFormat('dd/MM/yyyy').format(add42Days);

    tanggal42.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo41 = double.parse(saldo41.text.replaceAll('.', ''));
    final first = parseSaldo41 * 31 / 360 * parseSukuBunga;

    angsuranBunga42.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan42.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo41.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok42.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok42.text = '0';
      }
    } else {
      angsuranPokok42.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok42 =
        double.parse(angsuranPokok42.text.replaceAll('.', ''));
    final parseAngsuranBunga42 =
        double.parse(angsuranBunga42.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok42 + parseAngsuranBunga42;

    jmlAngsuran42.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok42ForRemainingBalance =
        double.parse(angsuranPokok42.text.replaceAll('.', ''));
    if (parseSaldo41 - parseAngsuranPokok42ForRemainingBalance < 0) {
      saldo42.text = '0';
    } else {
      saldo42.text = (parseSaldo41 - parseAngsuranPokok42ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan43

  final bulan43 = TextEditingController(text: '43');
  final tanggal43 = TextEditingController();

  final angsuranPokok43 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga43 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran43 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo43 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable43() {
    // Iterate Tanggal
    final parseTglBulan42 = DateFormat('dd/MM/yyyy').parse(tanggal42.text);
    final add43Days = parseTglBulan42.add(const Duration(days: 43));
    final hasil = DateFormat('dd/MM/yyyy').format(add43Days);

    tanggal43.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo42 = double.parse(saldo42.text.replaceAll('.', ''));
    final first = parseSaldo42 * 31 / 360 * parseSukuBunga;

    angsuranBunga43.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan43.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo42.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok43.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok43.text = '0';
      }
    } else {
      angsuranPokok43.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok43 =
        double.parse(angsuranPokok43.text.replaceAll('.', ''));
    final parseAngsuranBunga43 =
        double.parse(angsuranBunga43.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok43 + parseAngsuranBunga43;

    jmlAngsuran43.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok43ForRemainingBalance =
        double.parse(angsuranPokok43.text.replaceAll('.', ''));
    if (parseSaldo42 - parseAngsuranPokok43ForRemainingBalance < 0) {
      saldo43.text = '0';
    } else {
      saldo43.text = (parseSaldo42 - parseAngsuranPokok43ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan44

  final bulan44 = TextEditingController(text: '44');
  final tanggal44 = TextEditingController();

  final angsuranPokok44 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga44 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran44 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo44 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable44() {
    // Iterate Tanggal
    final parseTglBulan43 = DateFormat('dd/MM/yyyy').parse(tanggal43.text);
    final add44Days = parseTglBulan43.add(const Duration(days: 44));
    final hasil = DateFormat('dd/MM/yyyy').format(add44Days);

    tanggal44.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo43 = double.parse(saldo43.text.replaceAll('.', ''));
    final first = parseSaldo43 * 31 / 360 * parseSukuBunga;

    angsuranBunga44.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan44.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo43.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok44.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok44.text = '0';
      }
    } else {
      angsuranPokok44.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok44 =
        double.parse(angsuranPokok44.text.replaceAll('.', ''));
    final parseAngsuranBunga44 =
        double.parse(angsuranBunga44.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok44 + parseAngsuranBunga44;

    jmlAngsuran44.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok44ForRemainingBalance =
        double.parse(angsuranPokok44.text.replaceAll('.', ''));
    if (parseSaldo43 - parseAngsuranPokok44ForRemainingBalance < 0) {
      saldo44.text = '0';
    } else {
      saldo44.text = (parseSaldo43 - parseAngsuranPokok44ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan45

  final bulan45 = TextEditingController(text: '45');
  final tanggal45 = TextEditingController();

  final angsuranPokok45 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga45 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran45 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo45 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable45() {
    // Iterate Tanggal
    final parseTglBulan44 = DateFormat('dd/MM/yyyy').parse(tanggal44.text);
    final add45Days = parseTglBulan44.add(const Duration(days: 45));
    final hasil = DateFormat('dd/MM/yyyy').format(add45Days);

    tanggal45.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo44 = double.parse(saldo44.text.replaceAll('.', ''));
    final first = parseSaldo44 * 31 / 360 * parseSukuBunga;

    angsuranBunga45.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan45.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo44.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok45.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok45.text = '0';
      }
    } else {
      angsuranPokok45.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok45 =
        double.parse(angsuranPokok45.text.replaceAll('.', ''));
    final parseAngsuranBunga45 =
        double.parse(angsuranBunga45.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok45 + parseAngsuranBunga45;

    jmlAngsuran45.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok45ForRemainingBalance =
        double.parse(angsuranPokok45.text.replaceAll('.', ''));
    if (parseSaldo44 - parseAngsuranPokok45ForRemainingBalance < 0) {
      saldo45.text = '0';
    } else {
      saldo45.text = (parseSaldo44 - parseAngsuranPokok45ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan46

  final bulan46 = TextEditingController(text: '46');
  final tanggal46 = TextEditingController();

  final angsuranPokok46 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga46 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran46 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo46 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable46() {
    // Iterate Tanggal
    final parseTglBulan45 = DateFormat('dd/MM/yyyy').parse(tanggal45.text);
    final add46Days = parseTglBulan45.add(const Duration(days: 46));
    final hasil = DateFormat('dd/MM/yyyy').format(add46Days);

    tanggal46.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo45 = double.parse(saldo45.text.replaceAll('.', ''));
    final first = parseSaldo45 * 31 / 360 * parseSukuBunga;

    angsuranBunga46.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan46.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo45.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok46.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok46.text = '0';
      }
    } else {
      angsuranPokok46.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok46 =
        double.parse(angsuranPokok46.text.replaceAll('.', ''));
    final parseAngsuranBunga46 =
        double.parse(angsuranBunga46.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok46 + parseAngsuranBunga46;

    jmlAngsuran46.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok46ForRemainingBalance =
        double.parse(angsuranPokok46.text.replaceAll('.', ''));
    if (parseSaldo45 - parseAngsuranPokok46ForRemainingBalance < 0) {
      saldo46.text = '0';
    } else {
      saldo46.text = (parseSaldo45 - parseAngsuranPokok46ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan47

  final bulan47 = TextEditingController(text: '47');

  final tanggal47 = TextEditingController();

  final angsuranPokok47 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga47 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran47 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo47 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable47() {
    // Iterate Tanggal
    final parseTglBulan46 = DateFormat('dd/MM/yyyy').parse(tanggal46.text);
    final add47Days = parseTglBulan46.add(const Duration(days: 47));
    final hasil = DateFormat('dd/MM/yyyy').format(add47Days);

    tanggal47.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo46 = double.parse(saldo46.text.replaceAll('.', ''));
    final first = parseSaldo46 * 31 / 360 * parseSukuBunga;

    angsuranBunga47.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan47.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo46.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok47.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok47.text = '0';
      }
    } else {
      angsuranPokok47.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok47 =
        double.parse(angsuranPokok47.text.replaceAll('.', ''));
    final parseAngsuranBunga47 =
        double.parse(angsuranBunga47.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok47 + parseAngsuranBunga47;

    jmlAngsuran47.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok47ForRemainingBalance =
        double.parse(angsuranPokok47.text.replaceAll('.', ''));
    if (parseSaldo46 - parseAngsuranPokok47ForRemainingBalance < 0) {
      saldo47.text = '0';
    } else {
      saldo47.text = (parseSaldo46 - parseAngsuranPokok47ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }

  // Bulan48

  final bulan48 = TextEditingController(text: '48');

  final tanggal48 = TextEditingController();

  final angsuranPokok48 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranBunga48 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final jmlAngsuran48 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final saldo48 = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  void hitungTable48() {
    // Iterate Tanggal
    final parseTglBulan47 = DateFormat('dd/MM/yyyy').parse(tanggal47.text);
    final add48Days = parseTglBulan47.add(const Duration(days: 48));
    final hasil = DateFormat('dd/MM/yyyy').format(add48Days);

    tanggal48.text = hasil.toString();

    // Hitung bu
    final parseSukuBunga = double.parse(sukuBunga.text) / 100;
    final parseSaldo47 = double.parse(saldo47.text.replaceAll('.', ''));
    final first = parseSaldo47 * 31 / 360 * parseSukuBunga;

    angsuranBunga48.text = first.toStringAsFixed(0);

    // Hitung angsuran pokok
    final parseBulan = int.parse(bulan48.text);
    final parseTurunPokok = int.parse(turunPokok.text);
    final hitungKiri = parseBulan / parseTurunPokok;
    final hitungKanan = parseBulan / parseTurunPokok;
    final hitungKananToFloor = hitungKanan.floor();
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    if (parseSaldo47.floor() > 0) {
      if (hitungKiri - hitungKananToFloor == 0) {
        angsuranPokok48.text = parseAngsuranPokok.toStringAsFixed(0);
      } else {
        angsuranPokok48.text = '0';
      }
    } else {
      angsuranPokok48.text = '0';
    }

    // Hitung jumlah angsuran
    final parseAngsuranPokok48 =
        double.parse(angsuranPokok48.text.replaceAll('.', ''));
    final parseAngsuranBunga48 =
        double.parse(angsuranBunga48.text.replaceAll('.', ''));
    final hasilAngsuran = parseAngsuranPokok48 + parseAngsuranBunga48;

    jmlAngsuran48.text = (hasilAngsuran).toStringAsFixed(0);

    // Hitung sisa saldo
    final parseAngsuranPokok48ForRemainingBalance =
        double.parse(angsuranPokok48.text.replaceAll('.', ''));
    if (parseSaldo47 - parseAngsuranPokok48ForRemainingBalance < 0) {
      saldo48.text = '0';
    } else {
      saldo48.text = (parseSaldo47 - parseAngsuranPokok48ForRemainingBalance)
          .toStringAsFixed(0);
    }
  }
}
