import 'package:get/get.dart';

import '../controllers/kurs_controller.dart';

class KursBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KursController>(
      () => KursController(),
    );
  }
}
