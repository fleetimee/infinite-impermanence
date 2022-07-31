import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penghasilan_xtetap_controller.dart';

class PenghasilanXtetapView extends GetView<PenghasilanXtetapController> {
  const PenghasilanXtetapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: const Text('PenghasilanXtetapView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PenghasilanXtetapView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
