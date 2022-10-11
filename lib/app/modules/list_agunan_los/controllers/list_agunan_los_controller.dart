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
  var waktuBuka = TextEditingController();
  var waktuTutup = TextEditingController();
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
        'Agunan Los Pasar ${deskripsiPendek.text} atas nama ${namaPemilik.text} TTL: ${tempatLahir.text}, ${DateFormat('dd/MM/yyyy').format(DateTime.parse(tanggalLahir.toString()))}, yang beralamatkan di ${alamat.text} \n\nLos Pasar ini berlokasi di ${lokasiPasar.text}, dengan luas ${luasLos.text}m2, tempat dasaran ${tempatDasaran.text}, no registrasi ${noRegistrasi.text} \n\nJenis dagangan ${jenisDagangan.text}, dengan waktu buka pukul ${DateFormat('jm').format(DateTime.parse(waktuBuka.text))} dan tutup pukul ${DateFormat('jm').format(DateTime.parse(waktuTutup.text))} \n\n';
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
}
