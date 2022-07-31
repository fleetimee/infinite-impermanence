import 'package:get/get.dart';

import '../controllers/penghasilan_xtetap_controller.dart';

class PenghasilanXtetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenghasilanXtetapController>(
      () => PenghasilanXtetapController(),
    );
  }
}
