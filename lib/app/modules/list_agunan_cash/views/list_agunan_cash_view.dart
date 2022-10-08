import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_cash_controller.dart';

class ListAgunanCashView extends GetView<ListAgunanCashController> {
  const ListAgunanCashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanCashView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanCashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
