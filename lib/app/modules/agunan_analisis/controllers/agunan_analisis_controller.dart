import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanAnalisisController extends GetxController {
  var isAnalisaAgunanProcessing = false.obs;

  final data = Get.arguments;

  final formKey = GlobalKey<FormBuilderState>();

  var totalCrrAgunan = TextEditingController();

  // void getAnalisaAgunan(int id) {
  //   try {
  //     isAnalisaAgunanProcessing(true);
  //     AnalisaAgunanProvider().fetchAnalisaAgunan(id).then((resp) {
  //       isAnalisaAgunanProcessing(false);
  //       listAnalisaAgunan.addAll(resp);
  //     }, onError: (e) {
  //       isAnalisaAgunanProcessing(false);
  //       Get.snackbar('Error', e.toString());
  //     });
  //   } catch (e) {
  //     isAnalisaAgunanProcessing(false);
  //     Get.snackbar('Error', e.toString());
  //   }
  // }
}
