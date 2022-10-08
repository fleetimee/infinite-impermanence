import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_peralatan_controller.dart';

class ListAgunanPeralatanView extends GetView<ListAgunanPeralatanController> {
  const ListAgunanPeralatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanPeralatanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanPeralatanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
