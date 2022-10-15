// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_kendaraan/agunan_kendaraaan.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class ListAgunanKendaraanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanKendaraan(agunanId.id);
  }

  var listAgunanKendaraan = List<FormKendaraan>.empty(growable: true).obs;

  final isAgunanKendaraanProcessing = false.obs;

  final agunanId = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  var jenisKendaraan = '';
  var merk = TextEditingController();
  var type = TextEditingController();
  var warna = TextEditingController();
  var tahun = TextEditingController();
  var noPolisi = TextEditingController();
  var noRangka = TextEditingController();
  var noMesin = TextEditingController();
  var noBpkb = TextEditingController();
  var atasNama = TextEditingController();
  var keadaan = TextEditingController();
  var persentase = TextEditingController();
  var deskripsiPanjang = TextEditingController();
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

  var jenisKendaraanEdit = '';
  var merkEdit = TextEditingController();
  var typeEdit = TextEditingController();
  var warnaEdit = TextEditingController();
  var tahunEdit = TextEditingController();
  var noPolisiEdit = TextEditingController();
  var noRangkaEdit = TextEditingController();
  var noMesinEdit = TextEditingController();
  var noBpkbEdit = TextEditingController();
  var atasNamaEdit = TextEditingController();
  var keadaanEdit = TextEditingController();
  var persentaseEdit = TextEditingController();
  var deskripsiPanjangEdit = TextEditingController();
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

  void getAllAgunanKendaraan(int id) {
    try {
      isAgunanKendaraanProcessing(true);
      AgunanKendaraanProvider().fetchAgunanKendaraan(id).then((resp) {
        isAgunanKendaraanProcessing(false);
        listAgunanKendaraan.addAll(resp);
      }, onError: (e) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanKendaraanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void saveAgunanKendaraan(id) {
    final body = {
      'jenis': jenisKendaraan.toString(),
      'merk': merk.text,
      'type': type.text,
      'warna': warna.text,
      'tahun': tahun.text,
      'no_polisi': noPolisi.text,
      'no_rangka': noRangka.text,
      'no_mesin': noMesin.text,
      'no_bpkb': noBpkb.text,
      'nama_pemilik': atasNama.text,
      'kondisi': keadaan.text,
      'nilai_pasar': nilaiPasar.text.replaceAll('.', ''),
      'nilai_liquidasi': nilaiLiquidasi.text.replaceAll('.', ''),
      'nilai_pengikatan': nilaiPengikatan.text.replaceAll('.', ''),
      'pengikatan': pengikatan.text,
      'deskripsi_panjang': deskripsiPanjang.text,
    };

    try {
      isAgunanKendaraanProcessing(true);
      AgunanKendaraanProvider().saveFormAgunanKendaraan(id, body).then((resp) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanKendaraan.clear();
        getAllAgunanKendaraan(agunanId.id);
      }, onError: (e) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanKendaraanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void updateAgunanKendaraan(int idAgunan, id) {
    final body = {
      'jenis': jenisKendaraanEdit.toString(),
      'merk': merkEdit.text,
      'type': typeEdit.text,
      'warna': warnaEdit.text,
      'tahun': tahunEdit.text,
      'no_polisi': noPolisiEdit.text,
      'no_rangka': noRangkaEdit.text,
      'no_mesin': noMesinEdit.text,
      'no_bpkb': noBpkbEdit.text,
      'nama_pemilik': atasNamaEdit.text,
      'kondisi': keadaanEdit.text,
      'nilai_pasar': nilaiPasarEdit.text.replaceAll('.', ''),
      'nilai_liquidasi': nilaiLiquidasiEdit.text.replaceAll('.', ''),
      'nilai_pengikatan': nilaiPengikatanEdit.text.replaceAll('.', ''),
      'pengikatan': pengikatanEdit.text,
      'deskripsi_panjang': deskripsiPanjangEdit.text,
    };

    try {
      isAgunanKendaraanProcessing(true);
      AgunanKendaraanProvider().putAgunanKendaran(idAgunan, id, body).then(
          (resp) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil diupdate',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearFormEdit();
        listAgunanKendaraan.clear();
        getAllAgunanKendaraan(agunanId.id);
      }, onError: (e) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanKendaraanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteAgunanKendaraan(int idAgunan, id) {
    try {
      isAgunanKendaraanProcessing(true);
      AgunanKendaraanProvider().purgeAgunanKendaran(idAgunan, id).then((resp) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        listAgunanKendaraan.clear();
        getAllAgunanKendaraan(agunanId.id);
      }, onError: (e) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanKendaraanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
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

  void generateDescription() {
    deskripsiPanjang.text =
        '${jenisKendaraan == 'Spd Motor' ? 'Kendaran Roda 2 Dua' : 'Kendaraan Roda 4 (Empat)'} Merk ${merk.text} Tipe ${type.text} Tahun ${tahun.text}, Sesuai yang tercantum dengan BPKB asli ${noBpkb.text}, No. Polisi ${noPolisi.text}, No. Rangka ${noRangka.text}, No. Mesin ${noMesin.text}, Warna ${warna.text}, dengan kondisi ${keadaan.text}';
  }

  void generateDescriptionEdit() {
    deskripsiPanjangEdit.text =
        '${jenisKendaraanEdit == 'Spd Motor' ? 'Kendaran Roda 2 Dua' : 'Kendaraan Roda 4 (Empat)'} Merk ${merkEdit.text} Tipe ${typeEdit.text} Tahun ${tahunEdit.text}, Sesuai yang tercantum dengan BPKB asli ${noBpkbEdit.text}, No. Polisi ${noPolisiEdit.text}, No. Rangka ${noRangkaEdit.text}, No. Mesin ${noMesinEdit.text}, Warna ${warnaEdit.text}, dengan kondisi ${keadaanEdit.text}';
  }

  void clearForm() {
    merk.clear();
    type.clear();
    warna.clear();
    tahun.clear();
    noPolisi.clear();
    noMesin.clear();
    noBpkb.clear();
    noRangka.clear();
    atasNama.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
    deskripsiPanjang.clear();
    jenisKendaraan = '';
  }

  void clearFormEdit() {
    merkEdit.clear();
    typeEdit.clear();
    warnaEdit.clear();
    tahunEdit.clear();
    noPolisiEdit.clear();
    noMesinEdit.clear();
    noBpkbEdit.clear();
    noRangkaEdit.clear();
    atasNamaEdit.clear();
    nilaiPasarEdit.clear();
    nilaiLiquidasiEdit.clear();
    nilaiPengikatanEdit.clear();
    pengikatanEdit.clear();
    deskripsiPanjangEdit.clear();
    jenisKendaraanEdit = '';
  }

  final jenisKendaraanList = [
    'Spd Motor',
    'Mobil Penumpang',
    'Mobil Bus',
    'Mobil Barang',
    'Kendaraan Khusus'
  ];
}
