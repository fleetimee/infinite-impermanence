import 'package:get/get.dart';

import '../controllers/rugi_laba_controller.dart';

class RugiLabaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RugiLabaController>(
      () => RugiLabaController(),
    );
  }
}
