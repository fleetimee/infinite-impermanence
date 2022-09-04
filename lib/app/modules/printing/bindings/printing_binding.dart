// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/printing_controller.dart';

class PrintingBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<PrintingController>(
  //     () => PrintingController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PrintingController>(
        () => PrintingController(),
      )
    ];
  }
}
