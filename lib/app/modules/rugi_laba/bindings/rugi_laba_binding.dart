// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/rugi_laba_controller.dart';

class RugiLabaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RugiLabaController>(
      () => RugiLabaController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<RugiLabaController>(
  //       () => RugiLabaController(),
  //       fenix: true,
  //     )
  //   ];
  // }
}
