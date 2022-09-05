// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/rugi_laba_controller.dart';

class RugiLabaBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<RugiLabaController>(
  //     () => RugiLabaController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RugiLabaController>(
        () => RugiLabaController(),
      )
    ];
  }
}
