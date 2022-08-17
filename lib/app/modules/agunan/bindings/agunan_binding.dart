// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/agunan_controller.dart';

class AgunanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgunanController>(
      () => AgunanController(),
    );
  }
}
