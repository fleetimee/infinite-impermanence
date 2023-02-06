import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengutus_pending_stats_controller.dart';

class PengutusPendingStatsView extends GetView<PengutusPendingStatsController> {
  const PengutusPendingStatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengutusPendingStatsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PengutusPendingStatsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
