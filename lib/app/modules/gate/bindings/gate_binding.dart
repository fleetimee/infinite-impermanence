import 'package:get/get.dart';

import '../controllers/gate_controller.dart';

class GateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GateController>(
      () => GateController(),
    );
  }
}
