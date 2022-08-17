// 🎯 Dart imports:
import 'dart:async';
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../../../common/style.dart';

class KeuanganAnalisisController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  final Map<String, TextEditingController> listOfTextEditingController = {
    'Equity': TextEditingController(),
    'Debt': TextEditingController(),
    'Total': TextEditingController(),
    'Kredit yang diminta': TextEditingController(),
  };

  // Check if controller has been disposed

  @override
  void onClose() {
    // Disposing all the controllers
    listOfTextEditingController.forEach((name, value) {
      value.dispose();
    });
    super.onClose();
  }

  // Tab Controller
  TabController? tabController;

  // Analisa Ratio
  /// Ratio profit
  final ratioProfitKini = TextEditingController();
  final ratioProfitYAD = TextEditingController();

  /// ROE
  final roeKini = TextEditingController();
  final roeYAD = TextEditingController();

  /// ROA
  final roaKini = TextEditingController();
  final roaYAD = TextEditingController();

  /// DER
  final derKini = TextEditingController();
  final derYAD = TextEditingController();

  /// DSC
  final dscKini = TextEditingController();
  final dscYAD = TextEditingController();

  //Asumsi Keuangan
  /// Omzet input
  final omzetKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 30000000,
  );
  final omzetYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 34500000,
  );
  final omzetKiniPercent = TextEditingController(text: '100');
  final omzetYADPercent = TextEditingController(text: '100');

  /// Biaya bahan input
  final biayaBahanKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 21000000,
  );
  final biayaBahanYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 24150000,
  );
  final biayaBahanKiniPercent = TextEditingController(text: '');
  final biayaBahanYADPercent = TextEditingController(text: '');

  /// Upah input
  /// 800000
  /// 920000
  final upahKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 800000,
  );
  final upahYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 920000,
  );
  final upahKiniPercent = TextEditingController(text: '');
  final upahYADPercent = TextEditingController(text: '');

  // Biaya operasi
  // 500000
  // 575000
  final biayaOperasiKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 500000,
  );
  final biayaOperasiYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 575000,
  );
  final biayaOperasiKiniPercent = TextEditingController(text: '');
  final biayaOperasiYADPercent = TextEditingController(text: '');

  // Biaya hidup
  // 2500000
  final biayaHidupKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 2500000,
  );
  final biayaHidupYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 2500000,
  );
  final biayaHidupKiniPercent = TextEditingController(text: '');
  final biayaHidupYADPercent = TextEditingController(text: '');

  // Laba Usaha
  final labaUsahaKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 0,
  );
  final labaUsahaYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 0,
  );
  final labaUsahaKiniPercent = TextEditingController(text: '');
  final labaUsahaYADPercent = TextEditingController(text: '');

  // Ini Nilai Tetap
  final roeFixed = TextEditingController(text: '10');
  final roaFixed = TextEditingController(text: '8');
  final derFixed = TextEditingController(text: '200');
  final dscFixed = TextEditingController(text: '1.3');

  // Ini Data Keuangan
  // final equityInput = TextEditingController(text: '19933998');
  final equityInput = MoneyMaskedTextController(
    initialValue: 19933998,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final CurrencyTextInputFormatter equity = CurrencyTextInputFormatter(
    symbol: '',
    decimalDigits: 0,
  );

  // final debtInput = TextEditingController(text: '15459590');
  final debtInput = MoneyMaskedTextController(
    initialValue: 15459590,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final kreditYangDiminta = MoneyMaskedTextController(
    initialValue: 200000000,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final netWorth = MoneyMaskedTextController(
    initialValue: 204900000,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final netWorthPlusCredit = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Angsuran Pinjama Lain
  final bungaPerTahunLain = TextEditingController(text: '0');
  final angsuranPerBulanLainAtas = TextEditingController(text: '0');
  final angsuranPerBulanLainBawah = TextEditingController(text: '0');
  final totalBungaLainAtas = TextEditingController(text: '0');
  final totalBungaLainBawah = TextEditingController(text: '0');
  final unknownNumber = TextEditingController(text: '0');

  // Angsuran Pinjaman Kredit
  final bungaPerTahun = TextEditingController(text: '6');
  final angsuranPerBulan = TextEditingController(text: '60');
  // final totalBunga = TextEditingController(text: '3866560');

  // totalBunga with MoneyMaskedTextController
  final totalBunga = MoneyMaskedTextController(
    initialValue: 3866560,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Flat / Efektif
  final flatInitial = TextEditingController(text: '0');
  final efektifInitial = TextEditingController(text: '0');
  final totalFlatEfektif = TextEditingController(text: '0');
  final totalEfektif = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  final totalFlat = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Total Angsuran Keseluruhan
  final totalAngsuran = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final roeStatus = ''.obs;
  final isRoeLoading = false.obs;
  final isRoeDescLoading = false.obs;

  final roaStatus = ''.obs;
  final isRoaLoading = false.obs;
  final isRoaDescLoading = false.obs;

  final derStatus = ''.obs;
  final isDerLoading = false.obs;
  final isDerDescLoading = false.obs;

  final dscStatus = ''.obs;
  final isDscLoading = false.obs;
  final isDscDescLoading = false.obs;

  final isRatioProfitLoading = false.obs;

  final isKreditPassed = false.obs;
  final isVerificationButtonPressed = false.obs;

  final crr = TextEditingController(text: '0');
  final pinjamanMaksimal = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final perhitunganModalKerja = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final kebutuhanInvestasi = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final kebutuhanKredit = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final tradeCycle = TextEditingController(text: '8');

  void hitungPinjamanMaksimal() {
    // Check if parselabayad is an empty string
    if (labaUsahaYAD.text == '') {
      Get.snackbar(
        'Error',
        'Laba Usaha Masih Kosong',
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }

    // Check if pareDscFixed is an empty string
    if (dscFixed.text == '') {
      Get.snackbar(
        'Error',
        'Dsc Masih Kosong',
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }

    final parseLabaYad = double.parse(labaUsahaYAD.text.replaceAll('.', ''));
    final parseDscFixed = double.parse(dscFixed.text);
    final parseAngsuranPerBulanKredit = double.parse(angsuranPerBulan.text);

    final hasil =
        parseLabaYad / parseDscFixed * parseAngsuranPerBulanKredit * 0.80;

    pinjamanMaksimal.text = hasil.toStringAsFixed(0);
  }

  void checkIfCreditPassed() {
    if (pinjamanMaksimal.text == '0' || pinjamanMaksimal.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Pinjaman Maksimal Masih Kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 25,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception('Pinjaman Maksimal Masih Kosong');
    } else {
      final parseKreditYangDiminta =
          double.parse(kreditYangDiminta.text.replaceAll('.', ''));
      final parsePinjamanMaksimal =
          double.parse(pinjamanMaksimal.text.replaceAll('.', ''));

      isVerificationButtonPressed.value = true;

      if (parseKreditYangDiminta > parsePinjamanMaksimal) {
        isKreditPassed.value = true;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error',
          desc: 'Kredit yang diminta melebihi pinjaman maksimal',
          dialogBackgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 30,
          ),
          descTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 25,
          ),
          btnOkOnPress: () {},
        ).show();
      } else {
        isKreditPassed.value = false;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Success',
          dialogBackgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 30,
          ),
          desc: 'Kredit yang diminta tidak melebihi pinjaman maksimal',
          descTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 25,
          ),
          btnOkOnPress: () {},
        ).show();
      }
    }
  }

  void hitungCrr() {
    final parseDscYad = double.parse(dscYAD.text);
    final parseDscFixed = double.parse(dscFixed.text);

    if (parseDscYad >= 3.0) {
      crr.text = '95.0';
    }

    if (parseDscYad < parseDscFixed) {
      crr.text = '0';
    } else {
      final firstCount = parseDscYad - parseDscFixed;
      final secondCount = 3 - parseDscFixed;
      final thirdCount = firstCount / secondCount;
      final hasil = thirdCount * 35 + 60;

      print(hasil);

      crr.text = hasil.toStringAsFixed(2);

      print(crr.text);
    }
    // else {
    //   final firstCount = parseDscYad - parseDscFixed;
    //   final secondCount = 3 - parseDscFixed;
    //   final thirdCount = firstCount / secondCount;
    //   final hasil = thirdCount * 35 + 60;

    //   print(hasil);

    //   crr.text = hasil.toStringAsFixed(1);

    //   print(crr.text);
    // }
  }

  void hitungKebutuhanInvestasi() {
    final parseModalKerja =
        double.parse(perhitunganModalKerja.text.replaceAll('.', ''));
    final parseTradeCycle = double.parse(tradeCycle.text);

    final hasil = parseModalKerja * parseTradeCycle;

    kebutuhanInvestasi.text = hasil.toStringAsFixed(0);
  }

  void hitungKebutuhanKredit() {
    final parseKebutuhanInvestasi =
        double.parse(kebutuhanInvestasi.text.replaceAll('.', ''));

    final hasil = parseKebutuhanInvestasi * 0.90;
    print(hasil);
    kebutuhanKredit.text = hasil.toStringAsFixed(0);
  }

  void hitungPerhitunganModalKerja() {
    final parseBiayaBahanYAD =
        double.parse(biayaBahanYAD.text.replaceAll('.', ''));
    final parseUpahYAD = double.parse(upahYAD.text.replaceAll('.', ''));
    final parseBiayaOperasiYAD =
        double.parse(biayaOperasiYAD.text.replaceAll('.', ''));
    final parseBiayaHidupYAD =
        double.parse(biayaHidupYAD.text.replaceAll('.', ''));

    final hasil = parseBiayaBahanYAD +
        parseUpahYAD +
        parseBiayaOperasiYAD +
        parseBiayaHidupYAD;
    perhitunganModalKerja.text = hasil.toStringAsFixed(0);
  }

  void hitungSemua() {
    try {
      hitungPinjamanMaksimal();
      hitungPerhitunganModalKerja();

      hitungKebutuhanInvestasi();
      hitungKebutuhanKredit();
      hitungCrr();
    } catch (e) {
      if (FormatException == e.runtimeType) {
        Get.snackbar(
          'Error',
          'Format salah',
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  void hitungNetWorth() {
    try {
      final parseEquity = int.parse(equityInput.text.replaceAll('.', ''));
      final parseDebt = int.parse(debtInput.text.replaceAll('.', ''));

      netWorth.text = (parseEquity + parseDebt).toString();
    } catch (e) {
      if (debtInput.text == '') {
        AwesomeDialog(
          dialogType: DialogType.ERROR,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 20,
          ),
          animType: AnimType.BOTTOMSLIDE,
          title: 'Field Pinjaman Masih Kosong',
          btnOkOnPress: () {},
          context: Get.context!,
        ).show();
      }

      if (equityInput.text == '') {
        AwesomeDialog(
          dialogType: DialogType.ERROR,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 20,
          ),
          animType: AnimType.BOTTOMSLIDE,
          title: 'Field Modal Masih Kosong',
          btnOkOnPress: () {},
          context: Get.context!,
        ).show();
      }
    }
  }

  final isHitungTotalNetworgLoading = false.obs;

  void hitungNetWorthPlusCredit() {
    try {
      isHitungTotalNetworgLoading.value = true;

      final parseNetWorth = int.parse(netWorth.text.replaceAll('.', ''));
      final parseKreditYangDiminta =
          int.parse(kreditYangDiminta.text.replaceAll('.', ''));
      final hasil = parseNetWorth + parseKreditYangDiminta;

      netWorthPlusCredit.text = hasil.toString();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Jumlah asset masih kosong',
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void hitungTotalLaba() {
    final parseOmzetKini = int.tryParse(omzetKini.text.replaceAll('.', ''));
    final parseBiayaBahanKini =
        int.tryParse(biayaBahanKini.text.replaceAll('.', ''));
    final parseUpahKini = int.tryParse(upahKini.text.replaceAll('.', ''));
    final parseBiayaOperasiKini =
        int.tryParse(biayaOperasiKini.text.replaceAll('.', ''));
    final parseBiayaHidupKini =
        int.tryParse(biayaHidupKini.text.replaceAll('.', ''));

    labaUsahaKini.text = (parseOmzetKini! -
            parseBiayaBahanKini! -
            parseUpahKini! -
            parseBiayaOperasiKini! -
            parseBiayaHidupKini!)
        .toString();
    labaUsahaYAD.text = (int.parse(omzetYAD.text.replaceAll('.', '')) -
            int.parse(biayaBahanYAD.text.replaceAll('.', '')) -
            int.parse(upahYAD.text.replaceAll('.', '')) -
            int.parse(biayaOperasiYAD.text.replaceAll('.', '')) -
            int.parse(biayaHidupYAD.text.replaceAll('.', '')))
        .toString();
  }

  void hitungTotalAngsuran() {
    final parseTotalBungaLainAtas =
        int.parse(totalBungaLainAtas.text.replaceAll('.', ''));
    final parseTotalBungaLainBawah =
        int.parse(totalBungaLainBawah.text.replaceAll('.', ''));
    final parseTotalBunga = int.parse(totalBunga.text.replaceAll('.', ''));

    totalAngsuran.text =
        (parseTotalBungaLainAtas + parseTotalBungaLainBawah + parseTotalBunga)
            .toString();
  }

  void hitungTotalPersentasi() {
    final parseLabaUsahaKini =
        int.parse(labaUsahaKini.text.replaceAll('.', ''));
    final parseOmzetKini = int.parse(omzetKini.text.replaceAll('.', ''));
    final parseLabaUsahaYAD = int.parse(labaUsahaYAD.text.replaceAll('.', ''));
    final parseOmzetYAD = int.parse(omzetYAD.text.replaceAll('.', ''));

    labaUsahaKiniPercent.text =
        (parseLabaUsahaKini / parseOmzetKini).toStringAsFixed(2);

    labaUsahaYADPercent.text =
        (parseLabaUsahaYAD / parseOmzetYAD).toStringAsFixed(2);
  }

  void hitungPersentasiOtomatis() {
    // Check if biayaBahanKini and biayabahanYAD is empty or not
    if (biayaBahanKini.text == '' || biayaBahanYAD.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya bahan kini dan biaya bahan YAD tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception(
          'Biaya bahan kini dan biaya bahan YAD tidak boleh kosong');
    } else {
      final parseBiayaBahanKini =
          int.parse(biayaBahanKini.text.replaceAll('.', ''));
      final parseBiayaBahanYADBahan =
          int.parse(biayaBahanYAD.text.replaceAll('.', ''));
      final parseOmzetKini = int.parse(omzetKini.text.replaceAll('.', ''));
      final parseOmzetYADBahan = int.parse(omzetYAD.text.replaceAll('.', ''));

      biayaBahanKiniPercent.text =
          ((parseBiayaBahanKini / parseOmzetKini)).toStringAsFixed(2);
      biayaBahanYADPercent.text =
          ((parseBiayaBahanYADBahan / parseOmzetYADBahan)).toStringAsFixed(2);
    }

    // Check if upahKini and upahYAD is empty or not
    if (upahKini.text == '' || upahYAD.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        title: 'Error',
        desc: 'Upah kini dan upah YAD tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception('Upah kini dan upah YAD tidak boleh kosong');
    } else {
      final parseUpahKini = int.parse(upahKini.text.replaceAll('.', ''));
      final parseUpahYAD = int.parse(upahYAD.text.replaceAll('.', ''));
      final parseOmzetKini = int.parse(omzetKini.text.replaceAll('.', ''));
      final parseOmzetYAD = int.parse(omzetYAD.text.replaceAll('.', ''));

      upahKiniPercent.text =
          ((parseUpahKini / parseOmzetKini)).toStringAsFixed(2);
      upahYADPercent.text = ((parseUpahYAD / parseOmzetYAD)).toStringAsFixed(2);
    }

    // Check if  biayaOperasiKini and biayaOperasiYAD is empty or not
    if (biayaOperasiKini.text == '' || biayaOperasiYAD.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya operasi kini dan biaya operasi YAD tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception(
          'Biaya operasi kini dan biaya operasi YAD tidak boleh kosong');
    } else {
      final parseBiayaOperasiKini =
          int.parse(biayaOperasiKini.text.replaceAll('.', ''));
      final parseBiayaOperasiYAD =
          int.parse(biayaOperasiYAD.text.replaceAll('.', ''));
      final parseOmzetKini = int.parse(omzetKini.text.replaceAll('.', ''));
      final parseOmzetYAD = int.parse(omzetYAD.text.replaceAll('.', ''));

      biayaOperasiKiniPercent.text =
          ((parseBiayaOperasiKini / parseOmzetKini)).toStringAsFixed(2);
      biayaOperasiYADPercent.text =
          ((parseBiayaOperasiYAD / parseOmzetYAD)).toStringAsFixed(2);
    }

    // Check if biayaHidupKini and biayaHidupYAD is empty or not
    if (biayaHidupKini.text == '' || biayaHidupYAD.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Biaya hidup kini dan biaya hidup YAD tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception(
          'Biaya hidup kini dan biaya hidup YAD tidak boleh kosong');
    } else {
      final parseBiayaHidupKini =
          int.parse(biayaHidupKini.text.replaceAll('.', ''));
      final parseBiayaHidupYAD =
          int.parse(biayaHidupYAD.text.replaceAll('.', ''));
      final parseOmzetKini = int.parse(omzetKini.text.replaceAll('.', ''));
      final parseOmzetYAD = int.parse(omzetYAD.text.replaceAll('.', ''));
      biayaHidupKiniPercent.text =
          ((parseBiayaHidupKini / parseOmzetKini)).toStringAsFixed(2);
      biayaHidupYADPercent.text =
          ((parseBiayaHidupYAD / parseOmzetYAD)).toStringAsFixed(2);
    }
  }

  void hitungRatioProfit() {
    isRatioProfitLoading.value = true;
    final parseLabaUsahaKini =
        int.parse(labaUsahaKini.text.replaceAll('.', ''));
    final parseLabaUsahaYAD = int.parse(labaUsahaYAD.text.replaceAll('.', ''));
    final parseOmzetKini = int.parse(omzetKini.text.replaceAll('.', ''));
    final parseOmzetYAD = int.parse(omzetYAD.text.replaceAll('.', ''));

    // Delay 1 detik
    Future.delayed(
      const Duration(seconds: 1),
      () {
        ratioProfitKini.text =
            (parseLabaUsahaKini / parseOmzetKini * 100).toStringAsFixed(1);

        ratioProfitYAD.text =
            (parseLabaUsahaYAD / parseOmzetYAD * 100).toStringAsFixed(1);

        isRatioProfitLoading.value = false;
        Get.snackbar(
          'Success',
          'Ratio Profit berhasil dihitung',
          backgroundColor: primaryColor,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: secondaryColor,
          duration: const Duration(seconds: 2),
        );
      },
    );
  }

  void hitungRoe() {
    isRoeLoading.value = true;

    Future.delayed(
      const Duration(seconds: 2),
      () {
        final parseLabaUsaha =
            int.parse(labaUsahaKini.text.replaceAll('.', ''));
        final parseTotalAngsuran =
            int.parse(totalAngsuran.text.replaceAll('.', ''));
        final parseModal = int.parse(equityInput.text.replaceAll('.', ''));

        final parseLabaUsahaYad =
            int.parse(labaUsahaYAD.text.replaceAll('.', ''));

        final firstCount = parseLabaUsaha - parseTotalAngsuran;
        final parseModalPercentage = parseModal / 100;
        final secondCount = firstCount / parseModalPercentage;
        final thirdCount = secondCount * 24;

        final firstCountSecond = parseLabaUsahaYad - parseTotalAngsuran;
        final parseModalPercentageSecond = parseModal / 100;
        final secondCountSecond = firstCountSecond / parseModalPercentageSecond;
        final thirdCountSecond = secondCountSecond * 24;

        roeKini.text = thirdCount.toStringAsFixed(2);
        roeYAD.text = thirdCountSecond.toStringAsFixed(2);

        if (double.parse(roeYAD.text) > int.parse(roeFixed.text)) {
          isRoeDescLoading.value = true;

          Future.delayed(const Duration(seconds: 1), () {
            roeStatus.value = 'Baik 🥰';
            isRoeDescLoading.value = false;
          });
        }

        if (double.parse(roeYAD.text) < int.parse(roeFixed.text)) {
          isRoeDescLoading.value = true;
          // Delay for 2 seconds then run some code
          Future.delayed(const Duration(seconds: 1), () {
            roeStatus.value = 'Jelek 🤣';
            isRoeDescLoading.value = false;
          });
        }

        isRoeLoading.value = false;
        Get.snackbar(
          'Success',
          'ROE berhasil dihitung',
          backgroundColor: primaryColor,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: secondaryColor,
          duration: const Duration(seconds: 2),
        );
      },
    );
  }

  void hitungRoa() {
    if (netWorthPlusCredit.text == '') {
      // Throw an exceotion with AwesomeDialog
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Jumlah Asset + Pinjaman tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception('Net worth plus credit tidak boleh kosong');
    }

    if (labaUsahaKini.text == '0') {
      // Throw an exceotion with AwesomeDialog
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Laba usaha tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception('Laba usaha tidak boleh kosong');
    }

    if (labaUsahaYAD.text == '0') {
      // Throw an exceotion with AwesomeDialog
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Laba usaha tidak boleh kosong',
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.roboto(
          color: secondaryColor,
          fontSize: 30,
        ),
        descTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();
      throw Exception('Laba usaha tidak boleh kosong');
    }

    isRoaLoading.value = true;

    Future.delayed(
      const Duration(seconds: 2),
      () {
        final parseLabaUsahaKini =
            int.parse(labaUsahaKini.text.replaceAll('.', ''));
        final parseAngsuranPerBulanLainAtas =
            int.parse(angsuranPerBulanLainAtas.text.replaceAll('.', ''));
        final parseNetWorthPlusCredit =
            int.parse(netWorthPlusCredit.text.replaceAll('.', ''));
        final parseTotalBunga = int.parse(totalBunga.text.replaceAll('.', ''));
        final parseLabaUsahaYad =
            int.parse(labaUsahaYAD.text.replaceAll('.', ''));

        final firstCount = parseLabaUsahaKini - parseAngsuranPerBulanLainAtas;
        final parseModalPercentage = parseNetWorthPlusCredit / 100;
        final secondCount = firstCount / parseModalPercentage;
        final thirdCount = secondCount * 12;

        final firstCountSecond = parseLabaUsahaYad - parseTotalBunga;
        final parseModalPercentageSecond = parseNetWorthPlusCredit / 100;
        final secondCountSecond = firstCountSecond / parseModalPercentageSecond;
        final thirdCountSecond = secondCountSecond * 24;
        roaKini.text = thirdCount.toStringAsFixed(1);
        roaYAD.text = thirdCountSecond.toStringAsFixed(1);

        if (double.parse(roaYAD.text) > int.parse(roaFixed.text)) {
          isRoaDescLoading.value = true;
          // Delay for 2 seconds then run some code
          Future.delayed(const Duration(seconds: 1), () {
            roaStatus.value = 'Baik 🥰';
            isRoaDescLoading.value = false;
          });
        }

        if (double.parse(roaYAD.text) < int.parse(roaFixed.text)) {
          isRoaDescLoading.value = true;
          // Delay for 2 seconds then run some code
          Future.delayed(const Duration(seconds: 1), () {
            roaStatus.value = 'Jelek 🤣';
            isRoaDescLoading.value = false;
          });
        }

        isRoaLoading.value = false;
        Get.snackbar(
          'Success',
          'ROA berhasil dihitung',
          backgroundColor: primaryColor,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: secondaryColor,
          duration: const Duration(seconds: 2),
        );
      },
    );
  }

  void hitungDer() {
    isDerLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      final parseDebt = double.parse(debtInput.text.replaceAll('.', ''));
      final parseEquity = int.parse(equityInput.text.replaceAll('.', ''));
      final parseKreditYangDiminta =
          int.parse(kreditYangDiminta.text.replaceAll('.', ''));

      final percentage = parseEquity / 100;
      final result = parseDebt / percentage;

      final hitungDerYadFirst = parseDebt + parseKreditYangDiminta;
      const hitungDerYadSecond = 3134404;
      final hitungDerYadThird = hitungDerYadFirst / hitungDerYadSecond;

      derKini.text = result.toStringAsFixed(0);
      derYAD.text = hitungDerYadThird.toStringAsFixed(1);

      if (double.parse(derYAD.text) > int.parse(derFixed.text)) {
        isDerDescLoading.value = true;
        // Delay for 2 seconds then run some code
        Future.delayed(const Duration(seconds: 1), () {
          derStatus.value = 'Ditolak ❌';
          isDerDescLoading.value = false;
        });
      }

      if (double.parse(derYAD.text) <= int.parse(derFixed.text)) {
        isDerDescLoading.value = true;
        // Delay for 2 seconds then run some code
        Future.delayed(const Duration(seconds: 1), () {
          derStatus.value = 'Diterima 🤝';
          isDerDescLoading.value = false;
        });
      }

      isDerLoading.value = false;
      Get.snackbar(
        'Success',
        'DER berhasil dihitung',
        backgroundColor: primaryColor,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        colorText: secondaryColor,
        duration: const Duration(seconds: 2),
      );
    });
  }

  void hitungDsc() {
    isDscLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      final parseLabaUsahaKini =
          int.parse(labaUsahaKini.text.replaceAll('.', ''));
      final parseLabaYad = int.parse(labaUsahaYAD.text.replaceAll('.', ''));
      final parseTotalAngsuran =
          int.parse(totalAngsuran.text.replaceAll('.', ''));

      final firstCount = parseLabaUsahaKini / parseTotalAngsuran;
      final secondCount = parseLabaYad / parseTotalAngsuran;

      dscKini.text = firstCount.toStringAsFixed(1);
      dscYAD.text = secondCount.toStringAsFixed(1);

      if (double.parse(dscYAD.text) >= double.parse(dscFixed.text)) {
        isDscDescLoading.value = true;
        // Delay for 2 seconds then run some code
        Future.delayed(const Duration(seconds: 1), () {
          dscStatus.value = 'Diterima 🤝';
          isDscDescLoading.value = false;
        });
      }

      if (double.parse(dscYAD.text) < double.parse(dscFixed.text)) {
        isDscDescLoading.value = true;
        // Delay for 2 seconds then run some code
        Future.delayed(const Duration(seconds: 1), () {
          dscStatus.value = 'Ditolak ❌';
          isDscDescLoading.value = false;
        });
      }

      isDscLoading.value = false;
      Get.snackbar(
        'Success',
        'DSC berhasil dihitung',
        backgroundColor: primaryColor,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        colorText: secondaryColor,
        duration: const Duration(seconds: 2),
      );
    });
  }

  void hitungFlatAndEfektif() {
    try {
      flatInitial.text =
          (int.parse(bungaPerTahun.text) / 1200).toStringAsFixed(5);

      final plusOne = (double.parse(flatInitial.text) + 1);
      final powPlusOneDenganAngsuranPerBulan =
          pow(plusOne, int.parse(angsuranPerBulan.text));

      efektifInitial.text =
          (1 / powPlusOneDenganAngsuranPerBulan).toStringAsFixed(5);

      final minusOne = (1 - double.parse(efektifInitial.text));
      final result = (double.parse(flatInitial.text) / minusOne);

      totalFlatEfektif.text = result.toStringAsFixed(9);
    } catch (e) {
      if (bungaPerTahun.text == '') {
        AwesomeDialog(
          dialogType: DialogType.ERROR,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 30,
          ),
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error',
          desc: 'Field bunga per tahun masih kosong',
          descTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 15,
          ),
          btnOkOnPress: () {},
          context: Get.context!,
        ).show();
      }

      if (angsuranPerBulan.text == '') {
        AwesomeDialog(
          dialogType: DialogType.ERROR,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 30,
          ),
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error',
          desc: 'Field Angsuran per bulan masih kosong',
          descTextStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 15,
          ),
          btnOkOnPress: () {},
          context: Get.context!,
        ).show();
      }
    }
  }

  void hitungTotalFlatEfektif() {
    final efektifBawah = (double.parse(totalFlatEfektif.text) *
        (int.parse(kreditYangDiminta.text.replaceAll('.', ''))));

    final parseKreditYangDiajukan =
        int.parse(kreditYangDiminta.text.replaceAll('.', ''));
    final parseBungaPerTahun =
        int.parse(bungaPerTahun.text.replaceAll('.', ''));
    final parseAngsuranPerBulan =
        int.parse(angsuranPerBulan.text.replaceAll('.', ''));

    if (parseKreditYangDiajukan == 0) {
      totalFlat.text = '0';
    }

    final firstCount = (parseKreditYangDiajukan * parseBungaPerTahun);
    final secondCount = (firstCount / 1200);
    final thirdCount = (secondCount * parseAngsuranPerBulan);
    final fourthCount = (thirdCount + parseKreditYangDiajukan);
    final fifthCount = (fourthCount / parseAngsuranPerBulan);

    totalFlat.text = fifthCount.toStringAsFixed(0);
    totalEfektif.text = efektifBawah.toStringAsFixed(0);
  }
}
