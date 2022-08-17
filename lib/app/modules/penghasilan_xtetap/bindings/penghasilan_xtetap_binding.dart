// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/penghasilan_xtetap_controller.dart';

class PenghasilanXtetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenghasilanXtetapController>(
      () => PenghasilanXtetapController(),
    );
  }
}
