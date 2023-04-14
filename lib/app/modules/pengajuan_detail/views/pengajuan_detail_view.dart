// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/pengajuan_detail/widget/pengajuan_detail_detail_button.dart';
import 'package:akm/app/modules/pengajuan_detail/widget/pengajuan_detail_info_debitur_card.dart';
import 'package:akm/app/modules/pengajuan_detail/widget/pengajuan_detail_info_header.dart';
import 'package:akm/app/modules/pengajuan_detail/widget/pengajuan_detail_info_officer_card.dart';
import 'package:akm/app/modules/pengajuan_detail/widget/pengajuan_detail_timeline_view.dart';
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../controllers/pengajuan_detail_controller.dart';

class PengajuanDetailView extends GetView<PengajuanDetailController> {
  const PengajuanDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => controller.isPenganjuanDetailLoading.value
              ? const Text('Loading...')
              : Text('Tracking: ${controller.pengajuanDetail.value.id!}'),
        ),
      ),
      body: Column(
        children: [
          DetailPengajuanInfoHeader(
            controller: controller,
          ),
          DetailPengajuanDebiturInfo(
            controller: controller,
          ),
          const SizedBox(
            height: 5,
          ),
          DetailPengajuanOfficerInfo(
            controller: controller,
          ),
          const SizedBox(
            height: 5,
          ),
          DetailPengajuanTimelineView(
            controller: controller,
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavBarButton(
            text: 'Detail',
            icon: Icons.arrow_forward_ios,
            onPressed: controller.isPenganjuanDetailLoading.value
                ? null
                : () {
                    showMaterialModalBottomSheet(
                      backgroundColor: secondaryColor,
                      context: context,
                      builder: (context) {
                        return PengajuanDetailVeryDetailed(
                          controller: controller,
                        );
                      },
                    );
                  },
          )),
    );
  }
}
