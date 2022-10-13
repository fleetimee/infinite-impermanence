// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_cash/agunan_cash.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class ListAgunanCashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanCash(agunanId.id);
  }

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void clearForm() {
    deskripsiPanjang.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
  }

  var deskripsiPanjang = TextEditingController();
  var persentase = TextEditingController();
  var nilaiPasar = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasi = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatan = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  final agunanId = Get.arguments;

  final isAgunanCashProcessing = false.obs;

  var listAgunanCash = List<FormCommon>.empty(growable: true).obs;

  void getAllAgunanCash(int id) {
    try {
      isAgunanCashProcessing(true);
      AgunanCashProvider().fetchAgunanCash(id).then((resp) {
        isAgunanCashProcessing(false);
        listAgunanCash.addAll(resp);
      }, onError: (e) {
        isAgunanCashProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanCashProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void saveAgunanCash(id) {
    final body = {
      "deskripsi_panjang": deskripsiPanjang.text,
      "nilai_pasar": nilaiPasar.text.replaceAll('.', ''),
      "nilai_liquidasi": nilaiLiquidasi.text.replaceAll('.', ''),
      "nilai_pengikatan": nilaiPengikatan.text.replaceAll('.', ''),
      "pengikatan": pengikatan.text,
    };

    try {
      isAgunanCashProcessing(true);
      AgunanCashProvider().saveFormAgunanCash(id, body).then((resp) {
        isAgunanCashProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanCash.clear();
        getAllAgunanCash(agunanId.id);
      }, onError: (e) {
        isAgunanCashProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanCashProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteAgunanCash(int agunanId, id) {
    try {
      isAgunanCashProcessing(true);
      AgunanCashProvider().purgeAgunanCash(agunanId, id).then((resp) {
        isAgunanCashProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        listAgunanCash.clear();
        getAllAgunanCash(agunanId);
      }, onError: (e) {
        isAgunanCashProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanCashProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
