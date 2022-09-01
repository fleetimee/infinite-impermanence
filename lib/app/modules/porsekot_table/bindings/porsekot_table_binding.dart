import 'package:get/get.dart';

import '../controllers/porsekot_table_controller.dart';

class PorsekotTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PorsekotTableController>(
      () => PorsekotTableController(),
    );
  }
}
