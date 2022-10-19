import 'package:get/get.dart';

import '../controllers/list_syarat_lainnya_controller.dart';

class ListSyaratLainnyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSyaratLainnyaController>(
      () => ListSyaratLainnyaController(),
    );
  }
}
