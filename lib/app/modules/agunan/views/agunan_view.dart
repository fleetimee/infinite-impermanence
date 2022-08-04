import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

import '../controllers/agunan_controller.dart';

class AgunanView extends GetView<AgunanController> {
  const AgunanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: const Text('Agunan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: FormBuilder(
            child: Column(
              children: <Widget>[
                GifView.asset(
                  'assets/images/agunan/header.gif',
                  frameRate: 30,
                  fit: BoxFit.cover,
                  loop: false,
                  height: 400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
