// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/printing_controller.dart';

class PrintingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintingController>(
      () => PrintingController(),
    );
  }
}
