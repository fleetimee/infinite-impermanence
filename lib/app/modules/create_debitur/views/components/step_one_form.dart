import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepOneForm extends StatelessWidget {
  StepOneForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeys[0],
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'NIK',
            'Masukkan NIK',
            const Icon(Icons.sim_card),
            TextInputType.number,
            controller.nikController,
          ),

          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Nama',
            'Masukkan Nama',
            const Icon(Icons.person),
            TextInputType.text,
            controller.namaController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Nama Ibu',
            'Masukkan Nama Ibu',
            const Icon(Icons.woman_rounded),
            TextInputType.text,
            controller.namaIbuController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Alamat',
            'Masukkan Alamat',
            const Icon(Icons.home),
            TextInputType.text,
            controller.alamatController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Tempat Lahir',
            'Masukkan Tempat Lahir',
            const Icon(Icons.location_city),
            TextInputType.text,
            controller.tempatLahirController,
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm(
            context,
            'Tanggal Lahir',
            'Masukkan Tanggal Lahir',
            const Icon(Icons.calendar_today),
            TextInputType.text,
            controller.tanggalLahirController,
          ),
          const SizedBox(
            height: 30,
          ),
          // Add gender dropdown
          DropdownButtonFormField(
            items: <String>['Laki - Laki', 'Perempuan']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              /* convert setState to getx */
              controller.genderValue.value = newValue!;
            },
            decoration: const InputDecoration(
              labelText: 'Jenis Kelamin',
              labelStyle: TextStyle(fontSize: 18),
              suffixIcon: Icon(Icons.female),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            validator: (String? value) {
              if (value == null) {
                return 'Jenis Kelamin harus diisi';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          // Add religion dropdown
          DropdownButtonFormField(
            items: <String>['Islam', 'Kristen', 'Katolik', 'Hindu', 'Budha']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              //convert setState to getx
              controller.agamaController.value = newValue!;
            },
            decoration: const InputDecoration(
              labelText: 'Agama',
              labelStyle: TextStyle(fontSize: 18),
              suffixIcon: Icon(Icons.mosque),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            validator: (String? value) {
              if (value == null) {
                return 'Agama harus diisi';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
