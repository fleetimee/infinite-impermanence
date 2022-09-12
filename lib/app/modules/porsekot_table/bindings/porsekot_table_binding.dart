// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/porsekot_table/controllers/hitung_table/table1.dart';
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
      ),
      Bind.lazyPut<Table1>(
        () => Table1(),
      ),
    ];
  }
}
