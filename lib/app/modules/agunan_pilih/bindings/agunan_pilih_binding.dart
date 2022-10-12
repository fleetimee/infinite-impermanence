// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/agunan_pilih_controller.dart';

class AgunanPilihBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgunanPilihController>(
      () => AgunanPilihController(),
    );
  }
}
