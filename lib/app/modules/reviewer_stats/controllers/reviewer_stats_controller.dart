import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/reviewer_completed_list/controllers/reviewer_completed_list_controller.dart';
import 'package:akm/app/modules/reviewer_pending_list/controllers/reviewer_pending_list_controller.dart';
import 'package:get/get.dart';

class ReviewerStatsController extends GetxController {
  var uid = Get.arguments;

  final count = 0.obs;

  void increment() => count.value++;

  var homeController = Get.put(HomeController());
  var pendingController = Get.put(ReviewerPendingListController());
  var completedController = Get.put(ReviewerCompletedListController());

  final List<Map> chartData = [];

  @override
  void onInit() {
    getMyReviewStatus();
    super.onInit();
  }

  getMyReviewStatus() {
    chartData.clear();
    chartData.addAll([
      {
        'status': 'Pending',
        'value': pendingController.listMyPendingReview.length,
      },
      {
        'status': 'Completed',
        'value': completedController.listMyCompletedReview.length,
      },
      {
        'status': 'Accepted',
        'value': completedController
            .listMyCompletedReviewFilteredByAccepatance.length,
      },
      {
        'status': 'Rejected',
        'value':
            completedController.listMyCompletedReviewFilteredByRejection.length,
      }
    ]);
  }
}
