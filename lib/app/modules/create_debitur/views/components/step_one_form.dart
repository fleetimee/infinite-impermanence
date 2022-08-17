// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepOneForm extends StatelessWidget {
  StepOneForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
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
          FormBuilderSearchableDropdown<String>(
            popupProps: const PopupProps.menu(showSearchBox: true),
            name: 'searchable_dropdown_online',
            onChanged: (String? newValue) {
              /* convert setState to getx */
              controller.tanggalLahirValue.value = newValue!;
            },
            filterFn: (String? value, String? filter) {
              if (value == null) {
                return false;
              }
              return value.toLowerCase().contains(filter!.toLowerCase());
            },
            items: list,
            decoration: const InputDecoration(
                labelText: 'Tempat Lahir',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.map)),
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderDateTimePicker(
            controller: controller.tanggalLahirController,
            name: 'Tanggal Lahir',
            inputType: InputType.date,
            validator: FormBuilderValidators.required(),
            decoration: const InputDecoration(
              labelText: 'Tanggal Lahir',
              labelStyle: TextStyle(fontSize: 18),
              hintText: 'Masukkan Tanggal Lahir',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
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

const kotaNama = [
  {"id": "11", "name": "ACEH"},
  {"id": "12", "name": "SUMATERA UTARA"},
  {"id": "13", "name": "SUMATERA BARAT"},
  {"id": "14", "name": "RIAU"},
  {"id": "15", "name": "JAMBI"},
  {"id": "16", "name": "SUMATERA SELATAN"},
  {"id": "17", "name": "BENGKULU"},
  {"id": "18", "name": "LAMPUNG"},
  {"id": "19", "name": "KEPULAUAN BANGKA BELITUNG"},
  {"id": "21", "name": "KEPULAUAN RIAU"},
  {"id": "31", "name": "DKI JAKARTA"},
  {"id": "32", "name": "JAWA BARAT"},
  {"id": "33", "name": "JAWA TENGAH"},
  {"id": "34", "name": "DI YOGYAKARTA"},
  {"id": "35", "name": "JAWA TIMUR"},
  {"id": "36", "name": "BANTEN"},
  {"id": "51", "name": "BALI"},
  {"id": "52", "name": "NUSA TENGGARA BARAT"},
  {"id": "53", "name": "NUSA TENGGARA TIMUR"},
  {"id": "61", "name": "KALIMANTAN BARAT"},
  {"id": "62", "name": "KALIMANTAN TENGAH"},
  {"id": "63", "name": "KALIMANTAN SELATAN"},
  {"id": "64", "name": "KALIMANTAN TIMUR"},
  {"id": "65", "name": "KALIMANTAN UTARA"},
  {"id": "71", "name": "SULAWESI UTARA"},
  {"id": "72", "name": "SULAWESI TENGAH"},
  {"id": "73", "name": "SULAWESI SELATAN"},
  {"id": "74", "name": "SULAWESI TENGGARA"},
  {"id": "75", "name": "GORONTALO"},
  {"id": "76", "name": "SULAWESI BARAT"},
  {"id": "81", "name": "MALUKU"},
  {"id": "82", "name": "MALUKU UTARA"},
  {"id": "91", "name": "PAPUA BARAT"},
  {"id": "94", "name": "PAPUA"}
];

// convert kotaNama to List<String>
List<String> list =
    kotaNama.map((kota) => kota['name']).cast<String>().toList();
