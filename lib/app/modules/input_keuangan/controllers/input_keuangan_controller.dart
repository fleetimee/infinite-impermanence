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
 import '../../../common/style.dart';
 import '../../../service/input_keuangan_service.dart';

class InputKeuanganController extends GetxController {
  var context = Get.context;

  var formKeyInputKeuangan = GlobalKey<FormBuilderState>();

  var kreditYangDiusulkan = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  var rugiLaba = TextEditingController();
  var debitur = TextEditingController();

  var angsuranPerBulan = TextEditingController();
  var provisi = TextEditingController();
  var sistemAngsuran = ''.obs;
  var digunakanUntuk = TextEditingController();
  var bungaPerTahun = TextEditingController();

  var totalAngsuran = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  var pinjamanLainnya = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var angsuranPinjamanLainnya = TextEditingController(text: '0');

  var nilaiAset = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var penjualanKini = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var hpp = TextEditingController(text: '75');

  var biayaBahanKini = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
    initialValue: 0,
  );

  var biayaUpahKini = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var biayaOperasionalKini = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var biayaHidupKini = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var penjualanYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var biayaBahanYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var biayaUpahYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var biayaOperasionalYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var biayaHidupYad = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var tradeCycle = TextEditingController(text: '0');

  void mothlyPaymentCalculation() {
    if (kreditYangDiusulkan.text == '0' || kreditYangDiusulkan.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
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
        double.parse(penjualanKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaBahanKini =
        double.parse(biayaBahanKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaUpahKini =
        double.parse(biayaUpahKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaOperasionalKini =
        double.parse(biayaOperasionalKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaHidupKini =
        double.parse(biayaHidupKini.text.replaceAll('.', '')) * 1;

    penjualanYad.text = parsePenjualanKini.toStringAsFixed(0);
    biayaBahanYad.text = parseBiayaBahanKini.toStringAsFixed(0);
    biayaUpahYad.text = parseBiayaUpahKini.toStringAsFixed(0);
    biayaOperasionalYad.text = parseBiayaOperasionalKini.toStringAsFixed(0);
    biayaHidupYad.text = parseBiayaHidupKini.toStringAsFixed(0);
  }

  void saveKeuangan() {
    final api = InputKeuanganService();

    final data = {
      'kredit_diusulkan': kreditYangDiusulkan.text.replaceAll('.', ''),
      'angsuran': angsuranPerBulan.text,
      'bunga_per_tahun': bungaPerTahun.text,
      'provisi': provisi.text,
      'sistem_angsuran': sistemAngsuran.toString(),
      'digunakan_untuk': digunakanUntuk.text,
      'angsuran_rp': totalAngsuran.text.replaceAll('.', ''),
      // 'pinjaman_lainnya': pinjamanLainnya.text.replaceAll('.', ''),
      // 'angsuran_pinjaman_lainnya':
      //     angsuranPinjamanLainnya.text.replaceAll('.', ''),
      // 'nilai_aset': nilaiAset.text.replaceAll('.', ''),
      'penjualan_kini': penjualanKini.text.replaceAll('.', ''),
      'hpp': hpp.text,
      'biaya_bahan_kini': biayaBahanKini.text.replaceAll('.', ''),
      'biaya_operasional_kini': biayaOperasionalKini.text.replaceAll('.', ''),
      'biaya_upah_kini': biayaUpahKini.text.replaceAll('.', ''),
      'biaya_hidup_kini': biayaHidupKini.text.replaceAll('.', ''),
      'penjualan_asumsi': penjualanYad.text.replaceAll('.', ''),
      'biaya_bahan_asumsi': biayaBahanYad.text.replaceAll('.', ''),
      'biaya_operasional_asumsi': biayaOperasionalYad.text.replaceAll('.', ''),
      'biaya_upah_asumsi': biayaUpahYad.text.replaceAll('.', ''),
      'biaya_hidup_asumsi': biayaHidupYad.text.replaceAll('.', ''),
      'trade_cycle': tradeCycle.text,
      'debitur': debitur.text,
      'rugilaba': rugiLaba.text,
    };

    api.addKeuangan(data);

    update();
  }
}
