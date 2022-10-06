import 'package:akm/app/modules/list_debitur/controllers/list_debitur_controller.dart';
import 'package:get/get.dart';

class ListDebiturBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDebiturController>(
      () => ListDebiturController(),
    );
  }

  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<ListDebiturController>(
  //       () => ListDebiturController(),
  //     )
  //   ];
  // }
}
