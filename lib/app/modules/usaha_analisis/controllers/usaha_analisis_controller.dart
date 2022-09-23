import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class UsahaAnalisisController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  var jenisUsaha = TextEditingController();
  var crrJenisUsaha = TextEditingController();

  @override
  void onInit() {
    hitungCrrUsaha();
    super.onInit();
  }

  void hitungCrrUsaha() {
    if (jenisUsaha.text == 'Komunikasi') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Perdagangan') {
      crrJenisUsaha.text = '1.0';
    } else if (jenisUsaha.text == 'Industri') {
      crrJenisUsaha.text = '0.5';
    } else if (jenisUsaha.text == 'Jasa') {
      crrJenisUsaha.text = '0.0';
    }
  }
}
