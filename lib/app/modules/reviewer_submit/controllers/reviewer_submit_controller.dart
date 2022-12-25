import 'package:akm/app/data/provider/debitur/detail_debitur.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';
import 'package:get/get.dart';

class ReviewerSubmitController extends GetxController {
  Pengajuan pengajuan = Get.arguments;
  var isProcessing = false.obs;
  var insightDebitur = DebiturInsight().obs;

  @override
  void onInit() {
    super.onInit();
    fetchDebiturDetails();
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
