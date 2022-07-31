import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepSixForm extends StatelessWidget {
  StepSixForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeys[5],
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Provinsi',
            'Masukkan Provinsi',
            const Icon(Icons.location_city),
            TextInputType.text,
            controller.provinsiController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Kabupaten',
            'Masukkan Kabupaten',
            const Icon(Icons.share_location_outlined),
            TextInputType.text,
            controller.kabupatenController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Kecamatan',
            'Masukkan Kecamatan',
            const Icon(Icons.location_city),
            TextInputType.text,
            controller.kecamatanController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Kelurahan',
            'Masukkan Kelurahan',
            const Icon(Icons.location_city),
            TextInputType.text,
            controller.kelurahanController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'RT',
            'Masukkan RT',
            const Icon(Icons.location_city),
            TextInputType.number,
            controller.rtController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'RW',
            'Masukkan RW',
            const Icon(Icons.location_city),
            TextInputType.number,
            controller.rwController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Kode Pos',
            'Masukkan Kode Pos',
            const Icon(Icons.location_city),
            TextInputType.number,
            controller.kodePosController,
          ),
        ],
      ),
    );
  }
}
