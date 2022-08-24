import 'package:get/get.dart';

import '../controllers/debitur_detail_banget_controller.dart';

class DebiturDetailBangetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebiturDetailBangetController>(
      () => DebiturDetailBangetController(),
    );
  }
}
