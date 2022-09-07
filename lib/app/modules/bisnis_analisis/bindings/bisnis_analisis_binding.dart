// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/bisnis_analisis_controller.dart';

class BisnisAnalisisBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<BisnisAnalisisController>(
  //     () => BisnisAnalisisController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<BisnisAnalisisController>(
        () => BisnisAnalisisController(),
      )
    ];
  }
}
