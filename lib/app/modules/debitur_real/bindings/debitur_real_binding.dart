// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/debitur_real_controller.dart';

class DebiturRealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebiturRealController>(
      () => DebiturRealController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<DebiturRealController>(
  //       () => DebiturRealController(),
  //     )
  //   ];
  // }
}
