import 'package:akm/app/data/provider/user/pengajuan_debitur.provider.dart';
import 'package:get/get.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';

class PengutusPendingListController extends GetxController {
  @override
  void onInit() {
    getMyPendingPemutusan();
    super.onInit();
  }

  var uid = Get.arguments;

  List listMyPendingPemutusan = <Pengajuan>[].obs;
  var isMyPendingPemutusanProcessing = false.obs;

  void getMyPendingPemutusan() async {
    try {
      isMyPendingPemutusanProcessing(true);
      MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
        isMyPendingPemutusanProcessing(false);
        final finalList = resp.pengajuan
            ?.where((element) => element.status == 'REVIEWED')
            .toList();

        listMyPendingPemutusan.clear();
        listMyPendingPemutusan = finalList ?? [];
      }, onError: (err) {
        isMyPendingPemutusanProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMyPendingPemutusanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
