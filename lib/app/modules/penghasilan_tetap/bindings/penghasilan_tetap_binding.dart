// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/penghasilan_tetap_controller.dart';

class PenghasilanTetapBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<PenghasilanTetapController>(
  //     () => PenghasilanTetapController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PenghasilanTetapController>(
        () => PenghasilanTetapController(),
      )
    ];
  }
}
