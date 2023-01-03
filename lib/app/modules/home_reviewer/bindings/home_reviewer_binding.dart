// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/home_reviewer_controller.dart';

class HomeReviewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeReviewerController>(
      () => HomeReviewerController(),
    );
  }
}
