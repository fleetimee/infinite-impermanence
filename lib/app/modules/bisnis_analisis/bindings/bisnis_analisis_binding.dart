import 'package:get/get.dart';

import '../controllers/bisnis_analisis_controller.dart';

class BisnisAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BisnisAnalisisController>(
      () => BisnisAnalisisController(),
    );
  }
}
