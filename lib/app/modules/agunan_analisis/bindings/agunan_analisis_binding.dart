import 'package:get/get.dart';

import '../controllers/agunan_analisis_controller.dart';

class AgunanAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgunanAnalisisController>(
      () => AgunanAnalisisController(),
    );
  }
}
