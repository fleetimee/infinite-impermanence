import 'package:get/get.dart';

import '../controllers/intro_screen_controller.dart';

class IntroScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroScreenController>(
      () => IntroScreenController(),
    );
  }
}
