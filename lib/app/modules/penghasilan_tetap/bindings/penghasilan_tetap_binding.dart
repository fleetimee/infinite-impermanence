import 'package:get/get.dart';

import '../controllers/penghasilan_tetap_controller.dart';

class PenghasilanTetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenghasilanTetapController>(
      () => PenghasilanTetapController(),
    );
  }
}
