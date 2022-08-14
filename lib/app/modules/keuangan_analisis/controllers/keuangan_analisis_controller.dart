import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../../common/style.dart';

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
  final omzetKini = TextEditingController(text: '30000000');
  final omzetYAD = TextEditingController(text: '34500000');
  final omzetKiniPercent = TextEditingController(text: '100');
  final omzetYADPercent = TextEditingController(text: '100');

  /// Biaya bahan input
  final biayaBahanKini = TextEditingController(text: '21000000');
  final biayaBahanYAD = TextEditingController(text: '24150000');
  final biayaBahanKiniPercent = TextEditingController(text: '');
  final biayaBahanYADPercent = TextEditingController(text: '');

  /// Upah input
  final upahKini = TextEditingController(text: '800000');
  final upahYAD = TextEditingController(text: '920000');
  final upahKiniPercent = TextEditingController(text: '');
  final upahYADPercent = TextEditingController(text: '');

  // Biaya operasi
  final biayaOperasiKini = TextEditingController(text: '500000');
  final biayaOperasiYAD = TextEditingController(text: '575000');
  final biayaOperasiKiniPercent = TextEditingController(text: '');
  final biayaOperasiYADPercent = TextEditingController(text: '');

  // Biaya hidup
  final biayaHidupKini = TextEditingController(text: '2500000');
  final biayaHidupYAD = TextEditingController(text: '2500000');
  final biayaHidupKiniPercent = TextEditingController(text: '');
  final biayaHidupYADPercent = TextEditingController(text: '');

  // Laba Usaha
  final labaUsahaKini = TextEditingController(text: '0');
  final labaUsahaYAD = TextEditingController(text: '0');
  final labaUsahaKiniPercent = TextEditingController(text: '');
  final labaUsahaYADPercent = TextEditingController(text: '');

  // Ini Nilai Tetap
  final roeFixed = TextEditingController(text: '10');
  final roaFixed = TextEditingController(text: '8');
  final derFixed = TextEditingController(text: '200');
  final dscFixed = TextEditingController(text: '1.3');

  // Ini Data Keuangan
  final equityInput = TextEditingController(text: '19933998');
  final debtInput = TextEditingController(text: '15459590');
  final kreditYangDiminta = TextEditingController(text: '200000000');
  final netWorth = TextEditingController();
  final netWorthPlusCredit = TextEditingController();

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
  final totalBunga = TextEditingController(text: '3866560');

  // Flat / Efektif
  final flatInitial = TextEditingController(text: '0');
  final efektifInitial = TextEditingController(text: '0');
  final totalFlatEfektif = TextEditingController(text: '0');
  final totalEfektif = TextEditingController(text: '0');
  final totalFlat = TextEditingController(text: '0');

  // Total Angsuran Keseluruhan
  final totalAngsuran = TextEditingController(text: '0');

  final roeStatus = ''.obs;
  final isRoeLoading = false.obs;
  final isRoeDescLoading = false.obs;
  final isRatioProfitLoading = false.obs;

  void hitungNetWorth() {
    netWorth.text =
        (int.parse(equityInput.text) + int.parse(debtInput.text)).toString();
  }

  void hitungNetWorthPlusCredit() {
    netWorthPlusCredit.text =
        (int.parse(netWorth.text) + int.parse(kreditYangDiminta.text))
            .toString();
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

  void hitungTotalAngsuran() {
    final parseTotalBungaLainAtas = int.parse(totalBungaLainAtas.text);
    final parseTotalBungaLainBawah = int.parse(totalBungaLainBawah.text);
    final parseTotalBunga = int.parse(totalBunga.text);

    totalAngsuran.text =
        (parseTotalBungaLainAtas + parseTotalBungaLainBawah + parseTotalBunga)
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
    biayaBahanKiniPercent.text =
        ((int.parse(biayaBahanKini.text) / int.parse(omzetKini.text)))
            .toStringAsFixed(2);
    biayaBahanYADPercent.text =
        ((int.parse(biayaBahanYAD.text) / int.parse(omzetYAD.text)))
            .toStringAsFixed(2);
    upahKiniPercent.text =
        ((int.parse(upahKini.text) / int.parse(omzetKini.text)))
            .toStringAsFixed(2);
    upahYADPercent.text = ((int.parse(upahYAD.text) / int.parse(omzetYAD.text)))
        .toStringAsFixed(2);
    biayaOperasiKiniPercent.text =
        ((int.parse(biayaOperasiKini.text) / int.parse(omzetKini.text)))
            .toStringAsFixed(2);
    biayaOperasiYADPercent.text =
        ((int.parse(biayaOperasiYAD.text) / int.parse(omzetYAD.text)))
            .toStringAsFixed(2);
    biayaHidupKiniPercent.text =
        ((int.parse(biayaHidupKini.text) / int.parse(omzetKini.text)))
            .toStringAsFixed(2);
    biayaHidupYADPercent.text =
        ((int.parse(biayaHidupYAD.text) / int.parse(omzetYAD.text)))
            .toStringAsFixed(2);
  }

  void hitungRatioProfit() {
    isRatioProfitLoading.value = true;

    // Delay 1 detik
    Future.delayed(
      const Duration(seconds: 1),
      () {
        ratioProfitKini.text =
            (int.parse(labaUsahaKini.text) / int.parse(omzetKini.text) * 100)
                .toStringAsFixed(1);

        ratioProfitYAD.text =
            (int.parse(labaUsahaYAD.text) / int.parse(omzetYAD.text) * 100)
                .toStringAsFixed(1);

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

  // void hitungRoeYad() {
  //   final parseLabaUsaha = int.parse(labaUsahaYAD.text);
  //   final parseTotalAngsuran = int.parse(totalBunga.text);
  //   final parseModal = int.parse(equityInput.text);

  //   final firstCount = parseLabaUsaha - parseTotalAngsuran;
  //   final secondCount = firstCount / parseModal * 100;
  //   final thirdCount = secondCount * 24;

  //   roeYAD.text = thirdCount.toStringAsFixed(2);
  // }

  void hitungRoe() {
    isRoeLoading.value = true;

    Future.delayed(
      const Duration(seconds: 2),
      () {
        final parseLabaUsaha = int.parse(labaUsahaKini.text);
        final parseTotalAngsuran = int.parse(totalBunga.text);
        final parseModal = int.parse(equityInput.text);

        final parseLabaUsahaYad = int.parse(labaUsahaYAD.text);

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

    // Delay for 2 seconds then set roeStatus to false
    // Future.delayed(Duration(seconds: 2), () {
    //   isRoeLoading.value = false;
    // });
  }

  void hitungFlatAndEfektif() {
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
  }

  void hitungTotalFlatEfektif() {
    final efektifBawah = (double.parse(totalFlatEfektif.text) *
        (int.parse(kreditYangDiminta.text)));

    final parseKreditYangDiajukan = int.parse(kreditYangDiminta.text);
    final parseBungaPerTahun = int.parse(bungaPerTahun.text);
    final parseAngsuranPerBulan = int.parse(angsuranPerBulan.text);

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
