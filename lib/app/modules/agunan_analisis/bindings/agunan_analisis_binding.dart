// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/agunan_analisis_controller.dart';

class AgunanAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgunanAnalisisController>(
      () => AgunanAnalisisController(),
    );
  }
}
