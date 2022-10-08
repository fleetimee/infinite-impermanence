import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_lainnya_controller.dart';

class ListAgunanLainnyaView extends GetView<ListAgunanLainnyaController> {
  const ListAgunanLainnyaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanLainnyaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanLainnyaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
