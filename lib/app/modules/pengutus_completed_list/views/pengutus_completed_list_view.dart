import 'package:akm/app/modules/pengutus_completed_list/widget/pengutus_completed_list_available.dart';
import 'package:akm/app/modules/pengutus_completed_list/widget/pengutus_completed_list_empty.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengutus_completed_list_controller.dart';

class PengutusCompletedListView
    extends GetView<PengutusCompletedListController> {
  const PengutusCompletedListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudah Diputuskan'),
        backgroundColor: Colors.pink,
      ),
      body: Obx(
        () => controller.isMyCompletedPemutusanProcessing.value
            ? const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                ),
              )
            : // check if listMyCompletedReview is empty
            controller.listMyCompletedPemutusan.isEmpty
                ? EmptyCompletedListPengutus(
                    controller: controller,
                  )
                : PengutusCompletedList(
                    controller: controller,
                  ),
      ),
    );
  }
}
