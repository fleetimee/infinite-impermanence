// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/widget/send_screen.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/pengajuan/pengajuan_submit_analis.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class PengajuanSubmitAnalisController extends GetxController {
  // Inject home controller
  final homeCtrl = Get.put(HomeController());
  final insightCtrl = Get.put(InsightDebiturController());

  DebiturInsight data = Get.arguments;
  var isPengajuanLoading = false.obs;

  final idCurrentUser = ''.obs;

  final formKey = GlobalKey<FormBuilderState>();

  var bahasanAnalis = List.empty(growable: true);
  // split uuid from string

  void resetForm() {
    formKey.currentState?.reset();
  }

  void submitPengajuanAnalis() {
    List<String> parts =
        formKey.currentState?.fields['reviewers']?.value.split(':');

    String uuid = parts[1].trim();

    // convert DateTime to String YYYY-MM-DD
    var tglPengajuan = formKey.currentState?.fields['tglPengajuan']?.value;

    var formatter = DateFormat('yyyy-MM-dd');

    String formatted = formatter.format(tglPengajuan);

    final body = {
      'status': 'PENDING',
      'debiturId': data.id,
      'bahasan_analis': bahasanAnalis,
      'tgl_submit': formatted,
      'tgl_review': '1970-01-01',
      'user': [
        // ID ANALIS
        {
          'id': homeCtrl.idUntukFetchInput.value,
        },
        // ID REVIEWER
        {'id': uuid}
      ]
    };

    try {
      isPengajuanLoading(true);
      Get.dialog(
        const SendScreen(),
        barrierDismissible: false,
      );
      PengajuanSubmitProvider().submitPengajuanAnalis(body).then((resp) {
        isPengajuanLoading(false);
        homeCtrl.getMySubmission();
        insightCtrl.fetchOneDebitur(data.id!);
        resetForm();
        Get.back();
        Get.back();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isPengajuanLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isPengajuanLoading(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
