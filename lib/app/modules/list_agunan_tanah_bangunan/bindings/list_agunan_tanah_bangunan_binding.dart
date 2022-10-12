// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_tanah_bangunan_controller.dart';

class ListAgunanTanahBangunanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanTanahBangunanController>(
      () => ListAgunanTanahBangunanController(),
    );
  }
}
