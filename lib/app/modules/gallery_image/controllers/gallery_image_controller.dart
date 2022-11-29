import 'package:akm/app/data/provider/media/save_mediaprovider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:get/get.dart';

class GalleryImageController extends GetxController {
  @override
  void onInit() {
    getImages(debiturId.id);
    super.onInit();
  }

  var imageList = List<Upload>.empty(growable: true).obs;

  final isImageLoading = false.obs;

  final isImageListView = false.obs;

  final debiturId = Get.arguments;

  void getImages(int id) {
    try {
      isImageLoading(true);
      MediaProvider().fetchMedia(id).then((resp) {
        isImageLoading(false);
        imageList.addAll(resp);
      }, onError: (e) {
        isImageLoading(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isImageLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
