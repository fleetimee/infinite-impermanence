// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/agunan/agunan_analisa/agunan_analisa.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_cash/agunan_cash.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_kendaraan/agunan_kendaraaan.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_lainnya/agunan_lainnya.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_los/agunan_los.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_peralatan/agunan_peralatan.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_tanah/agunan_tanah.provider.dart';
import 'package:akm/app/data/provider/agunan/agunan_tanah_bangunan/agunan_tanah_bangunan_provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';

class AgunanAnalisisCalcController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanTanahAnalisis(data[0].id ?? 0);

    if (data[0].id != null || data[0].id != 0) {
      getAllAgunanTanahBangunanAnalisis(data[1].id ?? 0);
    }

    if (data[1].id != null || data[1].id != 0) {
      getAllAgunanKendaraanAnalisis(data[2].id ?? 0);
    }

    Future.delayed(const Duration(seconds: 3), () {
      if (data[2].id != null || data[2].id != 0) {
        getAllAgunanPeralatanAnalisis(data[3].id ?? 0);
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (data[3].id != null || data[3].id != 0) {
        getAllAgunanCashAnalisis(data[4].id ?? 0);
      }
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (data[4].id != null || data[4].id != 0) {
        getAllAgunanLosAnalisis(data[5].id ?? 0);
      }
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (data[5].id != null || data[5].id != 0) {
        getAllAgunanLainnyaAnalisis(data[6].id ?? 0);
      }
    });

    // Check if future done

    // Future.delayed(const Duration(seconds: 1), () {
    //   getAllAgunanTanahBangunanAnalisis(data[1].id ?? 0);
    // });
    // Future.delayed(const Duration(seconds: 2), () {
    //   getAllAgunanKendaraanAnalisis(data[2].id ?? 0);
    // });
    // Future.delayed(const Duration(seconds: 3), () {
    //   getAllAgunanLosAnalisis(data[3].id ?? 0);
    // });
    // Future.delayed(const Duration(seconds: 4), () {
    //   getAllAgunanPeralatanAnalisis(data[4].id ?? 0);
    // });
    // Future.delayed(const Duration(seconds: 5), () {
    //   getAllAgunanCashAnalisis(data[5].id ?? 0);
    // });
    // Future.delayed(const Duration(seconds: 6), () {
    //   getAllAgunanLainnyaAnalisis(data[6].id ?? 0);
    // });
  }

  void patchProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) +
          0.1,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().patchProgressBar(body, id).then((resp) {
        debiturController.isDataLoading(false);
        debiturController.fetchOneDebitur(id);
      }, onError: (err) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void purgeProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) -
          0.1,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().patchProgressBar(body, id).then((resp) {
        debiturController.isDataLoading(false);
        debiturController.fetchOneDebitur(id);
      }, onError: (err) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  final data = Get.arguments;
  final agunanAnalisis = Get.put(AgunanAnalisisController());
  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  var kreditYangDiajukan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: ',', precision: 0);
  var totalAgunanTanah = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanTanahBangunan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanKendaraan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanPeralatan = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanCash = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanLos = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var totalAgunanLainnya = MoneyMaskedTextController(
      thousandSeparator: '.', decimalSeparator: '', precision: 0);
  var grandTotal = MoneyMaskedTextController(
      thousandSeparator: '.',
      decimalSeparator: '',
      precision: 0,
      initialValue: 0);
  var ratioAgunan = TextEditingController(text: '0');
  var crrAgunan = TextEditingController(text: '0');

  void saveAnalisaAgunan(id) {
    final body = {
      "total_agunan": grandTotal.text.replaceAll('.', ''),
      "total_crr_agunan": crrAgunan.text,
      "ratio_agunan": ratioAgunan.text,
    };

    try {
      agunanAnalisis.isAnalisaAgunanProcessing(true);
      AnalisaAgunanProvider().deployAnalisaAgunan(id, body).then((resp) {
        agunanAnalisis.isAnalisaAgunanProcessing(false);
        debiturController.fetchOneDebitur(data[7].id);
        Future.delayed(const Duration(seconds: 1), () {
          patchProgressBar(data[7].id);
        });
        clearForm();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
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
          title: 'Selamat 🎉',
          bodyHeaderDistance: 25,
          desc: 'Sudah menyelesaikan modul Agunan',
          btnOkOnPress: () {},
        ).show();
      }, onError: (e) {
        agunanAnalisis.isAnalisaAgunanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      agunanAnalisis.isAnalisaAgunanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  var listAgunanTanahAnalisis = List<FormTanah>.empty(growable: true).obs;
  final isAgunanTanahAnalisisProcessing = false.obs;
  void getAllAgunanTanahAnalisis(int id) {
    try {
      isAgunanTanahAnalisisProcessing(true);
      AgunanTanahProvider().fetchAgunanTanah(id).then((resp) {
        isAgunanTanahAnalisisProcessing(false);
        listAgunanTanahAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanTanahAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanTanahBangunanAnalisis =
      List<FormTanahBangunan>.empty(growable: true).obs;
  final isAgunanTanahBangunanAnalisisProcessing = false.obs;
  void getAllAgunanTanahBangunanAnalisis(int id) {
    try {
      isAgunanTanahBangunanAnalisisProcessing(true);
      AgunanTanahBangunanProvider().fetchAgunanTanahBangunan(id).then((resp) {
        isAgunanTanahBangunanAnalisisProcessing(false);
        listAgunanTanahBangunanAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanTanahBangunanAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahBangunanAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanKendaraanAnalisis =
      List<FormKendaraan>.empty(growable: true).obs;
  final isAgunanKendaraanAnalisisProcessing = false.obs;
  void getAllAgunanKendaraanAnalisis(int id) {
    try {
      isAgunanKendaraanAnalisisProcessing(true);
      AgunanKendaraanProvider().fetchAgunanKendaraan(id).then((resp) {
        isAgunanKendaraanAnalisisProcessing(false);
        listAgunanKendaraanAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanKendaraanAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanKendaraanAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanPeralatanAnalisis = List<FormCommon>.empty(growable: true).obs;
  final isAgunanPeralatanAnalisisProcessing = false.obs;
  void getAllAgunanPeralatanAnalisis(int id) {
    try {
      isAgunanPeralatanAnalisisProcessing(true);
      AgunanPeralatanProvider().fetchAgunanPeralatan(id).then((resp) {
        isAgunanPeralatanAnalisisProcessing(false);
        listAgunanPeralatanAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanPeralatanAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanPeralatanAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanCashAnalisis = List<FormCommon>.empty(growable: true).obs;
  final isAgunanCashAnalisisProcessing = false.obs;
  void getAllAgunanCashAnalisis(int id) {
    try {
      isAgunanCashAnalisisProcessing(true);
      AgunanCashProvider().fetchAgunanCash(id).then((resp) {
        isAgunanCashAnalisisProcessing(false);
        listAgunanCashAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanCashAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanCashAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanLosAnalisis = List<FormLo>.empty(growable: true).obs;
  final isAgunanLosAnalisisProcessing = false.obs;
  void getAllAgunanLosAnalisis(int id) {
    try {
      isAgunanLosAnalisisProcessing(true);
      AgunanLosProvider().fetchAgunanLos(id).then((resp) {
        isAgunanLosAnalisisProcessing(false);
        listAgunanLosAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanLosAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLosAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  var listAgunanLainnyaAnalisis = List<FormCommon>.empty(growable: true).obs;
  final isAgunanLainnyaAnalisisProcessing = false.obs;
  void getAllAgunanLainnyaAnalisis(int id) {
    try {
      isAgunanLainnyaAnalisisProcessing(true);
      AgunanLainnyaProvider().fetchAgunanLainnya(id).then((resp) {
        isAgunanLainnyaAnalisisProcessing(false);
        listAgunanLainnyaAnalisis.addAll(resp);
      }, onError: (e) {
        isAgunanLainnyaAnalisisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLainnyaAnalisisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void hitungGrandTotal() {
    final parseAgunanTanah =
        double.parse(totalAgunanTanah.text.replaceAll('.', ''));
    final parseAgunanTanahBangunan =
        double.parse(totalAgunanTanahBangunan.text.replaceAll('.', ''));
    final parseAgunanKendaraan =
        double.parse(totalAgunanKendaraan.text.replaceAll('.', ''));
    final parseAgunanPeralatan =
        double.parse(totalAgunanPeralatan.text.replaceAll('.', ''));
    final parseAgunanCash =
        double.parse(totalAgunanCash.text.replaceAll('.', ''));
    final parseAgunanLos =
        double.parse(totalAgunanLos.text.replaceAll('.', ''));
    final parseAgunanLainnya =
        double.parse(totalAgunanLainnya.text.replaceAll('.', ''));

    final result = parseAgunanTanah +
        parseAgunanTanahBangunan +
        parseAgunanKendaraan +
        parseAgunanPeralatan +
        parseAgunanCash +
        parseAgunanLos +
        parseAgunanLainnya;

    grandTotal.text = result.toStringAsFixed(0);
  }

  void hitungRatioDanCrr() {
    // Parse kredit yang diusulkan
    final parseKredit =
        double.parse(kreditYangDiajukan.text.replaceAll('.', ''));

    // Parse grand total
    final parseGrandTotal = double.parse(grandTotal.text.replaceAll('.', ''));

    // Ratio
    final ratio = parseGrandTotal / (parseKredit / 100);

    // Result ratio
    ratioAgunan.text = ratio.toStringAsFixed(1);

    // Get CRR From ratio
    if (ratio < 0) {
      crrAgunan.text = '0';
    } else if (ratio > 150) {
      crrAgunan.text = '95.0';
    } else {
      final a = ratio - 30;
      const b = 150 - 30;
      const c = 95 - 65;

      final d = a / b;
      final e = d * c;

      final result = e + 65;

      crrAgunan.text = result.toStringAsFixed(1);
    }
  }

  void clearForm() {
    crrAgunan.clear();
    grandTotal.clear();
    ratioAgunan.clear();
    kreditYangDiajukan.clear();
  }
}
