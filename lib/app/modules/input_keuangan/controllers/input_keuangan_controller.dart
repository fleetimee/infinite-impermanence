// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:finance/finance.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';

class InputKeuanganController extends GetxController {
  final context = Get.context;

  final formKeyInputKeuangan = GlobalKey<FormBuilderState>();

  final kreditYangDiusulkan = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final angsuranPerBulan = TextEditingController();
  final provisi = TextEditingController();
  final sistemAngsuran = ''.obs;
  final digunakanUntuk = TextEditingController();
  final bungaPerTahun = TextEditingController();

  final totalAngsuran = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  final pinjamanLainnya = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final angsuranPinjamanLainnya = TextEditingController(text: '0');

  final nilaiAset = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final penjualanKini = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final hpp = TextEditingController(text: '20');

  final biayaBahanKini = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaUpahKini = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaOperasionalKini = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaHidupKini = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final penjualanYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaBahanYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaUpahYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaOperasionalYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final biayaHidupYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  void mothlyPaymentCalculation() {
    if (kreditYangDiusulkan.text == '0' || kreditYangDiusulkan.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Kredit yang diusulkan masih kosong',
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
      ).show();
      throw Exception('Pinjaman Maksimal Masih Kosong');
    }

    if (angsuranPerBulan.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Angsuran per bulan masih kosong',
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
      ).show();
      throw Exception('Angsuran per bulan masih kosong');
    }

    if (bungaPerTahun.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Bunga per tahun masih kosong',
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
      ).show();
      throw Exception('Bunga per tahun masih kosong');
    }

    final parseBungaPerTahun = double.parse(bungaPerTahun.text);
    final parseBungaPerTahunAsDecimal = parseBungaPerTahun / 100;
    final parseAngsuranPerBulanKredit = int.parse(angsuranPerBulan.text);
    final parseKreditYangDiminta =
        double.parse(kreditYangDiusulkan.text.replaceAll('.', ''));

    final hitungAwal = Finance.pmt(
          rate: parseBungaPerTahunAsDecimal / 12,
          nper: parseAngsuranPerBulanKredit,
          pv: parseKreditYangDiminta,
        ) *
        -1 %
        5;

    final hitungKedua = Finance.pmt(
          rate: parseBungaPerTahunAsDecimal / 12,
          nper: parseAngsuranPerBulanKredit,
          pv: parseKreditYangDiminta,
        ) *
        -1;

    final ifBenar = hitungKedua - hitungAwal + 5;
    final ifSalah = hitungKedua - hitungAwal;

    if (hitungAwal > 2) {
      totalAngsuran.text = ifBenar.toStringAsFixed(0);
    } else {
      totalAngsuran.text = ifSalah.toStringAsFixed(0);
    }
  }

  void hitungBiayaBahanHpp() {
    if (penjualanKini.text == '' || penjualanKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Penjualan kini masih kosong',
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
      ).show();
      throw Exception('Penjualan kini masih kosong');
    }

    final parsePenjualanKini =
        double.parse(penjualanKini.text.replaceAll('.', ''));
    final parseHpp = double.parse(hpp.text) / 100;

    final hitungBiayaBahanKini = parsePenjualanKini * parseHpp;

    biayaBahanKini.text = hitungBiayaBahanKini.toStringAsFixed(0);
  }

  void hitungAsumsiPenjualan() {
    if (penjualanKini.text == '' || penjualanKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Penjualan kini masih kosong',
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
      ).show();
      throw Exception('Penjualan kini masih kosong');
    }

    if (biayaBahanKini.text == '' || biayaBahanKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya bahan kini masih kosong',
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
      ).show();
      throw Exception('Biaya bahan kini masih kosong');
    }

    if (biayaUpahKini.text == '' || biayaUpahKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya upah kini masih kosong',
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
      ).show();
      throw Exception('Biaya upah kini masih kosong');
    }

    if (biayaOperasionalKini.text == '' || biayaOperasionalKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya operasional kini masih kosong',
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
      ).show();
      throw Exception('Biaya operasional kini masih kosong');
    }

    if (biayaHidupKini.text == '' || biayaHidupKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya hidup kini masih kosong',
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
      ).show();
      throw Exception('Biaya hidup kini masih kosong');
    }

    final parsePenjualanKini =
        double.parse(penjualanKini.text.replaceAll('.', '')) * 1.15;
    final parseBiayaBahanKini =
        double.parse(biayaBahanKini.text.replaceAll('.', '')) * 1.15;
    final parseBiayaUpahKini =
        double.parse(biayaUpahKini.text.replaceAll('.', '')) * 1.15;
    final parseBiayaOperasionalKini =
        double.parse(biayaOperasionalKini.text.replaceAll('.', '')) * 1.15;
    final parseBiayaHidupKini =
        double.parse(biayaHidupKini.text.replaceAll('.', '')) * 1.15;

    penjualanYad.text = parsePenjualanKini.toStringAsFixed(0);
    biayaBahanYad.text = parseBiayaBahanKini.toStringAsFixed(0);
    biayaUpahYad.text = parseBiayaUpahKini.toStringAsFixed(0);
    biayaOperasionalYad.text = parseBiayaOperasionalKini.toStringAsFixed(0);
    biayaHidupYad.text = parseBiayaHidupKini.toStringAsFixed(0);
  }
}
