// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/agunan_analisis_calc_controller.dart';

class AgunanAnalisisCalcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgunanAnalisisCalcController>(
      () => AgunanAnalisisCalcController(),
    );
  }
}
