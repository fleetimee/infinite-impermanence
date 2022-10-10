// ignore_for_file: unnecessary_overrides

import 'package:akm/app/data/provider/agunan/agunan_tanah/agunan_tanah.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ListAgunanTanahController extends GetxController {
  final agunanId = Get.arguments;

  final isAgunanTanahProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAgunanTanah(agunanId.id);
  }

  final formKey = GlobalKey<FormBuilderState>();

  var deskripsiPendek = TextEditingController();
  var buktiKepemilikan = TextEditingController();
  var persentase = TextEditingController();
  var luasTanah = TextEditingController();
  var tanggal = DateTime.now();
  var lokasi = TextEditingController();
  var titikKoordinat = TextEditingController();
  var nilaiPasar = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var nilaiLiquidasi = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var nilaiPengikatan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var pengikatan = TextEditingController();
  var deskripsiPanjang = TextEditingController();

  var listAgunanTanah = List<FormTanah>.empty(growable: true).obs;

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void getAllAgunanTanah(int id) {
    try {
      isAgunanTanahProcessing(true);
      AgunanTanahProvider().fetchAgunanTanah(id).then((resp) {
        isAgunanTanahProcessing(false);
        listAgunanTanah.addAll(resp);
      }, onError: (e) {
        isAgunanTanahProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
