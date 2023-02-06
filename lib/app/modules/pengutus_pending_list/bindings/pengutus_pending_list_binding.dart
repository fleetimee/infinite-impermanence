import 'package:get/get.dart';

import '../controllers/pengutus_pending_list_controller.dart';

class PengutusPendingListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengutusPendingListController>(
      () => PengutusPendingListController(),
    );
  }
}
