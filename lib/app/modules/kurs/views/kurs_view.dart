import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kurs_controller.dart';

class KursView extends GetView<KursController> {
  const KursView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KursView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KursView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
