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
  List listMyCompletedReviewFilteredByAccepatance = <Pengajuan>[].obs;
  List listMyCompletedReviewFilteredByRejection = <Pengajuan>[].obs;
  List listFilteredByMonday = <Pengajuan>[].obs;
  List listFilteredByTuesday = <Pengajuan>[].obs;
  List listFilteredByWednesday = <Pengajuan>[].obs;
  List listFilteredByThursday = <Pengajuan>[].obs;
  List listFilteredByFriday = <Pengajuan>[].obs;
  List listFilteredBySaturday = <Pengajuan>[].obs;
  List listFilteredBySunday = <Pengajuan>[].obs;

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

        final finalListAccepted = resp.pengajuan
            ?.where((element) => element.status == 'DONE')
            .toList();

        final finalListRejected = resp.pengajuan
            ?.where((element) => element.status == 'REJECTED')
            .toList();

        // cheeck if every resp has tglReview == day 1
        final finalListMonday = resp.pengajuan
            ?.where((element) => element.tglReview?.day == 7)
            .toList();

        // sort desc by tglReview
        finalList?.sort((a, b) => b.tglReview!.compareTo(a.tglReview!));

        listMyCompletedReview.clear();
        listMyCompletedReview = finalList ?? [];

        listMyCompletedReviewFilteredByAccepatance.clear();
        listMyCompletedReviewFilteredByAccepatance = finalListAccepted ?? [];

        listMyCompletedReviewFilteredByRejection.clear();
        listMyCompletedReviewFilteredByRejection = finalListRejected ?? [];

        listFilteredByMonday.clear();
        listFilteredByMonday = finalListMonday ?? [];
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
