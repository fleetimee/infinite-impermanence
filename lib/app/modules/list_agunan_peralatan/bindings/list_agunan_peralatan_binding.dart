import 'package:get/get.dart';

import '../controllers/list_agunan_peralatan_controller.dart';

class ListAgunanPeralatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanPeralatanController>(
      () => ListAgunanPeralatanController(),
    );
  }
}
