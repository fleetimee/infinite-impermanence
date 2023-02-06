import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/pengutus_completed_list/controllers/pengutus_completed_list_controller.dart';
import 'package:akm/app/modules/pengutus_pending_list/controllers/pengutus_pending_list_controller.dart';
import 'package:get/get.dart';

class PengutusPendingStatsController extends GetxController {
  var homeController = Get.put(HomeController());
  var pendingController = Get.put(PengutusPendingListController());
  var completedController = Get.put(PengutusCompletedListController());
}
