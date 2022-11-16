// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/asuransi_controller.dart';

class AsuransiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AsuransiController>(
      () => AsuransiController(),
    );
  }
}
