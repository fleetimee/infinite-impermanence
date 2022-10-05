import 'package:get/get.dart';

import '../controllers/insight_debitur_controller.dart';

class InsightDebiturBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<InsightDebiturController>(
        () => InsightDebiturController(),
      ),
    ];
  }
}
