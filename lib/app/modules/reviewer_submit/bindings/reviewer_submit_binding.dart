// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewerSubmitController>(
      () => ReviewerSubmitController(),
    );
  }
}
