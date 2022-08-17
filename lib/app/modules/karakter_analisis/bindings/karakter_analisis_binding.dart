// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/karakter_analisis_controller.dart';

class KarakterAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KarakterAnalisisController>(
      () => KarakterAnalisisController(),
    );
  }
}
