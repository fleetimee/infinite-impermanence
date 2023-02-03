import 'package:get/get.dart';

import '../controllers/reviewer_pending_list_controller.dart';

class ReviewerPendingListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewerPendingListController>(
      () => ReviewerPendingListController(),
    );
  }
}
