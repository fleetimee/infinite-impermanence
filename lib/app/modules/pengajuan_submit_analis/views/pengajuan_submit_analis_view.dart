import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengajuan_submit_analis_controller.dart';

class PengajuanSubmitAnalisView
    extends GetView<PengajuanSubmitAnalisController> {
  const PengajuanSubmitAnalisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengajuanSubmitAnalisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PengajuanSubmitAnalisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
