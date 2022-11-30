import 'package:get/get.dart';

import '../controllers/gallery_file_controller.dart';

class GalleryFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryFileController>(
      () => GalleryFileController(),
    );
  }
}
