import 'package:akm/app/modules/list_debitur/controllers/list_debitur_controller.dart';
import 'package:get/get.dart';

class ListDebiturBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ListDebiturController>(
        () => ListDebiturController(),
      )
    ];
  }
}
