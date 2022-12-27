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

  var rating = ''.obs;
  var keterangan = ''.obs;
  var totalCrr = ''.obs;

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    fetchDebiturDetails();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 500), () {
      getRating();
    });

    super.onReady();
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

  var isInputanRead = false.obs;

  void getRating() {
    var debtor = insightDebitur.value;

    final totalUsaha = (10 *
            (double.parse(debtor.analisaJenisUsaha!.totalCrrUsaha.toString()) /
                100))
        .toStringAsFixed(1);

    final totalKarakter = (30 *
        (double.parse(debtor.analisaKarakter!.totalCrrKarakter.toString()) /
            100));

    final totalBisnis = (25 *
        (double.parse(debtor.analisaBisnis!.hasilCrrBisnis.toString()) / 100));

    final totalKeuangan = (25 *
        (double.parse(debtor.analisaKeuangan!.totalCrrKeuangan.toString()) /
            100));

    final totalAgunan = (10 *
        (double.parse(debtor.analisaAgunan!.totalCrrAgunan.toString()) / 100));

    final totalCrrAll = double.parse(totalUsaha) +
        totalKarakter +
        totalBisnis +
        totalKeuangan +
        totalAgunan;

    var gradeKeterangan = totalCrrAll > 90 && totalCrrAll <= 100
        ? 'Excellent'
        : totalCrrAll > 79.01 && totalCrrAll <= 90
            ? 'Baik sekali'
            : totalCrrAll > 69.01 && totalCrrAll <= 79
                ? 'Baik'
                : totalCrrAll > 64.01 && totalCrrAll <= 69
                    ? 'Cukup Baik'
                    : totalCrrAll > 59.01 && totalCrrAll <= 64
                        ? 'Cukup'
                        : totalCrrAll > 54.01 && totalCrrAll <= 59
                            ? 'Agak Kurang'
                            : totalCrrAll > 49.01 && totalCrrAll <= 54
                                ? 'Kurang'
                                : 'Kurang Sekali';

    final gradeAlphabet = totalCrrAll > 90
        ? 'AAA'
        : totalCrrAll > 80
            ? 'AA'
            : totalCrrAll > 70
                ? 'A'
                : totalCrrAll > 65
                    ? 'BB'
                    : totalCrrAll > 60
                        ? 'B'
                        : totalCrrAll > 54
                            ? 'C'
                            : totalCrrAll > 50
                                ? 'D'
                                : 'E';

    rating.value = gradeAlphabet;
    keterangan.value = gradeKeterangan;
    totalCrr.value = totalCrrAll.toStringAsFixed(1);
  }

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
