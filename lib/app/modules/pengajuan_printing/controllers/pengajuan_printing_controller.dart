import 'package:akm/app/data/provider/debitur/detail_debitur.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:get/get.dart';

class PengajuanPrintingController extends GetxController {
  var insightDebitur = DebiturInsight().obs;
  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDebiturDetails();
  }

  PengajuanDetail pengajuan = Get.arguments;

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
