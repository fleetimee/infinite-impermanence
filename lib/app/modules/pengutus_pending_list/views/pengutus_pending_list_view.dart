import 'package:akm/app/modules/pengutus_pending_list/widget/pengutus_pending_list_available.dart';
import 'package:akm/app/modules/pengutus_pending_list/widget/pengutus_pending_list_empty.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengutus_pending_list_controller.dart';

class PengutusPendingListView extends GetView<PengutusPendingListController> {
  const PengutusPendingListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belum Diputus'),
        backgroundColor: Colors.pink,
      ),
      body: Obx(
        () => controller.isMyPendingPemutusanProcessing.value
            ? const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : controller.listMyPendingPemutusan.isEmpty
                ? PengutusEmptyPendingList(
                    controller: controller,
                  )
                : PengutusPendingList(
                    controller: controller,
                  ),
      ),
    );
  }
}
