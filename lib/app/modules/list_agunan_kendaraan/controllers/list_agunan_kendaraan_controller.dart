import 'package:akm/app/data/provider/agunan/agunan_kendaraan/agunan_kendaraaan.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:get/get.dart';

class ListAgunanKendaraanController extends GetxController {
  final agunanId = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getAllAgunanKendaraan(agunanId.id);
  }

  final isAgunanKendaraanProcessing = false.obs;

  var listAgunanKendaraan = List<FormKendaraan>.empty(growable: true).obs;

  void getAllAgunanKendaraan(int id) {
    try {
      isAgunanKendaraanProcessing(true);
      AgunanKendaraanProvider().fetchAgunanKendaraan(id).then((resp) {
        isAgunanKendaraanProcessing(false);
        listAgunanKendaraan.addAll(resp);
      }, onError: (e) {
        isAgunanKendaraanProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isAgunanKendaraanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
