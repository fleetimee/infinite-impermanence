import 'package:get/get.dart';

import '../controllers/reviewer_completed_list_controller.dart';

class ReviewerCompletedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewerCompletedListController>(
      () => ReviewerCompletedListController(),
    );
  }
}
