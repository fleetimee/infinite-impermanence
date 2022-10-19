import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:get/get.dart';

class ListSyaratLainnyaController extends GetxController {
  final data = Get.arguments;

  final debiturController = Get.put(InsightDebiturController());

  final isSyaratLainInputProcessing = false.obs;
}
