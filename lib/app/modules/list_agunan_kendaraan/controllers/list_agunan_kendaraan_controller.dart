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
  final formKey = GlobalKey<FormBuilderState>();

  final agunanId = Get.arguments;

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

  @override
  void onInit() {
    super.onInit();
    getAllAgunanKendaraan(agunanId.id);
  }

  final isAgunanKendaraanProcessing = false.obs;

  var listAgunanKendaraan = List<FormKendaraan>.empty(growable: true).obs;

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

  void generateDescription() {
    deskripsiPanjang.text =
        '${jenisKendaraan == 'Spd Motor' ? 'Kendaran Roda 2 Dua' : 'Kendaraan Roda 4 (Empat)'} Merk ${merk.text} Tipe ${type.text} Tahun ${tahun.text}, Sesuai yang tercantum dengan BPKB asli ${noBpkb.text}, No. Polisi ${noPolisi.text}, No. Rangka ${noRangka.text}, No. Mesin ${noMesin.text}, Warna ${warna.text}, dengan kondisi ${keadaan.text}';
  }

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

  final jenisKendaraanList = [
    'Spd Motor',
    'Mobil Penumpang',
    'Mobil Bus',
    'Mobil Barang',
    'Kendaraan Khusus'
  ];
}
