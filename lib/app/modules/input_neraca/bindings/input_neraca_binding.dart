import 'package:get/get.dart';

import '../controllers/input_neraca_controller.dart';

class InputNeracaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputNeracaController>(
      () => InputNeracaController(),
    );
  }
}
