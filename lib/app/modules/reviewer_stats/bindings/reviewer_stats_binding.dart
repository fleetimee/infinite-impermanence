import 'package:get/get.dart';

import '../controllers/reviewer_stats_controller.dart';

class ReviewerStatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewerStatsController>(
      () => ReviewerStatsController(),
    );
  }
}
