// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
  }
}
