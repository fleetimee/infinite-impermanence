import 'package:get/get.dart';

import '../controllers/create_debitur_controller.dart';

class CreateDebiturBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDebiturController>(
      () => CreateDebiturController(),
    );
  }
}
