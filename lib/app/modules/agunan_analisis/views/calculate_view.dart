import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CalculateView extends GetView {
  CalculateView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalculateView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          data.id.toString(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
