import 'package:get/get.dart';

import '../controllers/debitur_deploy_controller.dart';

class DebiturDeployBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebiturDeployController>(
      () => DebiturDeployController(),
    );
  }
}
