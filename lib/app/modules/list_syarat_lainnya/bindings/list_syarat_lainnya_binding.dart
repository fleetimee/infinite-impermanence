// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_syarat_lainnya_controller.dart';

class ListSyaratLainnyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSyaratLainnyaController>(
      () => ListSyaratLainnyaController(),
    );
  }
}
