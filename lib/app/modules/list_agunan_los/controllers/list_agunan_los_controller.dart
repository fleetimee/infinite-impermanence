// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_los/agunan_los.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:intl/intl.dart';

class ListAgunanLosController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanLos(agunanId.id);
  }

  var listAgunanLos = List<FormLo>.empty(growable: true).obs;

  final isAgunanLosProcessing = false.obs;

  final agunanId = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  final PopupController popupLayerController = PopupController();

  var deskripsiPendek = TextEditingController();
  var komponen = TextEditingController();
  var namaPemilik = TextEditingController();
  var tempatLahir = TextEditingController();
  var tanggalLahir = DateTime.now();
  var alamat = TextEditingController();
  var tempatDasaran = TextEditingController();
  var noRegistrasi = TextEditingController();
  var luasLos = TextEditingController();
  var jenisDagangan = TextEditingController();
  var persentase = TextEditingController();
  var lokasiPasar = TextEditingController();
  var titikKoordinat = TextEditingController();
  var waktuBuka = DateTime.now();
  var waktuTutup = DateTime.now();
  var berlakuSampai = DateTime.now();
  var nilaiPasar = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasi = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatan = TextEditingController();
  var deskripsiPanjang = TextEditingController();

  var deskripsiPendekEdit = TextEditingController();
  var komponenEdit = TextEditingController();
  var namaPemilikEdit = TextEditingController();
  var tempatLahirEdit = TextEditingController();
  var tanggalLahirEdit = DateTime.now();
  var alamatEdit = TextEditingController();
  var tempatDasaranEdit = TextEditingController();
  var noRegistrasiEdit = TextEditingController();
  var luasLosEdit = TextEditingController();
  var jenisDaganganEdit = TextEditingController();
  var persentaseEdit = TextEditingController();
  var lokasiPasarEdit = TextEditingController();
  var titikKoordinatEdit = TextEditingController();
  var waktuBukaEdit = DateTime.now();
  var waktuTutupEdit = DateTime.now();
  var berlakuSampaiEdit = DateTime.now();
  var nilaiPasarEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasiEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatanEdit = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatanEdit = TextEditingController();
  var deskripsiPanjangEdit = TextEditingController();

  void getAllAgunanLos(int id) {
    try {
      isAgunanLosProcessing(true);
      AgunanLosProvider().fetchAgunanLos(id).then((resp) {
        isAgunanLosProcessing(false);
        listAgunanLos.addAll(resp);
      }, onError: (e) {
        isAgunanLosProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanLosProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void saveAgunanLos(id) {
    final body = {
      'deskripsi_pendek': deskripsiPendek.text,
      'komponen': komponen.text,
      'nama_pemilik': namaPemilik.text,
      'alamat_pemilik': alamat.text,
      'tempat_lahir': tempatLahir.text,
      'tanggal_lahir': tanggalLahir.toString(),
      'alamat': alamat.text,
      'tempat_dasaran': tempatDasaran.text,
      'no_registrasi': noRegistrasi.text,
      'luas_los': luasLos.text,
      'jenis_dagangan': jenisDagangan.text,
      'lokasi_pasar': lokasiPasar.text,
      'titik_koordinat': titikKoordinat.text,
      'waktu_buka': waktuBuka.toString(),
      'waktu_tutup': waktuTutup.toString(),
      'berlaku_sampai': berlakuSampai.toString(),
      'nilai_pasar': nilaiPasar.text.replaceAll('.', ''),
      'nilai_liquidasi': nilaiLiquidasi.text.replaceAll('.', ''),
      'nilai_pengikatan': nilaiPengikatan.text.replaceAll('.', ''),
      'pengikatan': pengikatan.text,
      'deskripsi_panjang': deskripsiPanjang.text,
    };

    try {
      isAgunanLosProcessing(true);
      AgunanLosProvider().saveFormAgunanLos(id, body).then((resp) {
        isAgunanLosProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearForm();
        listAgunanLos.clear();
        getAllAgunanLos(agunanId.id);
      }, onError: (e) {
        isAgunanLosProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLosProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void updateAgunanLos(int idAgunan, id) {
    final body = {
      'deskripsi_pendek': deskripsiPendekEdit.text,
      'komponen': komponenEdit.text,
      'nama_pemilik': namaPemilikEdit.text,
      'alamat_pemilik': alamatEdit.text,
      'tempat_lahir': tempatLahirEdit.text,
      'tanggal_lahir': tanggalLahirEdit.toString(),
      'alamat': alamatEdit.text,
      'tempat_dasaran': tempatDasaranEdit.text,
      'no_registrasi': noRegistrasiEdit.text,
      'luas_los': luasLosEdit.text,
      'jenis_dagangan': jenisDaganganEdit.text,
      'lokasi_pasar': lokasiPasarEdit.text,
      'titik_koordinat': titikKoordinatEdit.text,
      'waktu_buka': waktuBukaEdit.toString(),
      'waktu_tutup': waktuTutupEdit.toString(),
      'berlaku_sampai': berlakuSampaiEdit.toString(),
      'nilai_pasar': nilaiPasarEdit.text.replaceAll('.', ''),
      'nilai_liquidasi': nilaiLiquidasiEdit.text.replaceAll('.', ''),
      'nilai_pengikatan': nilaiPengikatanEdit.text.replaceAll('.', ''),
      'pengikatan': pengikatanEdit.text,
      'deskripsi_panjang': deskripsiPanjangEdit.text,
    };

    try {
      isAgunanLosProcessing(true);
      AgunanLosProvider().putAgunanLos(idAgunan, id, body).then((resp) {
        isAgunanLosProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil diupdate',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearFormEdit();
        listAgunanLos.clear();
        getAllAgunanLos(agunanId.id);
      }, onError: (e) {
        isAgunanLosProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLosProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteAgunanLos(int agunanId, id) {
    try {
      isAgunanLosProcessing(true);
      AgunanLosProvider().purgeAgunanLos(agunanId, id).then((resp) {
        isAgunanLosProcessing(false);
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        listAgunanLos.clear();
        getAllAgunanLos(agunanId);
      }, onError: (e) {
        isAgunanLosProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAgunanLosProcessing(false);
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
        'Agunan Los Pasar ${deskripsiPendek.text} atas nama ${namaPemilik.text} TTL: ${tempatLahir.text}, ${DateFormat('dd/MM/yyyy').format(DateTime.parse(tanggalLahir.toString()))}, yang beralamatkan di ${alamat.text} \n\nLos Pasar ini berlokasi di ${lokasiPasar.text}, dengan luas ${luasLos.text}m2, tempat dasaran ${tempatDasaran.text}, no registrasi ${noRegistrasi.text} \n\nJenis dagangan ${jenisDagangan.text}, dengan waktu buka pukul ${DateFormat('jm').format(DateTime.parse(waktuBuka.toString()))} dan tutup pukul ${DateFormat('jm').format(DateTime.parse(waktuTutup.toString()))} \n\n';
  }

  void generateDescriptionEdit() {
    deskripsiPanjangEdit.text =
        'Agunan Los Pasar ${deskripsiPendekEdit.text} atas nama ${namaPemilikEdit.text} TTL: ${tempatLahirEdit.text}, ${DateFormat('dd/MM/yyyy').format(DateTime.parse(tanggalLahirEdit.toString()))}, yang beralamatkan di ${alamatEdit.text} \n\nLos Pasar ini berlokasi di ${lokasiPasarEdit.text}, dengan luas ${luasLosEdit.text}m2, tempat dasaran ${tempatDasaranEdit.text}, no registrasi ${noRegistrasiEdit.text} \n\nJenis dagangan ${jenisDaganganEdit.text}, dengan waktu buka pukul ${DateFormat('jm').format(DateTime.parse(waktuBukaEdit.toString()))} dan tutup pukul ${DateFormat('jm').format(DateTime.parse(waktuTutupEdit.toString()))} \n\n';
  }

  void clearForm() {
    deskripsiPendek.clear();
    komponen.clear();
    namaPemilik.clear();
    tempatLahir.clear();
    tanggalLahir = DateTime.now();
    alamat.clear();
    tempatDasaran.clear();
    noRegistrasi.clear();
    luasLos.clear();
    jenisDagangan.clear();
    persentase.clear();
    lokasiPasar.clear();
    nilaiPasar.clear();
    nilaiLiquidasi.clear();
    nilaiPengikatan.clear();
    pengikatan.clear();
    deskripsiPanjang.clear();
  }

  void clearFormEdit() {
    deskripsiPendekEdit.clear();
    komponenEdit.clear();
    namaPemilikEdit.clear();
    tempatLahirEdit.clear();
    tanggalLahirEdit = DateTime.now();
    alamatEdit.clear();
    tempatDasaranEdit.clear();
    noRegistrasiEdit.clear();
    luasLosEdit.clear();
    jenisDaganganEdit.clear();
    persentaseEdit.clear();
    lokasiPasarEdit.clear();
    nilaiPasarEdit.clear();
    nilaiLiquidasiEdit.clear();
    nilaiPengikatanEdit.clear();
    pengikatanEdit.clear();
    deskripsiPanjangEdit.clear();
    
    
  @override
  void onClose() {
    deskripsiPendek.dispose();
    komponen.dispose();
    namaPemilik.dispose();
    tempatLahir.dispose();
    alamat.dispose();
    tempatDasaran.dispose();
    noRegistrasi.dispose();
    luasLos.dispose();
    jenisDagangan.dispose();
    persentase.dispose();
    lokasiPasar.dispose();
    titikKoordinat.dispose();
    pengikatan.dispose();
    deskripsiPanjang.dispose();
    deskripsiPendekEdit.dispose();
    komponenEdit.dispose();
    namaPemilikEdit.dispose();
    tempatLahirEdit.dispose();
    alamatEdit.dispose();
    tempatDasaranEdit.dispose();
    noRegistrasiEdit.dispose();
    luasLosEdit.dispose();
    jenisDaganganEdit.dispose();
    persentaseEdit.dispose();
    lokasiPasarEdit.dispose();
    titikKoordinatEdit.dispose();
    pengikatanEdit.dispose();
    deskripsiPanjangEdit.dispose();
    super.onClose();
  }
}
