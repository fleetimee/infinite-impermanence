import 'package:get/get.dart';

import '../controllers/agunan_form_onboarding_controller.dart';

class AgunanFormOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgunanFormOnboardingController>(
      () => AgunanFormOnboardingController(),
    );
  }
}
