// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';

class PengutusSubmitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengutusSubmitController>(
      () => PengutusSubmitController(),
    );
  }
}
