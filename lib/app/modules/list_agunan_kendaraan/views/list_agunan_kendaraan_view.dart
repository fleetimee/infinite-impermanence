import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_kendaraan_controller.dart';

class ListAgunanKendaraanView extends GetView<ListAgunanKendaraanController> {
  const ListAgunanKendaraanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanKendaraanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanKendaraanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
