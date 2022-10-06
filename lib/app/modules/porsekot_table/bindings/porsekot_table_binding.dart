// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/porsekot_table_controller.dart';

// 🌎 Project imports:

class PorsekotTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PorsekotTableController>(
      () => PorsekotTableController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<PorsekotTableController>(
  //       () => PorsekotTableController(),
  //     ),
  //     Bind.lazyPut<Table1>(
  //       () => Table1(),
  //     ),
  //   ];
  // }
}
