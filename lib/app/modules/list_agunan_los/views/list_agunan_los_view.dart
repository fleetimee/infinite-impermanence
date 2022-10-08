import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_los_controller.dart';

class ListAgunanLosView extends GetView<ListAgunanLosController> {
  const ListAgunanLosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanLosView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanLosView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
