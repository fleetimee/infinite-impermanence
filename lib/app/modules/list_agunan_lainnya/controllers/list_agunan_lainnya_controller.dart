// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/agunan/agunan_lainnya/agunan_lainnya.provider.dart';
import '../../../models/debitur_model/insight_debitur.model.dart';

class ListAgunanLainnyaController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanLainnya(agunanId.id);
  }

  var deskripsiPanjang = TextEditingController();
  var persentase = TextEditingController();
  var nilaiPasar = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiLiquidasi = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var nilaiPengikatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pengikatan = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  final agunanId = Get.arguments[0];
  final plafon = Get.arguments[1];

  final isAgunanLainnyaProcessing = false.obs;

  var listAgunanLainnya = List<FormCommon>.empty(growable: true).obs;

  void getAllAgunanLainnya(int id) {
    try {
      isAgunanLainnyaProcessing(true);
      AgunanLainnyaProvider().fetchAgunanLainnya(id).then((resp) {
        isAgunanLainnyaProcessing(false);
        listAgunanLainnya.addAll(resp);
      }, onError: (e) {
        isAgunanLainnyaProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanLainnyaProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
