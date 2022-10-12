// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_cash_controller.dart';

class ListAgunanCashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanCashController>(
      () => ListAgunanCashController(),
    );
  }
}
