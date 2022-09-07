// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/keuangan_analisis_controller.dart';

class KeuanganAnalisisBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<KeuanganAnalisisController>(
  //     () => KeuanganAnalisisController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<KeuanganAnalisisController>(
        () => KeuanganAnalisisController(),
      )
    ];
  }
}
