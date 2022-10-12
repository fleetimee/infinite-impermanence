// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_los_controller.dart';

class ListAgunanLosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanLosController>(
      () => ListAgunanLosController(),
    );
  }
}
