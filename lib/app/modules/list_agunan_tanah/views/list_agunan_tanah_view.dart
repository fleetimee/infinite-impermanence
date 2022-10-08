import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_tanah_controller.dart';

class ListAgunanTanahView extends GetView<ListAgunanTanahController> {
  const ListAgunanTanahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanTanahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanTanahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
