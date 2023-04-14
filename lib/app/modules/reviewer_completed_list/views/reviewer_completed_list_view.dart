import 'package:akm/app/modules/reviewer_completed_list/widget/reviewer_completed_list_available.dart';
import 'package:akm/app/modules/reviewer_completed_list/widget/reviewer_completed_list_empty.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reviewer_completed_list_controller.dart';

class ReviewerCompletedListView
    extends GetView<ReviewerCompletedListController> {
  const ReviewerCompletedListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudah Direview'),
      ),
      body: Obx(
        () => controller.isMyCompletedReviewProcessing.value
            ? const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : controller.listMyCompletedReview.isEmpty
                ? EmptyCompletedList(
                    controller: controller,
                  )
                : ReviewerCompletedList(
                    controller: controller,
                  ),
      ),
    );
  }
}
