import 'package:get/get.dart';

import '../controllers/pengajuan_submit_analis_controller.dart';

class PengajuanSubmitAnalisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanSubmitAnalisController>(
      () => PengajuanSubmitAnalisController(),
    );
  }
}
