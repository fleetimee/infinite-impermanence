// 🐦 Flutter imports:
import 'package:akm/app/data/provider/agunan/agunan_tanah_bangunan/agunan_tanah_bangunan_provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class ListAgunanTanahBangunanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanTanahBangunan(agunanId.id);
  }

  var listAgunanTanahBangunan =
      List<FormTanahBangunan>.empty(growable: true).obs;

  final insightDebiturController = Get.put(InsightDebiturController());

  final isAgunanTanahBangunanProcessing = false.obs;

  final agunanId = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  final PopupController popupLayerController = PopupController();

  // Input
  var deskripsiPendek = TextEditingController();
  var namaPemilik = TextEditingController();
  var buktiKepemilikan = TextEditingController();
  var persentase = TextEditingController();
  var luasTanah = TextEditingController();
  var tanggal = DateTime.now();
  var lokasi = TextEditingController();
  var titikKoordinat = TextEditingController();

  var nilaiPasarTanah = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var persentaseTanah = TextEditingController();
  var nilaiLiquidasiTanah = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

  var nilaiPasarBangunan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var persentaseBangunan = TextEditingController();
  var nilaiLiquidasiBangunan = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );

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

  // Edit
  var deskripsiPendekEdit = TextEditingController();
  var namaPemilikEdit = TextEditingController();
  var buktiKepemilikanEdit = TextEditingController();
  var persentaseEdit = TextEditingController();
  var luasTanahEdit = TextEditingController();
  var tanggalEdit = DateTime.now();
  var lokasiEdit = TextEditingController();
  var titikKoordinatEdit = TextEditingController();
  var nilaiPasarEdit = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var nilaiLiquidasiEdit = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var nilaiPengikatanEdit = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  var pengikatanEdit = TextEditingController();
  var deskripsiPanjangEdit = TextEditingController();

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
      'nama_pemilik': namaPemilik.text,
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
        insightDebiturController.fetchOneDebitur(agunanId.debiturId);
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

  void updateAgunanTanahBangunan(int idAgunan, id) {
    final body = {
      'deskripsi_pendek': deskripsiPendekEdit.text,
      'nama_pemilik': namaPemilikEdit.text,
      'bukti_kepemilikan': buktiKepemilikanEdit.text,
      'luas_tanah': luasTanahEdit.text,
      'tanggal': tanggalEdit.toString(),
      'nilai_pasar': nilaiPasarEdit.text.replaceAll('.', ''),
      'nilai_liquidasi': nilaiLiquidasiEdit.text.replaceAll('.', ''),
      'nilai_pengikatan': nilaiPengikatanEdit.text.replaceAll('.', ''),
      'pengikatan': pengikatanEdit.text,
      'lokasi': lokasiEdit.text,
      'titik_koordinat': titikKoordinatEdit.text,
      'deskripsi_panjang': deskripsiPanjangEdit.text,
    };

    try {
      isAgunanTanahBangunanProcessing(true);
      AgunanTanahBangunanProvider()
          .putAgunanTanahBangunan(idAgunan, id, body)
          .then((resp) {
        isAgunanTanahBangunanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil diupdate',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanTanahBangunan.clear();
        getAllAgunanTanahBangunan(agunanId.id);
        insightDebiturController.fetchOneDebitur(agunanId.debiturId);
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

  void deleteAgunanTanahBangunan(int idAgunan, id) {
    try {
      isAgunanTanahBangunanProcessing(true);
      AgunanTanahBangunanProvider().purgeAgunanTanahBangunan(idAgunan, id).then(
          (resp) {
        isAgunanTanahBangunanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        listAgunanTanahBangunan.clear();
        getAllAgunanTanahBangunan(agunanId.id);
        insightDebiturController.fetchOneDebitur(agunanId.debiturId);
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

  void hitungNilaiLiquidasiEdit() {
    final parseNilaiPasar =
        double.parse(nilaiPasarEdit.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentaseEdit.text);

    final nilaiLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasiEdit.text = nilaiLiquidasi.toStringAsFixed(0);
    nilaiPengikatanEdit.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void hitungNilaiLiquidasiTanah() {
    final parseNilaiPasar =
        double.parse(nilaiPasarTanah.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentaseTanah.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasiTanah.text = hasilLiquidasi.toStringAsFixed(0);
  }

  void hitungNilaiLiquidasiBangunan() {
    final parseNilaiPasar =
        double.parse(nilaiPasarBangunan.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentaseBangunan.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasiBangunan.text = hasilLiquidasi.toStringAsFixed(0);
  }

  void hitungTotalNilaiPasar() {
    final parseNilaiPasarTanah =
        double.parse(nilaiPasarTanah.text.replaceAll('.', ''));
    final parseNilaiPasarBangunan =
        double.parse(nilaiPasarBangunan.text.replaceAll('.', ''));

    final totalNilaiPasar = parseNilaiPasarTanah + parseNilaiPasarBangunan;

    nilaiPasar.text = totalNilaiPasar.toStringAsFixed(0);
    nilaiPengikatan.text = totalNilaiPasar.toStringAsFixed(0);
  }

  void hitungTotalNilaiLiquidasi() {
    final parseNilaiLiquidasiTanah =
        double.parse(nilaiLiquidasiTanah.text.replaceAll('.', ''));
    final parseNilaiLiquidasiBangunan =
        double.parse(nilaiLiquidasiBangunan.text.replaceAll('.', ''));

    final totalNilaiLiquidasi =
        parseNilaiLiquidasiTanah + parseNilaiLiquidasiBangunan;

    nilaiLiquidasi.text = totalNilaiLiquidasi.toStringAsFixed(0);
  }

  void boom() {
    hitungNilaiLiquidasiTanah();
    hitungNilaiLiquidasiBangunan();
    hitungTotalNilaiPasar();
    hitungTotalNilaiLiquidasi();
  }

  void generateDeskripsi() {
    deskripsiPanjang.text =
        '${deskripsiPendek.text} dengan bukti kepemilikan ${buktiKepemilikan.text}, Luas Tanah ${luasTanah.text} M2, Atas Nama ${namaPemilik.text} yang berlokasi di ${lokasi.text}';
  }

  void generateDeskripsiEdit() {
    deskripsiPanjangEdit.text =
        '${deskripsiPendekEdit.text} dengan bukti kepemilikan ${buktiKepemilikanEdit.text}, Luas Tanah ${luasTanahEdit.text} M2, Atas Nama ${namaPemilikEdit.text} yang berlokasi di ${lokasiEdit.text}';
  }

  void clearForm() {
    deskripsiPendek.clear();
    namaPemilik.clear();
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

  void clearFormEdit() {
    deskripsiPendekEdit.clear();
    namaPemilikEdit.clear();
    buktiKepemilikanEdit.clear();
    persentaseEdit.clear();
    luasTanahEdit.clear();
    tanggalEdit = DateTime.now();
    lokasiEdit.clear();
    titikKoordinatEdit.clear();
    nilaiPasarEdit.clear();
    nilaiLiquidasiEdit.clear();
    nilaiPengikatanEdit.clear();
    pengikatanEdit.clear();
    deskripsiPanjangEdit.clear();
  }

  @override
  void onClose() {
    deskripsiPendek.dispose();
    namaPemilik.dispose();
    buktiKepemilikan.dispose();
    persentase.dispose();
    luasTanah.dispose();
    lokasi.dispose();
    titikKoordinat.dispose();
    pengikatan.dispose();
    deskripsiPanjang.dispose();
    deskripsiPendekEdit.dispose();
    namaPemilikEdit.dispose();
    buktiKepemilikanEdit.dispose();
    persentaseEdit.dispose();
    luasTanahEdit.dispose();
    lokasiEdit.dispose();
    titikKoordinatEdit.dispose();
    pengikatanEdit.dispose();
    deskripsiPanjangEdit.dispose();
    super.onClose();
  }
}
