// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/pengajuan_detail_controller.dart';

class PengajuanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanDetailController>(
      () => PengajuanDetailController(),
    );
  }
}
