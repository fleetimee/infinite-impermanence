// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/simulasi_tetap_controller.dart';

class SimulasiTetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimulasiTetapController>(
      () => SimulasiTetapController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<SimulasiTetapController>(
  //       () => SimulasiTetapController(),
  //     )
  //   ];
  // }
}
