import 'package:akm/app/data/provider/user/pengajuan_debitur.provider.dart';
import 'package:get/get.dart';

import 'package:akm/app/models/user/user_pengajuan.model.dart';

class ReviewerCompletedListController extends GetxController {
  var uid = Get.arguments;

  @override
  void onInit() {
    getMyCompletedReview();
    super.onInit();
  }

  List listMyCompletedReview = <Pengajuan>[].obs;
  var isMyCompletedReviewProcessing = false.obs;

  void getMyCompletedReview() async {
    try {
      isMyCompletedReviewProcessing(true);
      MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
        isMyCompletedReviewProcessing(false);
        final finalList = resp.pengajuan
            ?.where((element) =>
                element.status == 'REVIEWED' ||
                element.status == 'REJECTED' ||
                element.status == 'DONE')
            .toList();

        listMyCompletedReview.clear();
        listMyCompletedReview = finalList ?? [];
      }, onError: (err) {
        isMyCompletedReviewProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMyCompletedReviewProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
