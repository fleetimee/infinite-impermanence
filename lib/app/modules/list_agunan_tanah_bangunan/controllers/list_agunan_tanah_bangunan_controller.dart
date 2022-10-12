// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class ListAgunanTanahBangunanController extends GetxController {
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

  var listAgunanTanahBangunan = List<FormTanah>.empty(growable: true).obs;
}
