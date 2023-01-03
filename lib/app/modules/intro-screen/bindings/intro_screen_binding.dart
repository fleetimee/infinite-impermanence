// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/intro_screen_controller.dart';

class IntroScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroScreenController>(
      () => IntroScreenController(),
    );
  }
}
