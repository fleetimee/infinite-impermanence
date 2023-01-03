// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/gallery_image_controller.dart';

class GalleryImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryImageController>(
      () => GalleryImageController(),
    );
  }
}
