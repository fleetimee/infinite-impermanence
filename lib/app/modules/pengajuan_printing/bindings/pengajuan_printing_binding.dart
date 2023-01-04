import 'package:get/get.dart';

import '../controllers/pengajuan_printing_controller.dart';

class PengajuanPrintingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanPrintingController>(
      () => PengajuanPrintingController(),
    );
  }
}
