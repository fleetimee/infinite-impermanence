import 'package:get/get.dart';

import '../controllers/pengutus_submit_controller.dart';

class PengutusSubmitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengutusSubmitController>(
      () => PengutusSubmitController(),
    );
  }
}
