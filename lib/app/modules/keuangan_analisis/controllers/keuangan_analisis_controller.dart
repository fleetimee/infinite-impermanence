// 🎯 Dart imports:
// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:async';
import 'dart:math';

// 🐦 Flutter imports:
import 'package:akm/app/data/provider/analisis_keuangan/save_analis_keuangan.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:finance/finance.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../../../common/style.dart';

// 🌎 Project imports:

class KeuanganAnalisisController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  final isKeuanganAnalisisProcessing = false.obs;
  final debiturController = Get.put(InsightDebiturController());

  final data = Get.arguments;

  final isAnalisaKeuanganProcessing = false.obs;

  final Map<String, TextEditingController> listOfTextEditingController = {
    'Equity': TextEditingController(),
    'Debt': TextEditingController(),
    'Total': TextEditingController(),
    'Kredit yang diminta': TextEditingController(),
  };

  // @override
  // void onClose() {
  //   // // Disposing all the controllers
  //   // listOfTextEditingController.forEach((name, value) {
  //   //   value.dispose();
  //   // });

  //   // equityInput.dispose();
  //   super.onClose();
  // }

  // ! FormKey
  final formKeyAnalisaKeuangan = GlobalKey<FormBuilderState>();

  //! Tab Controller
  TabController? tabController;

  //! Data Keuangan
  var debiturId = TextEditingController();
  var keuanganId = TextEditingController();

  var equityInput = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  final CurrencyTextInputFormatter equity = CurrencyTextInputFormatter(
    symbol: '',
    decimalDigits: 0,
  );

  var debtInput = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var kreditYangDiminta = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var netWorth = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var netWorthPlusCredit = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  //! Angsuran
  // Angsuran Pinjaman Lain
  var bungaPerTahunLain = TextEditingController(text: '0');
  var angsuranPerBulanLainAtas = TextEditingController(text: '0');
  var angsuranPerBulanLainBawah = TextEditingController(text: '0');
  var totalBungaLainAtas = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var totalBungaLainBawah = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Angsuran Pinjaman Kredit
  var bungaPerTahun = TextEditingController();
  var angsuranPerBulan = TextEditingController();
  var totalBunga = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Flat / Efektif
  var flatInitial = TextEditingController(text: '0');
  var efektifInitial = TextEditingController(text: '0');
  var totalFlatEfektif = TextEditingController(text: '0');
  var totalEfektif = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var totalFlat = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  // Total Angsuran Keseluruhan
  var totalAngsuran = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  //! Analisa Ratio
  // Ratio profit
  var ratioProfitKini = TextEditingController();
  var ratioProfitYAD = TextEditingController();

  /// ROE
  var roeKini = TextEditingController();
  var roeYAD = TextEditingController();
  var keteranganRoe = TextEditingController();

  /// ROA
  var roaKini = TextEditingController();
  var roaYAD = TextEditingController();
  var keteranganRoa = TextEditingController();

  /// DER
  var derKini = TextEditingController();
  var derYAD = TextEditingController();
  var keteranganDer = TextEditingController();

  /// DSC
  var dscKini = TextEditingController();
  var dscYAD = TextEditingController();
  var keteranganDsc = TextEditingController();

  // Ini Nilai Tetap
  var roeFixed = TextEditingController(text: '10');
  var roaFixed = TextEditingController(text: '8');
  var derFixed = TextEditingController(text: '200');
  var dscFixed = TextEditingController(text: '1.3');

  //! Asumsi Keuangan
  /// Omzet input
  var omzetKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var omzetYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var omzetKiniPercent = TextEditingController(text: '100');
  var omzetYADPercent = TextEditingController(text: '100');

  /// Biaya bahan input
  var biayaBahanKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var biayaBahanYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var biayaBahanKiniPercent = TextEditingController(text: '');
  var biayaBahanYADPercent = TextEditingController(text: '');
  var upahKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var upahYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var upahKiniPercent = TextEditingController(text: '');
  var upahYADPercent = TextEditingController(text: '');

  var biayaOperasiKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var biayaOperasiYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var biayaOperasiKiniPercent = TextEditingController(text: '');
  var biayaOperasiYADPercent = TextEditingController(text: '');

  var biayaHidupKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var biayaHidupYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  var biayaHidupKiniPercent = TextEditingController(text: '');
  var biayaHidupYADPercent = TextEditingController(text: '');

  // Laba Usaha
  var labaUsahaKini = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 0,
  );
  var labaUsahaYAD = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
    initialValue: 0,
  );
  var labaUsahaKiniPercent = TextEditingController(text: '');
  var labaUsahaYADPercent = TextEditingController(text: '');

  //! Summary
  var crr = TextEditingController(text: '0');
  var pinjamanMaksimal = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var perhitunganModalKerja = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var kebutuhanInvestasi = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var kebutuhanKredit = MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var tradeCycle = TextEditingController();

  //! Boolean and Loading
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
  final isHitungTotalNetworgLoading = false.obs;

  void hitungPinjamanBankLain() {
    final parseDebt = int.parse(debtInput.text.replaceAll('.', ''));
    final parseBungaPerTahunLain = double.parse(bungaPerTahunLain.text) / 100;
    final paseAngsuranPerBulanLain =
        double.parse(angsuranPerBulanLainAtas.text);

    if (parseBungaPerTahunLain == 0 || bungaPerTahunLain.text == '') {
      totalBungaLainAtas.text = '0';
    } else {
      final firstCount =
          parseDebt * parseBungaPerTahunLain / 12 * paseAngsuranPerBulanLain;
      final secondCount = firstCount + parseDebt;
      final thirdCount = secondCount / paseAngsuranPerBulanLain;

      totalBungaLainAtas.text = thirdCount.toStringAsFixed(0);
    }
  }

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
        snackPosition: SnackPosition.bottom,
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
        snackPosition: SnackPosition.bottom,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Pinjaman Maksimal Masih Kosong',
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
    } else {
      final parseKreditYangDiminta =
          double.parse(kreditYangDiminta.text.replaceAll('.', ''));
      final parsePinjamanMaksimal =
          double.parse(pinjamanMaksimal.text.replaceAll('.', ''));

      isVerificationButtonPressed.value = true;

      if (parseKreditYangDiminta > parsePinjamanMaksimal) {
        isKreditPassed.value = false;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: 'Kredit yang diminta melebihi pinjaman maksimal',
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
        print(isKreditPassed.value);
      } else {
        isKreditPassed.value = true;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success',
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
          desc: 'Kredit yang diminta tidak melebihi pinjaman maksimal',
          btnOkOnPress: () {},
        ).show();
        print(isKreditPassed.value);
      }
    }
  }

  void mothlyPaymentCalculation() {
    final parseBungaPerTahun = double.parse(bungaPerTahun.text);
    final parseBungaPerTahunAsDecimal = parseBungaPerTahun / 100;
    final parseAngsuranPerBulanKredit = double.parse(angsuranPerBulan.text);
    final parseKreditYangDiminta =
        double.parse(kreditYangDiminta.text.replaceAll('.', ''));

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
      totalBunga.text = ifBenar.toStringAsFixed(0);
    } else {
      totalBunga.text = ifSalah.toStringAsFixed(0);
    }
  }

  double roundDoubleDown(double value, int places) {
    final mod = pow(10.0, places);
    return ((value * mod).floor().toDouble() / mod);
  }

  void hitungCrr() {
    final parseLabaYad = double.parse(labaUsahaYAD.text.replaceAll('.', ''));
    final parseTotalAngsuran =
        double.parse(totalAngsuran.text.replaceAll('.', ''));

    final dscYad = parseLabaYad / parseTotalAngsuran;

    final parseDscYad = double.parse(dscYAD.text);
    final parseDscFixed = double.parse(dscFixed.text);
    final parseIsKreditPassed = isKreditPassed.value;

    if (parseDscYad >= 3.0) {
      crr.text = '95.0';
    } else if (parseIsKreditPassed == false) {
      crr.text = '0';
    } else if (parseDscYad < parseDscFixed) {
      crr.text = '0';
    } else {
      final firstCount = dscYad - parseDscFixed;
      final secondCount = (3 - parseDscFixed);
      final thirdCount = firstCount / secondCount;
      final hasil = thirdCount * 35 + 60;

      crr.text = hasil.toStringAsFixed(2);
    }
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
          snackPosition: SnackPosition.bottom,
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
          dialogType: DialogType.error,
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
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: 'Field Pinjaman Masih Kosong',
          btnOkOnPress: () {},
          context: Get.context!,
        ).show();
      }

      if (equityInput.text == '') {
        AwesomeDialog(
          dialogType: DialogType.error,
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
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: 'Field Modal Masih Kosong',
          btnOkOnPress: () {},
          context: Get.context!,
        ).show();
      }
    }
  }

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
        snackPosition: SnackPosition.bottom,
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya bahan kini dan biaya bahan YAD tidak boleh kosong',
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
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'Upah kini dan upah YAD tidak boleh kosong',
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya operasi kini dan biaya operasi YAD tidak boleh kosong',
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
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya hidup kini dan biaya hidup YAD tidak boleh kosong',
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
      snackPosition: SnackPosition.bottom,
      colorText: secondaryColor,
      duration: const Duration(seconds: 2),
    );
  }

  void hitungRoe() {
    isRoeLoading.value = true;

    final parseLabaUsaha = int.parse(labaUsahaKini.text.replaceAll('.', ''));
    final parseTotalAngsuran =
        int.parse(totalAngsuran.text.replaceAll('.', ''));
    final parseModal = int.parse(equityInput.text.replaceAll('.', ''));

    final parseLabaUsahaYad = int.parse(labaUsahaYAD.text.replaceAll('.', ''));

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
        keteranganRoe.text = 'Baik';
        isRoeDescLoading.value = false;
      });
    }

    if (double.parse(roeYAD.text) < int.parse(roeFixed.text)) {
      isRoeDescLoading.value = true;
      // Delay for 2 seconds then run some code
      Future.delayed(const Duration(seconds: 1), () {
        roeStatus.value = 'Jelek 🤣';
        keteranganRoe.text = 'Jelek';
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
      snackPosition: SnackPosition.bottom,
      colorText: secondaryColor,
      duration: const Duration(seconds: 2),
    );
  }

  void hitungRoa() {
    if (netWorthPlusCredit.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Jumlah Asset + Pinjaman tidak boleh kosong',
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
      throw Exception('Net worth plus credit tidak boleh kosong');
    }

    if (labaUsahaKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Laba usaha tidak boleh kosong',
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
      throw Exception('Laba usaha tidak boleh kosong');
    }

    if (labaUsahaYAD.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Laba usaha tidak boleh kosong',
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
      throw Exception('Laba usaha tidak boleh kosong');
    }

    isRoaLoading.value = true;
    final parseLabaUsahaKini =
        int.parse(labaUsahaKini.text.replaceAll('.', ''));
    final parseAngsuranPerBulanLainAtas =
        int.parse(angsuranPerBulanLainAtas.text.replaceAll('.', ''));
    final parseNetWorthPlusCredit =
        int.parse(netWorthPlusCredit.text.replaceAll('.', ''));
    final parseTotalBunga = int.parse(totalBunga.text.replaceAll('.', ''));
    final parseLabaUsahaYad = int.parse(labaUsahaYAD.text.replaceAll('.', ''));

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
        keteranganRoa.text = 'Baik';
        isRoaDescLoading.value = false;
      });
    }

    if (double.parse(roaYAD.text) < int.parse(roaFixed.text)) {
      isRoaDescLoading.value = true;
      // Delay for 2 seconds then run some code
      Future.delayed(const Duration(seconds: 1), () {
        keteranganRoa.text = 'Jelek';
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
      snackPosition: SnackPosition.bottom,
      colorText: secondaryColor,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
  }

  void hitungDer() {
    isDerLoading.value = true;

    final parseDebt = double.parse(debtInput.text.replaceAll('.', ''));
    final parseEquity = int.parse(equityInput.text.replaceAll('.', ''));
    final parseKreditYangDiminta =
        int.parse(kreditYangDiminta.text.replaceAll('.', ''));

    final percentage = parseEquity / 100;
    final result = parseDebt / percentage;

    final hitungDerYadFirst = parseDebt + parseKreditYangDiminta;
    final hitungDerYadThird = hitungDerYadFirst / percentage;

    derKini.text = result.toStringAsFixed(0);
    derYAD.text = hitungDerYadThird.toStringAsFixed(1);

    if (double.parse(derYAD.text) > int.parse(derFixed.text)) {
      isDerDescLoading.value = true;
      // Delay for 2 seconds then run some code
      Future.delayed(const Duration(seconds: 1), () {
        derStatus.value = 'Ditolak ❌';
        keteranganDer.text = 'Ditolak';
        isDerDescLoading.value = false;
      });
    }

    if (double.parse(derYAD.text) <= int.parse(derFixed.text)) {
      isDerDescLoading.value = true;
      // Delay for 2 seconds then run some code
      Future.delayed(const Duration(seconds: 1), () {
        derStatus.value = 'Diterima 🤝';
        keteranganDer.text = 'Diterima';
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
      snackPosition: SnackPosition.bottom,
      colorText: secondaryColor,
      duration: const Duration(seconds: 2),
    );
  }

  void hitungDsc() {
    isDscLoading.value = true;

    final parseLabaUsahaKini =
        int.parse(labaUsahaKini.text.replaceAll('.', ''));
    final parseLabaYad = double.parse(labaUsahaYAD.text.replaceAll('.', ''));
    final parseTotalAngsuran =
        double.parse(totalAngsuran.text.replaceAll('.', ''));

    final firstCount = parseLabaUsahaKini / parseTotalAngsuran;
    final secondCount = parseLabaYad / parseTotalAngsuran;

    dscKini.text = firstCount.toStringAsFixed(1);
    dscYAD.text = secondCount.toStringAsFixed(1);

    if (double.parse(dscYAD.text) >= double.parse(dscFixed.text)) {
      isDscDescLoading.value = true;
      // Delay for 2 seconds then run some code
      Future.delayed(const Duration(seconds: 1), () {
        dscStatus.value = 'Diterima 🤝';
        keteranganDsc.text = 'Diterima';
        isDscDescLoading.value = false;
      });
    }

    if (double.parse(dscYAD.text) < double.parse(dscFixed.text)) {
      isDscDescLoading.value = true;
      // Delay for 2 seconds then run some code
      Future.delayed(const Duration(seconds: 1), () {
        dscStatus.value = 'Ditolak ❌';
        keteranganDsc.text = 'Ditolak';
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
      snackPosition: SnackPosition.bottom,
      colorText: secondaryColor,
      duration: const Duration(seconds: 2),
    );
  }

  void saveAnalisisKeuangan() {
    final body = {
      'debitur': debiturId.text,
      'keuangan': keuanganId.text,
      'total_aset': equityInput.text.replaceAll('.', ''),
      'jumlah_aset_kini': netWorth.text.replaceAll('.', ''),
      'total_angsuran_keseluruhan': netWorthPlusCredit.text.replaceAll('.', ''),
      'persen_omzet_kini': omzetKiniPercent.text,
      'persen_omzet_yad': omzetYADPercent.text,
      'persen_biaya_bahan_kini': biayaBahanKiniPercent.text,
      'persen_biaya_bahan_yad': biayaBahanYADPercent.text,
      'persen_biaya_operasi_kini': biayaOperasiKiniPercent.text,
      'persen_biaya_operasi_yad': biayaOperasiYADPercent.text,
      'persen_biaya_upah_kini': upahKiniPercent.text,
      'persen_biaya_upah_yad': upahYADPercent.text,
      'persen_biaya_hidup_kini': biayaHidupKiniPercent.text,
      'persen_biaya_hidup_yad': biayaHidupYADPercent.text,
      'total_laba_usaha_kini': labaUsahaKini.text.replaceAll('.', ''),
      'total_laba_usaha_yad': labaUsahaYAD.text.replaceAll('.', ''),
      'persen_laba_usaha_kini': labaUsahaKiniPercent.text,
      'persen_laba_usaha_yad': labaUsahaYADPercent.text,
      'persen_ratio_kini': ratioProfitKini.text,
      'persen_ratio_yad': ratioProfitYAD.text,
      'persen_roe_kini': roeKini.text,
      'persen_roe_yad': roeYAD.text,
      'keterangan_roe': keteranganRoe.text,
      'persen_roa_kini': roaKini.text,
      'persen_roa_yad': roaYAD.text,
      'keterangan_roa': keteranganRoa.text,
      'persen_der_kini': derKini.text,
      'persen_der_yad': derYAD.text,
      'keterangan_der': keteranganDer.text,
      'persen_dsc_kini': dscKini.text,
      'persen_dsc_yad': dscYAD.text,
      'keterangan_dsc': keteranganDsc.text,
      'kredit_disetujuin': isKreditPassed.value,
      'pinjaman_maksimal': pinjamanMaksimal.text.replaceAll('.', ''),
      'perhitungan_modal_kerja': perhitunganModalKerja.text.replaceAll('.', ''),
      'kebutuhan_investasi': kebutuhanInvestasi.text.replaceAll('.', ''),
      'kebutuhan_kredit': kebutuhanKredit.text.replaceAll('.', ''),
      'total_crr_keuangan': crr.text,
    };

    try {
      isKeuanganAnalisisProcessing(true);
      AnalisisKeuanganProvider().deployAnalisaKeuangan(body).then((resp) {
        isKeuanganAnalisisProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }, onError: (err) {
        isKeuanganAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isKeuanganAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  // void hitungFlatAndEfektif() {
  //   try {
  //     flatInitial.text =
  //         (int.parse(bungaPerTahun.text) / 1200).toStringAsFixed(5);

  //     final plusOne = (double.parse(flatInitial.text) + 1);
  //     final powPlusOneDenganAngsuranPerBulan =
  //         pow(plusOne, int.parse(angsuranPerBulan.text));

  //     efektifInitial.text =
  //         (1 / powPlusOneDenganAngsuranPerBulan).toStringAsFixed(5);

  //     final minusOne = (1 - double.parse(efektifInitial.text));
  //     final result = (double.parse(flatInitial.text) / minusOne);

  //     totalFlatEfektif.text = result.toStringAsFixed(9);
  //   } catch (e) {
  //     if (bungaPerTahun.text == '') {
  //       AwesomeDialog(
  //         dialogType: DialogType.error,
  //         dialogBackgroundColor: primaryColor,
  //         titleTextStyle: GoogleFonts.poppins(
  //           color: secondaryColor,
  //           fontSize: 30,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         descTextStyle: GoogleFonts.poppins(
  //           color: secondaryColor,
  //           fontSize: 20,
  //           fontWeight: FontWeight.w400,
  //         ),
  //         animType: AnimType.bottomSlide,
  //         title: 'Error',
  //         desc: 'Field bunga per tahun masih kosong',
  //         btnOkOnPress: () {},
  //         context: Get.context!,
  //       ).show();
  //     }

  //     if (angsuranPerBulan.text == '') {
  //       AwesomeDialog(
  //         dialogType: DialogType.error,
  //         dialogBackgroundColor: primaryColor,
  //         titleTextStyle: GoogleFonts.poppins(
  //           color: secondaryColor,
  //           fontSize: 30,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         descTextStyle: GoogleFonts.poppins(
  //           color: secondaryColor,
  //           fontSize: 20,
  //           fontWeight: FontWeight.w400,
  //         ),
  //         animType: AnimType.bottomSlide,
  //         title: 'Error',
  //         desc: 'Field Angsuran per bulan masih kosong',
  //         btnOkOnPress: () {},
  //         context: Get.context!,
  //       ).show();
  //     }
  //   }
  // }

  // void hitungTotalFlatEfektif() {
  //   final efektifBawah = (double.parse(totalFlatEfektif.text) *
  //       (int.parse(kreditYangDiminta.text.replaceAll('.', ''))));

  //   final parseKreditYangDiajukan =
  //       int.parse(kreditYangDiminta.text.replaceAll('.', ''));
  //   final parseBungaPerTahun =
  //       int.parse(bungaPerTahun.text.replaceAll('.', ''));
  //   final parseAngsuranPerBulan =
  //       int.parse(angsuranPerBulan.text.replaceAll('.', ''));

  //   if (parseKreditYangDiajukan == 0) {
  //     totalFlat.text = '0';
  //   }

  //   final firstCount = (parseKreditYangDiajukan * parseBungaPerTahun);
  //   final secondCount = (firstCount / 1200);
  //   final thirdCount = (secondCount * parseAngsuranPerBulan);
  //   final fourthCount = (thirdCount + parseKreditYangDiajukan);
  //   final fifthCount = (fourthCount / parseAngsuranPerBulan);

  //   totalFlat.text = fifthCount.toStringAsFixed(0);
  //   totalEfektif.text = efektifBawah.toStringAsFixed(0);
  // }
}
