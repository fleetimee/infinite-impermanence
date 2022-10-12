// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_kendaraan_controller.dart';

class ListAgunanKendaraanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanKendaraanController>(
      () => ListAgunanKendaraanController(),
    );
  }
}
