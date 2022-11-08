import 'package:get/get.dart';

import '../controllers/ijin_legitimasi_controller.dart';

class IjinLegitimasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IjinLegitimasiController>(
      () => IjinLegitimasiController(),
    );
  }
}
