import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditNeracaView extends GetView {
  const EditNeracaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditNeracaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditNeracaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
