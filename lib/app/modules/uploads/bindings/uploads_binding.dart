// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/uploads_controller.dart';

class UploadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadsController>(
      () => UploadsController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<UploadsController>(
  //       () => UploadsController(),
  //     )
  //   ];
  // }
}
