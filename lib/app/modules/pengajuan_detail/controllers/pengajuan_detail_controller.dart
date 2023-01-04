// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/pengajuan/pengajuan_detail.provider.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:intl/intl.dart';

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

  String formatDate(String date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final DateTime dateTime = formatter.parse(date);

    return DateFormat('dd MMMM yyyy').format(dateTime);
  }
}
