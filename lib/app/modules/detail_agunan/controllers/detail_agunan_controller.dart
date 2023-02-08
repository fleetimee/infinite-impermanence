import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';

class DetailAgunanController extends GetxController {
  DebiturInsight args = Get.arguments;

  final PopupController popupLayerController = PopupController();
}
