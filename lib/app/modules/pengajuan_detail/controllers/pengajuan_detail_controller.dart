import 'package:akm/app/data/provider/pengajuan/pengajuan_detail.provider.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:get/get.dart';

class PengajuanDetailController extends GetxController {
  @override
  void onInit() {
    fetchPengajuanDetail();
    super.onInit();
  }

  final String pengajuanId = Get.arguments;

  var pengajuanDetail = PengajuanDetail().obs;
  var isPenganjuanDetailLoading = false.obs;

  void fetchPengajuanDetail() {
    try {
      isPenganjuanDetailLoading(true);
      PengajuanDetailProvider().fetchPengajuanDetail(pengajuanId).then((value) {
        isPenganjuanDetailLoading(false);
        pengajuanDetail(value);
      }, onError: (e) {
        isPenganjuanDetailLoading(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isPenganjuanDetailLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
