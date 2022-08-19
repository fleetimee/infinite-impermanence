// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/debitur_real_controller.dart';

class DebiturRealView extends GetView<DebiturRealController> {
  const DebiturRealView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DebiturRealView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DebiturRealView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
