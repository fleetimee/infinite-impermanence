// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_tanah_bangunan_controller.dart';

class ListAgunanTanahBangunanView
    extends GetView<ListAgunanTanahBangunanController> {
  const ListAgunanTanahBangunanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanTanahBangunanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListAgunanTanahBangunanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
