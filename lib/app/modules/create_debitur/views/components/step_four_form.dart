import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepFourForm extends StatelessWidget {
  StepFourForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.formKeys[3],
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
              items: <String>['Menikah', 'Belum Menikah']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                controller.hubunganValue.value = newValue!;
              },
              decoration: const InputDecoration(
                labelText: 'Hubungan',
                labelStyle: TextStyle(fontSize: 18),
                suffixIcon: Icon(Icons.people),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              validator: (String? value) {
                if (value == null) {
                  return 'Hubungan tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            if (controller.hubunganValue.value == 'Menikah') ...[
              inputForm(
                context,
                'Nama Pasangan',
                'Masukkan Nama Pasangan',
                const Icon(Icons.family_restroom),
                TextInputType.text,
                controller.namaPasanganController,
              ),
              const SizedBox(
                height: 30,
              ),
              inputForm(
                context,
                'Pekerjaan Pasangan',
                'Masukkan Pekerjaan Pasangan',
                const Icon(Icons.home_work_sharp),
                TextInputType.text,
                controller.pekerjaanPasanganController,
              ),
              const SizedBox(
                height: 30,
              ),
              inputForm(
                  context,
                  'NIK Pasangan',
                  'Masukkan NIK Pasangan',
                  const Icon(Icons.format_list_numbered_outlined),
                  TextInputType.number,
                  controller.nikPasanganController),
              const SizedBox(
                height: 30,
              ),
              inputForm(
                  context,
                  'Tempat Lahir Pasangan',
                  'Masukkan Tempat Lahir Pasangan',
                  const Icon(Icons.private_connectivity_rounded),
                  TextInputType.text,
                  controller.tempatLahirPasanganController),
              const SizedBox(
                height: 30,
              ),
              inputForm(
                context,
                'Tanggal Lahir Pasangan',
                'Masukkan Tanggal Lahir Pasangan',
                const Icon(Icons.brightness_high_rounded),
                TextInputType.text,
                controller.tanggalLahirPasanganController,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
