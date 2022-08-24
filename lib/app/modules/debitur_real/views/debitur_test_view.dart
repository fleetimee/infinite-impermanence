import 'package:akm/app/models/debtor_details.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DebiturTestDetailsView extends GetView<DebiturRealController> {
  DebiturTestDetailsView(
      {Key? key, int? id, required DebtorDetails debtorDetails})
      : super(key: key);

  final data = Get.arguments;

  @override
  void onInit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DebiturTestView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DebiturTestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
