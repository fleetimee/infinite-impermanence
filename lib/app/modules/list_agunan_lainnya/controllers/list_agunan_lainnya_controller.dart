// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_lainnya/agunan_lainnya.provider.dart';
import '../../../models/debitur_model/insight_debitur.model.dart';

class ListAgunanLainnyaController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanLainnya(agunanId[0].id);
  }

  var deskripsiPanjang = TextEditingController();
  var plafonKredit = TextEditingController();
  var namaPerusahaan = TextEditingController();
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
  // final plafon = Get.arguments[1];

  final isAgunanLainnyaProcessing = false.obs;

  var listAgunanLainnya = List<FormCommon>.empty(growable: true).obs;

  void hitungSeventyPercent() {
    final parsePlafon = int.parse(plafonKredit.text.replaceAll('.', ''));

    final hasil = parsePlafon * 0.7;

    nilaiPasar.text = hasil.toStringAsFixed(0);
  }

  void getAllAgunanLainnya(int id) {
    try {
      isAgunanLainnyaProcessing(true);
      AgunanLainnyaProvider().fetchAgunanLainnya(id).then((resp) {
        isAgunanLainnyaProcessing(false);
        listAgunanLainnya.addAll(resp);
      }, onError: (e) {
        isAgunanLainnyaProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanLainnyaProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void saveAgunanLainnya(id) {
    final body = {
      "deskripsi_panjang": deskripsiPanjang.text,
      'nama_asuransi_penjamin': namaPerusahaan.text,
      "nilai_pasar": nilaiPasar.text.replaceAll('.', ''),
      "nilai_liquidasi": 0,
      "nilai_pengikatan": 0,
      "pengikatan": '.',
    };

    try {
      isAgunanLainnyaProcessing(true);
      AgunanLainnyaProvider().saveFormAgunanLainnya(id, body).then((resp) {
        isAgunanLainnyaProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanLainnya.clear();
        getAllAgunanLainnya(agunanId[0].id);
      }, onError: (e) {
        isAgunanLainnyaProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLainnyaProcessing(false);
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
