import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepTwoForm extends StatelessWidget {
  StepTwoForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeys[1],
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'No. HP',
            'Masukkan No. HP',
            const Icon(Icons.phone),
            TextInputType.number,
            controller.noHpIndonesiaController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'No Selular',
            'Masukkan No Selular',
            const Icon(
              Icons.phone_android,
            ),
            TextInputType.number,
            controller.noSelularIndonesiaController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Email',
            'Masukkan Email',
            const Icon(Icons.email),
            TextInputType.text,
            controller.emailController,
          ),
        ],
      ),
    );
  }
}
