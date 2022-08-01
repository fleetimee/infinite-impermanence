import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:akm/app/modules/penghasilan_tetap/controllers/penghasilan_tetap_controller.dart';

class StepTwoForm extends StatelessWidget {
  StepTwoForm({Key? key}) : super(key: key);

  final controller = Get.put(PenghasilanTetapController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKeys[1],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Detail Penghasilan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Ditahap ini, anda diharuskan mengisi Total penghasilan pemohon minus potongan gaji.',
            style: TextStyle(
              color: Colors.grey,
              overflow: TextOverflow.fade,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FormBuilderTextField(
            controller: controller.penghasilanPemohonController,
            name: 'Penghasilan Pemohon',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '...',
              labelText: 'Penghasilan Pemohon',
              prefixIcon: Icon(Icons.monetization_on_outlined),
              prefixText: 'Rp',
              hintTextDirection: TextDirection.rtl,
            ),
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            controller: controller.potonganGajiController,
            name: 'Potongan Gaji',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '...',
              labelText: 'Potongan Gaji',
              prefixIcon: Icon(Icons.monetization_on),
              prefixText: 'Rp',
              hintTextDirection: TextDirection.rtl,
            ),
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Klik tombol "Refresh" untuk menghitung sisa penghasilan anda.',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            readOnly: true,
            controller: controller.sisaPenghasilanController,
            name: 'Total Penghasilan',
            decoration: InputDecoration(
              hintText: 'Sisa Penghasilan',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.account_balance_outlined),
              prefixText: 'Rp',
              suffixIcon: IconButton(
                color: primaryColor,
                icon: const Icon(Icons.refresh_sharp),
                onPressed: () {
                  controller.calCalculateSisaPenghasilan();
                },
              ),
              hintTextDirection: TextDirection.rtl,
            ),
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Nama Petugas Penanggung Jawab',
            controller: controller.namaPejabatPenanggungJawabController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '...',
              labelText: 'Penanggung Jawab',
              prefixIcon: Icon(Icons.person_outline),
              hintTextDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Jabatan Petugas Penanggung Jawab',
            controller: controller.jabatanPejabatPenanggungJawabController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '...',
              labelText: 'Jabatan Penanggung Jawab',
              prefixIcon: Icon(Icons.person_outline),
              hintTextDirection: TextDirection.rtl,
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Nama Pejabat Pemotong Gaji',
            controller: controller.namaPejabatPemotongGajiController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '...',
              labelText: 'Nama Pejabat Pemotong Gaji',
              prefixIcon: Icon(Icons.person_outline),
              hintTextDirection: TextDirection.rtl,
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Jabatan Pejabat Pemotong Gaji',
            controller: controller.jabatanPejabatPemotongGajiController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '...',
              labelText: 'Jabatan Pejabat Pemotong Gaji',
              prefixIcon: Icon(Icons.person_outline),
              hintTextDirection: TextDirection.rtl,
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
