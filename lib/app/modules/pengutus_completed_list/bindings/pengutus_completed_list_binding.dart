import 'package:get/get.dart';

import '../controllers/pengutus_completed_list_controller.dart';

class PengutusCompletedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengutusCompletedListController>(
      () => PengutusCompletedListController(),
    );
  }
}
