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
    // Initiate onInit
    getAllAgunanCash(agunanId.id);
  }

  // List untuk menampung data agunan cash
  var listAgunanCash = List<FormCommon>.empty(growable: true).obs;

  // Variabel biar bisa refresh
  final isAgunanCashProcessing = false.obs;

  // Get agunan id from previous page
  final agunanId = Get.arguments;

  // GlobalFormKey
  final formKey = GlobalKey<FormBuilderState>();

  // Variabel TextEditingInput
  var deskripsiPanjang = TextEditingController();
  var persentase = TextEditingController();
  var nilaiPasar = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasi = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatan = TextEditingController();

  // Variabel TextEditingEdit
  var deskripsiPanjangEdit = TextEditingController();
  var persentaseEdit = TextEditingController();
  var nilaiPasarEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasiEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatanEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatanEdit = TextEditingController();

  // Fetch all agunan cash
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

  // Post a agunan cash
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

  // Update a agunan cash
  void updateAgunanCash(int idAgunan, id) {
    final body = {
      "deskripsi_panjang": deskripsiPanjangEdit.text,
      "nilai_pasar": nilaiPasarEdit.text.replaceAll('.', ''),
      "nilai_liquidasi": nilaiLiquidasiEdit.text.replaceAll('.', ''),
      "nilai_pengikatan": nilaiPengikatanEdit.text.replaceAll('.', ''),
      "pengikatan": pengikatanEdit.text,
    };

    try {
      isAgunanCashProcessing(true);
      AgunanCashProvider().putAgunanCash(idAgunan, id, body).then((resp) {
        isAgunanCashProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil diupdate',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearFormEdit();
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

  // Delete a agunan cash
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

  // Hitung nilai liquidasi
  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);
    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);
    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  // Hitung nilai liquidasi edit
  void hitungNilaiLiquidasiEdit() {
    final parseNilaiPasar =
        double.parse(nilaiPasarEdit.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentaseEdit.text);
    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);
    nilaiLiquidasiEdit.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatanEdit.text = parseNilaiPasar.toStringAsFixed(0);
  }

  // Clear form input
  void clearForm() {
    deskripsiPanjang.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
  }

  // Clear form edit
  void clearFormEdit() {
    deskripsiPanjangEdit.clear();
    nilaiPasarEdit.clear();
    nilaiLiquidasiEdit.clear();
    nilaiPengikatanEdit.clear();
    pengikatanEdit.clear();
  }
}
