// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_peralatan/agunan_peralatan.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class ListAgunanPeralatanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanPeralatan(agunanId.id);
  }

  var listAgunanPeralatan = List<FormCommon>.empty(growable: true).obs;

  final isAgunanPeralatanProcessing = false.obs;

  final agunanId = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  var deskripsiPanjang = TextEditingController();
  var persentase = TextEditingController();
  var nilaiPasar = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasi = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatan = TextEditingController();

  var deskripsiPanjangEdit = TextEditingController();
  var persentaseEdit = TextEditingController();
  var nilaiPasarEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasiEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatanEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatanEdit = TextEditingController();

  void getAllAgunanPeralatan(int id) {
    try {
      isAgunanPeralatanProcessing(true);
      AgunanPeralatanProvider().fetchAgunanPeralatan(id).then((resp) {
        isAgunanPeralatanProcessing(false);
        listAgunanPeralatan.addAll(resp);
      }, onError: (e) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanPeralatanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void saveAgunanPeralatan(id) {
    final body = {
      "deskripsi_panjang": deskripsiPanjang.text,
      "nilai_pasar": nilaiPasar.text.replaceAll('.', ''),
      "nilai_liquidasi": nilaiLiquidasi.text.replaceAll('.', ''),
      "nilai_pengikatan": nilaiPengikatan.text.replaceAll('.', ''),
      "pengikatan": pengikatan.text,
    };

    try {
      isAgunanPeralatanProcessing(true);
      AgunanPeralatanProvider().saveFormAgunanPeralatan(id, body).then((resp) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanPeralatan.clear();
        getAllAgunanPeralatan(agunanId.id);
      }, onError: (e) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanPeralatanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void updateAgunanPeralatan(int idAgunan, id) {
    final body = {
      "deskripsi_panjang": deskripsiPanjangEdit.text,
      "nilai_pasar": nilaiPasarEdit.text.replaceAll('.', ''),
      "nilai_liquidasi": nilaiLiquidasiEdit.text.replaceAll('.', ''),
      "nilai_pengikatan": nilaiPengikatanEdit.text.replaceAll('.', ''),
      "pengikatan": pengikatanEdit.text,
    };

    try {
      isAgunanPeralatanProcessing(true);
      AgunanPeralatanProvider().putAgunanPeralatan(idAgunan, id, body).then(
          (resp) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil diupdate',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearFormEdit();
        listAgunanPeralatan.clear();
        getAllAgunanPeralatan(agunanId.id);
      }, onError: (e) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanPeralatanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteAgunanPeralatan(int agunanId, id) {
    try {
      isAgunanPeralatanProcessing(true);
      AgunanPeralatanProvider().deleteAgunanPeralatan(agunanId, id).then(
          (resp) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        listAgunanPeralatan.clear();
        getAllAgunanPeralatan(agunanId);
      }, onError: (e) {
        isAgunanPeralatanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanPeralatanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void clearForm() {
    deskripsiPanjang.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
  }

  void clearFormEdit() {
    deskripsiPanjangEdit.clear();
    nilaiPasarEdit.clear();
    nilaiLiquidasiEdit.clear();
    nilaiPengikatanEdit.clear();
    pengikatanEdit.clear();
  }

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void hitungNilaiLiquidasiEdit() {
    final parseNilaiPasar =
        double.parse(nilaiPasarEdit.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentaseEdit.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasiEdit.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatanEdit.text = parseNilaiPasar.toStringAsFixed(0);
  }

  @override
  void onClose() {
    deskripsiPanjang.dispose();
    persentase.dispose();
    pengikatan.dispose();
    deskripsiPanjangEdit.dispose();
    persentaseEdit.dispose();
    pengikatanEdit.dispose();
    super.onClose();
  }
}
