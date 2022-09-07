// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/pro_pengajuan_approve_controller.dart';

class ProPengajuanApproveBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<ProPengajuanApproveController>(
  //     () => ProPengajuanApproveController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ProPengajuanApproveController>(
        () => ProPengajuanApproveController(),
      )
    ];
  }
}
