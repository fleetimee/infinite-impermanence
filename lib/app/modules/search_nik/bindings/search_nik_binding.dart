import 'package:get/get.dart';

import '../controllers/search_nik_controller.dart';

class SearchNikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchNikController>(
      () => SearchNikController(),
    );
  }
}
