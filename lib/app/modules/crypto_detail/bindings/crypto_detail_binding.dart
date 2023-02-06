import 'package:get/get.dart';

import '../controllers/crypto_detail_controller.dart';

class CryptoDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CryptoDetailController>(
      () => CryptoDetailController(),
    );
  }
}
