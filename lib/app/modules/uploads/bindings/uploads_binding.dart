import 'package:get/get.dart';

import '../controllers/uploads_controller.dart';

class UploadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadsController>(
      () => UploadsController(),
    );
  }
}
