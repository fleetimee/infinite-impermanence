import 'package:get/get.dart';

import '../controllers/input_neraca_controller.dart';

class InputNeracaBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<InputNeracaController>(
  //     () => InputNeracaController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<InputNeracaController>(
        () => InputNeracaController(),
      )
    ];
  }
}
