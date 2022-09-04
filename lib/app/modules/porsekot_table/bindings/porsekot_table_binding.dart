import 'package:get/get.dart';

import '../controllers/porsekot_table_controller.dart';

class PorsekotTableBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<PorsekotTableController>(
  //     () => PorsekotTableController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PorsekotTableController>(
        () => PorsekotTableController(),
      )
    ];
  }
}
