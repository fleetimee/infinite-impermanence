// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/usaha_analisis_controller.dart';

class UsahaAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsahaAnalisisController>(
      () => UsahaAnalisisController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<UsahaAnalisisController>(
  //       () => UsahaAnalisisController(),
  //     )
  //   ];
  // }
}
