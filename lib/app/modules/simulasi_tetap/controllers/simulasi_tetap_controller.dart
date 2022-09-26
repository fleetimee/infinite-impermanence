import 'package:akm/app/common/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:finance/finance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terbilang_id/terbilang_id.dart';

class SimulasiTetapController extends GetxController {
  @override
  void onReady() {
    warning();
    super.onReady();
  }

  final formKey = GlobalKey<FormBuilderState>();

  final plafon = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final tenor = TextEditingController();

  final bunga = TextEditingController();

  final hasil = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final hasil2 = TextEditingController();

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

  void hitung() {
    // Parse Nilai
    final parsePlafon = double.parse(plafon.text.replaceAll('.', ''));
    final parseTenor = double.parse(tenor.text);
    final parseBungaRaw = double.parse(bunga.text);
    final parseBunga = (double.parse(bunga.text) / 100);

    final first = Finance.pmt(
          rate: parseBunga / 12,
          nper: parseTenor,
          pv: parsePlafon,
        ) *
        -1 %
        5;

    final second = Finance.pmt(
          rate: parseBunga / 12,
          nper: parseTenor,
          pv: parsePlafon,
        ) *
        -1;

    final ifTrue = second - first + 5;
    final ifFalse = second - first;

    if (second > 2) {
      hasil.text = ifTrue.toStringAsFixed(0);
      hasil2.text =
          'Dengan plafon sebesar ${Terbilang().terbilang(parsePlafon)} rupiah dengan tenor selama $parseTenor bulan dan bunga sebesar ${parseBungaRaw.toStringAsFixed(0)}% floating rate pertahun, maka tiap bulannya debitur harus membayar secara tetap sebesar ${Terbilang().terbilang(double.parse(ifTrue.toString()))} rupiah';
    } else {
      hasil.text = ifFalse.toStringAsFixed(0);
      hasil2.text =
          'Dengan plafon sebesar ${Terbilang().terbilang(parsePlafon)} rupiah dengan tenor selama $parseTenor bulan dan bunga sebesar ${parseBungaRaw.toStringAsFixed(0)}% floating rate pertahun, maka tiap bulannya debitur harus membayar secara tetap sebesar ${Terbilang().terbilang(double.parse(ifTrue.toString()))} rupiah';
    }

    debugPrint(hasil.text);
  }
}
