// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:akm/app/data/provider/agunan/agunan_tanah_bangunan/agunan_tanah_bangunan_provider.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class ListAgunanTanahBangunanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanTanahBangunan(agunanId.id);
  }

  final agunanId = Get.arguments;

  final isAgunanTanahBangunanProcessing = false.obs;
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

  var listAgunanTanahBangunan =
      List<FormTanahBangunan>.empty(growable: true).obs;

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void getAllAgunanTanahBangunan(int id) {
    try {
      isAgunanTanahBangunanProcessing(true);
      AgunanTanahBangunanProvider().fetchAgunanTanahBangunan(id).then((resp) {
        isAgunanTanahBangunanProcessing(false);
        listAgunanTanahBangunan.addAll(resp);
      }, onError: (e) {
        isAgunanTanahBangunanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahBangunanProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void saveAgunanTanahBangunan(id) {
    final body = {
      'deskripsi_pendek': deskripsiPendek.text,
      'nama_pemilik': buktiKepemilikan.text,
      'bukti_kepemilikan': buktiKepemilikan.text,
      'luas_tanah': luasTanah.text,
      'tanggal': tanggal.toString(),
      'nilai_pasar': nilaiPasar.text.replaceAll('.', ''),
      'nilai_liquidasi': nilaiLiquidasi.text.replaceAll('.', ''),
      'nilai_pengikatan': nilaiPengikatan.text.replaceAll('.', ''),
      'pengikatan': pengikatan.text,
      'lokasi': lokasi.text,
      'titik_koordinat': titikKoordinat.text,
      'deskripsi_panjang': deskripsiPanjang.text,
    };

    try {
      isAgunanTanahBangunanProcessing(true);
      AgunanTanahBangunanProvider()
          .saveFormAgunanTanahDanBangunan(id, body)
          .then((resp) {
        isAgunanTanahBangunanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanTanahBangunan.clear();
        getAllAgunanTanahBangunan(agunanId.id);
      }, onError: (e) {
        isAgunanTanahBangunanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanTanahBangunanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void clearForm() {
    deskripsiPendek.clear();
    buktiKepemilikan.clear();
    persentase.clear();
    luasTanah.clear();
    tanggal = DateTime.now();
    lokasi.clear();
    titikKoordinat.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
    deskripsiPanjang.clear();
  }
}
