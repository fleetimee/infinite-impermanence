import 'package:get/get.dart';

import '../controllers/insight_debitur_controller.dart';

class InsightDebiturBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsightDebiturController>(
      () => InsightDebiturController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<InsightDebiturController>(
  //       () => InsightDebiturController(),
  //     ),
  //   ];
  // }
}
