// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/debitur_detail_banget_controller.dart';

class DebiturDetailBangetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebiturDetailBangetController>(
      () => DebiturDetailBangetController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<DebiturDetailBangetController>(
  //       () => DebiturDetailBangetController(),
  //     )
  //   ];
  // }
}
