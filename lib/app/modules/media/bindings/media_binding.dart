import 'package:get/get.dart';

import '../controllers/media_controller.dart';

class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaController>(
      () => MediaController(),
    );
  }
}
