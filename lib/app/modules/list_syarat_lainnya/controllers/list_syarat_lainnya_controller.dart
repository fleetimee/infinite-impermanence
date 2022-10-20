import 'package:akm/app/data/provider/syarat_lain/save_syarat_lain.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ListSyaratLainnyaController extends GetxController {
  @override
  void onInit() {
    getAllSyaratLainnya(debiturId);
    super.onInit();
  }

  var listSyaratLainnya = List<SyaratLain>.empty(growable: true).obs;

  final isSyaratLainInputProcessing = false.obs;

  final debiturId = Get.arguments;

  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  var keterangan = TextEditingController();

  void getAllSyaratLainnya(int id) {
    try {
      isSyaratLainInputProcessing(true);
      SyaratLainProvider().fetchSyaratLain(id).then((resp) {
        isSyaratLainInputProcessing(false);
        listSyaratLainnya.addAll(resp);
      }, onError: (e) {
        isSyaratLainInputProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isSyaratLainInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
