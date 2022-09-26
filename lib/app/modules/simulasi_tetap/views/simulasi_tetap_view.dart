import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/simulasi_tetap_controller.dart';

class SimulasiTetapView extends GetView<SimulasiTetapController> {
  const SimulasiTetapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimulasiTetapView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SimulasiTetapView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
