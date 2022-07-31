import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepFiveForm extends StatelessWidget {
  StepFiveForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeys[4],
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          inputForm(
              context,
              'Instansi',
              'Masukkan Nama Instansi',
              const Icon(Icons.business),
              TextInputType.text,
              controller.namaInstansiController),
          const SizedBox(
            height: 30,
          ),
          inputForm(
              context,
              'Pekerjaan',
              'Masukkan Pekerjaan',
              const Icon(Icons.work),
              TextInputType.text,
              controller.pekerjaanController),
        ],
      ),
    );
  }
}
