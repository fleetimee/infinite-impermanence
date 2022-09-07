// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/agunan_controller.dart';

class AgunanBinding extends Binding {
  // void dependencies() {
  //   Get.lazyPut<AgunanController>(
  //     () => AgunanController(),
  //   );
  // }

  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<AgunanController>(
        () => AgunanController(),
      )
    ];
  }
}
