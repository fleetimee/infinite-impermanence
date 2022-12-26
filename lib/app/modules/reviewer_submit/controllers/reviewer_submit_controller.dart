import 'package:akm/app/data/provider/debitur/detail_debitur.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ReviewerSubmitController extends GetxController {
  Pengajuan pengajuan = Get.arguments;
  var isProcessing = false.obs;
  var insightDebitur = DebiturInsight().obs;

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    fetchDebiturDetails();
  }

  var isKeuanganPressed = false.obs;
  var keuanganValue = false.obs;

  var isKarakterPressed = false.obs;
  var karakterValue = false.obs;

  var isBisnisPressed = false.obs;
  var bisnisValue = false.obs;

  var isUsahaPressed = false.obs;
  var usahaValue = false.obs;

  var isAgunanPressed = false.obs;
  var agunanValue = false.obs;

  // fetch debitur details
  void fetchDebiturDetails() {
    try {
      isProcessing(true);
      InsightDebiturProvider().fetchDebiturById(pengajuan.debiturId!).then(
          (resp) {
        isProcessing(false);
        insightDebitur.value = resp;
      }, onError: (err) {
        isProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
