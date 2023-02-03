import 'package:get/get.dart';
import 'package:akm/app/data/provider/user/pengajuan_debitur.provider.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';

class ReviewerPendingListController extends GetxController {
  @override
  void onInit() {
    getMyPendingReview();
    super.onInit();
  }

  var uid = Get.arguments;

  List listMyPendingReview = <PengajuanDetail>[].obs;
  var isMyPendingReviewProcessing = false.obs;

  void getMyPendingReview() async {
    try {
      isMyPendingReviewProcessing(true);
      MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
        isMyPendingReviewProcessing(false);
        final finalList = resp.pengajuan
            ?.where((element) => element.status == 'PENDING')
            .toList();

        listMyPendingReview.clear();
        listMyPendingReview = finalList ?? [];
      }, onError: (err) {
        isMyPendingReviewProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMyPendingReviewProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
