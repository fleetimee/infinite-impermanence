import 'package:get/get.dart';

import '../controllers/keuangan_analisis_controller.dart';

class KeuanganAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeuanganAnalisisController>(
      () => KeuanganAnalisisController(),
    );
  }
}
