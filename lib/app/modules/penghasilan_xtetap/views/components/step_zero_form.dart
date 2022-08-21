// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/penghasilan_xtetap/controllers/penghasilan_xtetap_controller.dart';

class StepZeroForm extends StatelessWidget {
  StepZeroForm({Key? key}) : super(key: key);

  final controller = Get.put(PenghasilanXtetapController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKeys[0],
      child: Column(
        children: <Widget>[
          const Text(
            'Pilih Debitur',
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
            'Pilih Debitur yang ingin di ajukan untuk pengajuan penghasilan tetap',
            style: TextStyle(
              color: Colors.grey,
              overflow: TextOverflow.fade,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FormBuilderDropdown(
            decoration: const InputDecoration(
              labelText: 'Pilih Debitur',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(fontSize: 18),
            ),
            name: 'Nama Debitur',
            items: ['Item 1', 'Item 2', 'Item 3'].map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

const allDebiturs = [
  'Novian Andika',
  'Lussy Ika',
  'Meliya Aja',
  'Monkey D Luffy',
];
