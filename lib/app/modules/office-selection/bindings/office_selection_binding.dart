import 'package:get/get.dart';

import '../controllers/office_selection_controller.dart';

class OfficeSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfficeSelectionController>(
      () => OfficeSelectionController(),
    );
  }
}
