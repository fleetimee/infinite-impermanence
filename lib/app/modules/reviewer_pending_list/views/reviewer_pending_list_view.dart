import 'package:akm/app/modules/reviewer_pending_list/widget/reviewer_pending_list_available.dart';
import 'package:akm/app/modules/reviewer_pending_list/widget/reviewer_pending_list_empty.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reviewer_pending_list_controller.dart';

class ReviewerPendingListView extends GetView<ReviewerPendingListController> {
  const ReviewerPendingListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belum Direview'),
      ),
      body: Obx(() => controller.isMyPendingReviewProcessing.value
          ? const Align(
              alignment: Alignment.center,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : // check if listMyPendingReview is empty
          controller.listMyPendingReview.isEmpty
              ? EmptyPendingList(
                  controller: controller,
                )
              : ReviewerPendingList(
                  controller: controller,
                )),
    );
  }
}
