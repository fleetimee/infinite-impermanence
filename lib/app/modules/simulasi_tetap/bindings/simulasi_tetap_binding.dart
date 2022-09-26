import 'package:get/get.dart';

import '../controllers/simulasi_tetap_controller.dart';

class SimulasiTetapBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SimulasiTetapController>(
        () => SimulasiTetapController(),
      )
    ];
  }
}
