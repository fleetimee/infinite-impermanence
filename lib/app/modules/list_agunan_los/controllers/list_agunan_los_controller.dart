import 'package:akm/app/data/provider/agunan/agunan_los/agunan_los.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListAgunanLosController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanLos(agunanId.id);
  }

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

  final formKey = GlobalKey<FormBuilderState>();

  final agunanId = Get.arguments;

  final isAgunanLosProcessing = false.obs;

  var listAgunanLos = List<FormLo>.empty(growable: true).obs;

  void generateDescription() {
    deskripsiPanjang.text =
        'Agunan Los Pasar ${deskripsiPendek.text} atas nama ${namaPemilik.text} TTL: ${tempatLahir.text}, ${DateFormat('dd/MM/yyyy').format(DateTime.parse(tanggalLahir.toString()))}, yang beralamatkan di ${alamat.text} \n\nLos Pasar ini berlokasi di ${lokasiPasar.text}, dengan luas ${luasLos.text}m2, tempat dasaran ${tempatDasaran.text}, no registrasi ${noRegistrasi.text} \n\nJenis dagangan ${jenisDagangan.text}, dengan waktu buka pukul ${DateFormat('jm').format(DateTime.parse(waktuBuka.toString()))} dan tutup pukul ${DateFormat('jm').format(DateTime.parse(waktuTutup.toString()))} \n\n';
  }

  void hitungNilaiLiquidasi() {
    final parseNilaiPasar = double.parse(nilaiPasar.text.replaceAll('.', ''));
    final parsePersentase = double.parse(persentase.text);

    final hasilLiquidasi = parseNilaiPasar * (parsePersentase / 100);

    nilaiLiquidasi.text = hasilLiquidasi.toStringAsFixed(0);
    nilaiPengikatan.text = parseNilaiPasar.toStringAsFixed(0);
  }

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
      'persentase': persentase.text,
      'lokasi_pasar': lokasiPasar.text,
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
}
