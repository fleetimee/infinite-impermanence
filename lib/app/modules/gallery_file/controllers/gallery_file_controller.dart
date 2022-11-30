import 'package:akm/app/data/provider/media/save_mediaprovider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:get/get.dart';

class GalleryFileController extends GetxController {
  @override
  void onInit() {
    getFiles(debiturId.id);
    super.onInit();
  }

  var fileList = List<Upload>.empty(growable: true).obs;

  final isFileLoading = false.obs;

  final debiturId = Get.arguments;

  void getFiles(int id) {
    try {
      isFileLoading(true);
      MediaProvider().fetchDocs(id).then((resp) {
        isFileLoading(false);
        fileList.addAll(resp);
      }, onError: (e) {
        isFileLoading(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isFileLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
