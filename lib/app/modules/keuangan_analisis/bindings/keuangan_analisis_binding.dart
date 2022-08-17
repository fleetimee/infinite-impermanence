// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/keuangan_analisis_controller.dart';

class KeuanganAnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeuanganAnalisisController>(
      () => KeuanganAnalisisController(),
    );
  }
}
