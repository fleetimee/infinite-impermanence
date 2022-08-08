import 'package:get/get.dart';

import '../controllers/karakter_analisis_controller.dart';

class KarakterAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KarakterAnalisisController>(
      () => KarakterAnalisisController(),
    );
  }
}
