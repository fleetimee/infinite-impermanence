// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/media_docs_controller.dart';

class MediaDocsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaDocsController>(
      () => MediaDocsController(),
    );
  }
}
