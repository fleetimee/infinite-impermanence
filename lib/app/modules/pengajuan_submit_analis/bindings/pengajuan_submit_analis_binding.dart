// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/pengajuan_submit_analis_controller.dart';

class PengajuanSubmitAnalisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanSubmitAnalisController>(
      () => PengajuanSubmitAnalisController(),
    );
  }
}
