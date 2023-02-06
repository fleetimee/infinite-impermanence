import 'package:get/get.dart';
import 'package:akm/app/data/provider/user/pengajuan_debitur.provider.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';

class PengutusCompletedListController extends GetxController {
  @override
  void onInit() {
    getMyCompletedPutusan();
    super.onInit();
  }

  var uid = Get.arguments;

  var isMyCompletedPemutusanProcessing = false.obs;
  List listMyCompletedPemutusan = <Pengajuan>[].obs;

  void getMyCompletedPutusan() async {
    try {
      isMyCompletedPemutusanProcessing(true);
      MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
        isMyCompletedPemutusanProcessing(false);
        final finalList = resp.pengajuan
            ?.where((element) =>
                element.status == 'DONE' || element.status == 'REJECTED')
            .toList();

        // sort desc by tglPutusan
        finalList?.sort((a, b) => b.tglPemutusan!.compareTo(a.tglPemutusan!));

        listMyCompletedPemutusan.clear();
        listMyCompletedPemutusan = finalList ?? [];
      }, onError: (err) {
        isMyCompletedPemutusanProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMyCompletedPemutusanProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
