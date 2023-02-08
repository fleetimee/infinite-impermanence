import 'package:get/get.dart';

import '../controllers/detail_agunan_controller.dart';

class DetailAgunanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAgunanController>(
      () => DetailAgunanController(),
    );
  }
}
