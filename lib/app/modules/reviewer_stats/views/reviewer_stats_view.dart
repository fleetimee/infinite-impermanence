import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reviewer_stats_controller.dart';

class ReviewerStatsView extends GetView<ReviewerStatsController> {
  const ReviewerStatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReviewerStatsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReviewerStatsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
