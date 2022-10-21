import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agunan_analisis_controller.dart';

class AgunanAnalisisView extends GetView<AgunanAnalisisController> {
  const AgunanAnalisisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgunanAnalisisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AgunanAnalisisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
