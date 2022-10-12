import 'package:akm/app/data/provider/agunan/agunan_peralatan/agunan_peralatan.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ListAgunanPeralatanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanPeralatan(agunanId.id);
  }

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
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

  final isAgunanPeralatanProcessing = false.obs;

  var listAgunanPeralatan = List<FormCommon>.empty(growable: true).obs;

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

  void clearForm() {
    deskripsiPanjang.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
  }
}
