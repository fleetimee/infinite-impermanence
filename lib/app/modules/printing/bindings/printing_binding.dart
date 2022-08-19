import 'package:get/get.dart';

import '../controllers/printing_controller.dart';

class PrintingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintingController>(
      () => PrintingController(),
    );
  }
}
