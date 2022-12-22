import 'package:get/get.dart';

import '../controllers/pengajuan_detail_controller.dart';

class PengajuanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanDetailController>(
      () => PengajuanDetailController(),
    );
  }
}
