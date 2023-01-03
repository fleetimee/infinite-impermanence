// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/media_controller.dart';

class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaController>(
      () => MediaController(),
    );
  }
}
