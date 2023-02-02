import 'package:get/get.dart';

import '../controllers/crypto_controller.dart';

class CryptoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CryptoController>(
      () => CryptoController(),
    );
  }
}
