import 'package:get/get.dart';

import '../controllers/home_pengutus_controller.dart';

class HomePengutusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePengutusController>(
      () => HomePengutusController(),
    );
  }
}
