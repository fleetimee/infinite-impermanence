import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class HasilAnalisa extends StatelessWidget {
  HasilAnalisa({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: FormBuilder(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/images/karakter/calculate.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
