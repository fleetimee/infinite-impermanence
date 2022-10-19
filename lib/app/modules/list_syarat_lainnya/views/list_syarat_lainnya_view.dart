import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_syarat_lainnya_controller.dart';

class ListSyaratLainnyaView extends GetView<ListSyaratLainnyaController> {
  const ListSyaratLainnyaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListSyaratLainnyaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListSyaratLainnyaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
