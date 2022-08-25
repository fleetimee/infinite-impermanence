import 'package:get/get.dart';

import '../controllers/input_keuangan_controller.dart';

class InputKeuanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputKeuanganController>(
      () => InputKeuanganController(),
    );
  }
}
