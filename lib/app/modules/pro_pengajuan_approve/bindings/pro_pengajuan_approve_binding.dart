import 'package:get/get.dart';

import '../controllers/pro_pengajuan_approve_controller.dart';

class ProPengajuanApproveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProPengajuanApproveController>(
      () => ProPengajuanApproveController(),
    );
  }
}
