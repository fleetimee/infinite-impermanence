import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

class KeuanganAnalisisController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  // Tab Controller
  TabController? tabController;

  final toggleKey = GlobalKey<ExpandableFabState>();

  final isExpandedAsumsiKeuangan = false.obs;

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
  final omzetKini = TextEditingController(text: '46250000');
  final omzetYAD = TextEditingController(text: '50875000');
  final omzetKiniPercent = TextEditingController(text: '');
  final omzetYADPercent = TextEditingController(text: '');

  /// Biaya bahan input
  final biayaBahanKini = TextEditingController(text: '37000000');
  final biayaBahanYAD = TextEditingController(text: '40700000');
  final biayaBahanKiniPercent = TextEditingController(text: '');
  final biayaBahanYADPercent = TextEditingController(text: '');

  /// Upah input
  final upahKini = TextEditingController(text: '1300000');
  final upahYAD = TextEditingController(text: '1430000');
  final upahKiniPercent = TextEditingController(text: '');
  final upahYADPercent = TextEditingController(text: '');

  // Biaya operasi
  final biayaOperasiKini = TextEditingController(text: '1000000');
  final biayaOperasiYAD = TextEditingController(text: '1100000');
  final biayaOperasiKiniPercent = TextEditingController(text: '');
  final biayaOperasiYADPercent = TextEditingController(text: '');

  // Biaya hidup
  final biayaHidupKini = TextEditingController(text: '1500000');
  final biayaHidupYAD = TextEditingController(text: '1650000');
  final biayaHidupKiniPercent = TextEditingController(text: '');
  final biayaHidupYADPercent = TextEditingController(text: '');

  // Laba Usaha
  final labaUsahaKini = TextEditingController(text: '0');
  final labaUsahaYAD = TextEditingController(text: '0');
  final labaUsahaKiniPercent = TextEditingController(text: '');
  final labaUsahaYADPercent = TextEditingController(text: '');

  // Ini Nilai Tetap
  final roeFixed = TextEditingController(text: '4.25');
  final roaFixed = TextEditingController(text: '4.25');
  final derFixed = TextEditingController(text: '200');
  final dscFixed = TextEditingController(text: '1.3');

  // Ini yang atas
  final equityInput = TextEditingController(text: '114500000');
  final debtInput = TextEditingController(text: '10500000');
  final kreditYangDiminta = TextEditingController(text: '1000000');
  final netWorth = TextEditingController();

  void hitungNetWorth() {
    netWorth.text =
        (int.parse(equityInput.text) + int.parse(debtInput.text)).toString();
  }

  void hitungTotalLaba() {
    labaUsahaKini.text = (int.parse(omzetKini.text) -
            int.parse(biayaBahanKini.text) -
            int.parse(upahKini.text) -
            int.parse(biayaOperasiKini.text) -
            int.parse(biayaHidupKini.text))
        .toString();
    labaUsahaYAD.text = (int.parse(omzetYAD.text) -
            int.parse(biayaBahanYAD.text) -
            int.parse(upahYAD.text) -
            int.parse(biayaOperasiYAD.text) -
            int.parse(biayaHidupYAD.text))
        .toString();
  }

  void hitungTotalPersentasi() {
    labaUsahaKiniPercent.text =
        ((int.parse(labaUsahaKini.text) / int.parse(omzetKini.text)) * 100)
            .toStringAsFixed(1);

    labaUsahaYADPercent.text =
        ((int.parse(labaUsahaYAD.text) / int.parse(omzetYAD.text)) * 100)
            .toStringAsFixed(1);
  }

  void hitungPersentasiOtomatis() {
    omzetKiniPercent.text =
        ((int.parse(omzetKini.text) / int.parse(omzetYAD.text)) * 100)
            .toStringAsFixed(1);
    omzetYADPercent.text =
        ((int.parse(omzetYAD.text) / int.parse(omzetKini.text)) * 100)
            .toStringAsFixed(1);
    biayaBahanKiniPercent.text =
        ((int.parse(biayaBahanKini.text) / int.parse(omzetKini.text)) * 100)
            .toStringAsFixed(1);
    biayaBahanYADPercent.text =
        ((int.parse(biayaBahanYAD.text) / int.parse(omzetYAD.text)) * 100)
            .toStringAsFixed(1);
    upahKiniPercent.text =
        ((int.parse(upahKini.text) / int.parse(omzetKini.text)) * 100)
            .toStringAsFixed(1);
    upahYADPercent.text =
        ((int.parse(upahYAD.text) / int.parse(omzetYAD.text)) * 100)
            .toStringAsFixed(1);
    biayaOperasiKiniPercent.text =
        ((int.parse(biayaOperasiKini.text) / int.parse(omzetKini.text)) * 100)
            .toStringAsFixed(1);
    biayaOperasiYADPercent.text =
        ((int.parse(biayaOperasiYAD.text) / int.parse(omzetYAD.text)) * 100)
            .toStringAsFixed(1);
    biayaHidupKiniPercent.text =
        ((int.parse(biayaHidupKini.text) / int.parse(omzetKini.text)) * 100)
            .toStringAsFixed(1);
    biayaHidupYADPercent.text =
        ((int.parse(biayaHidupYAD.text) / int.parse(omzetYAD.text)) * 100)
            .toStringAsFixed(1);
  }

  void hitungRatioProfit() {
    ratioProfitKini.text =
        (int.parse(labaUsahaKini.text) / int.parse(omzetKini.text) * 100)
            .toStringAsFixed(1);

    ratioProfitYAD.text =
        (int.parse(labaUsahaYAD.text) / int.parse(omzetYAD.text) * 100)
            .toStringAsFixed(1);

    print('clicked');
  }
}
