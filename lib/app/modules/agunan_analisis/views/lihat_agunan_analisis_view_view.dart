import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LihatAgunanAnalisisViewView extends GetView {
  const LihatAgunanAnalisisViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LihatAgunanAnalisisViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LihatAgunanAnalisisViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
