// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/input_keuangan_controller.dart';

class InputKeuanganBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<InputKeuanganController>(
  //     () => InputKeuanganController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<InputKeuanganController>(
        () => InputKeuanganController(),
      )
    ];
  }
}
