// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/karakter_analisis_controller.dart';

class KarakterAnalisisBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<KarakterAnalisisController>(
  //     () => KarakterAnalisisController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<KarakterAnalisisController>(
        () => KarakterAnalisisController(),
      )
    ];
  }
}
