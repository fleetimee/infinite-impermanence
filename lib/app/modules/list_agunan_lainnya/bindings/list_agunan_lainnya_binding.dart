// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_lainnya_controller.dart';

class ListAgunanLainnyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanLainnyaController>(
      () => ListAgunanLainnyaController(),
    );
  }
}
