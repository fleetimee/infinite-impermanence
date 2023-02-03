import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reviewer_pending_list_controller.dart';

class ReviewerPendingListView extends GetView<ReviewerPendingListController> {
  const ReviewerPendingListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReviewerPendingListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReviewerPendingListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
