import 'package:akm/app/data/provider/debitur/detail_debitur.provider.dart';
import 'package:akm/app/data/provider/pengajuan/pengajuan_submit_pemutus.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:akm/app/modules/home_pengutus/controllers/home_pengutus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PengutusSubmitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchDebiturDetails();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), () {
      getRating();
    });

    super.onReady();
  }

  PengajuanDetail pengajuan = Get.arguments;

  var isProcessing = false.obs;
  var insightDebitur = DebiturInsight().obs;

  var rating = ''.obs;
  var keterangan = ''.obs;
  var totalCrr = ''.obs;

  final formKey = GlobalKey<FormBuilderState>();

  final homeCtrl = Get.put(HomePengutusController());

  var isSubmitLoading = false.obs;

  var bahasanPemutus = List.empty(growable: true);

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
  var isGalleryRead = false.obs;

  void getRating() async {
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

  void savePutusan() {
    var tglPutusan = formKey.currentState?.fields['tglPutusan']?.value;

    var formatter = DateFormat('yyyy-MM-dd');

    String formatted = formatter.format(tglPutusan);

    final body = {
      "status": formKey.currentState?.fields['putusan']?.value,
      "tgl_pemutusan": formatted,
      "bahasan_pengutus": bahasanPemutus,
      "checkPengutus": {
        "is_keuangan_approved": formKey.currentState!.fields['keuangan']?.value,
        "is_karakter_approved": formKey.currentState!.fields['karakter']?.value,
        "is_agunan_approved": formKey.currentState!.fields['agunan']?.value,
        "is_bisnis_approved": formKey.currentState!.fields['bisnis']?.value,
        "is_jenis_usaha_approved": formKey.currentState!.fields['usaha']?.value,
      }
    };

    try {
      isSubmitLoading(true);
      PengajuanSubmitPutusanProvider()
          .submitPengajuanPemutus(pengajuan.id!, body)
          .then((resp) {
        isSubmitLoading(false);
        homeCtrl.getMyPendingPemutusan();
        homeCtrl.getMyCompletedPutusan();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isSubmitLoading(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isSubmitLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void resetForm() {
    formKey.currentState?.reset();
  }
}
