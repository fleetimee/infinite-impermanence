// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/input_neraca_controller.dart';

class InputNeracaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputNeracaController>(
      () => InputNeracaController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<InputNeracaController>(
  //       () => InputNeracaController(),
  //     )
  //   ];
  // }
}
