import 'package:get/get.dart';

import '../controllers/pengutus_pending_stats_controller.dart';

class PengutusPendingStatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengutusPendingStatsController>(
      () => PengutusPendingStatsController(),
    );
  }
}
