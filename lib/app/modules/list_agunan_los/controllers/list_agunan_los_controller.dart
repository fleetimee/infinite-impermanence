import 'package:akm/app/data/provider/agunan/agunan_los/agunan_los.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ListAgunanLosController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllAgunanLos(agunanId.id);
  }

  final formKey = GlobalKey<FormBuilderState>();

  final agunanId = Get.arguments;

  final isAgunanLosProcessing = false.obs;

  var listAgunanLos = List<FormLo>.empty(growable: true).obs;

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
