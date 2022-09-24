// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../service/analisa_usaha_services.dart';

class UsahaAnalisisController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  var jenisUsaha = TextEditingController();
  var crrJenisUsaha = TextEditingController();
  var debiturId = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   hitungCrrUsaha();
  // }

  @override
  void onReady() {
    hitungCrrUsaha();
    super.onReady();
  }

  void hitungCrrUsaha() async {
    if (jenisUsaha.text == 'Pertanian') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Perikanan') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Pertambangan') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Perindustrian') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Listrik') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Gas') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Air') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Kontruksi') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Perdagangan') {
      crrJenisUsaha.text = '85';
    } else if (jenisUsaha.text == 'Pengangkutan') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Komunikasi') {
      crrJenisUsaha.text = '80';
    } else if (jenisUsaha.text == 'Jasa Dunia Usaha') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Jasa Sosial') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Lain - Lain') {
      crrJenisUsaha.text = '75';
    } else {
      crrJenisUsaha.text = '0';
    }
  }

  void saveAnalisaUsaha() {
    final api = AnalisaJenisUsahaService();
    final data = {
      'jenis_usaha': jenisUsaha.text,
      'total_crr_usaha': crrJenisUsaha.text,
      'debitur': debiturId.text,
    };

    api.addAnalisaJenisUsaha(data);

    update();
  }
}
