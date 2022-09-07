// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/penghasilan_xtetap_controller.dart';

class PenghasilanXtetapBinding extends Binding {
  // @override
  // void dependencies() {
  //   Get.lazyPut<PenghasilanXtetapController>(
  //     () => PenghasilanXtetapController(),
  //   );
  // }

  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PenghasilanXtetapController>(
        () => PenghasilanXtetapController(),
      )
    ];
  }
}
