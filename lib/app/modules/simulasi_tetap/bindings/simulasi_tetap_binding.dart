import 'package:get/get.dart';

import '../controllers/simulasi_tetap_controller.dart';

class SimulasiTetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimulasiTetapController>(
      () => SimulasiTetapController(),
    );
  }
}
