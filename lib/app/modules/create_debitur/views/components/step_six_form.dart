// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
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
          // inputForm(
          //   context,
          //   'Provinsi',
          //   'Masukkan Provinsi',
          //   const Icon(Icons.location_city),
          //   TextInputType.text,
          //   controller.provinsiController,
          // ),
          FormBuilderSearchableDropdown<String>(
            popupProps: const PopupProps.menu(showSearchBox: true),
            name: 'Provinsi',
            onChanged: (String? newValue) {
              /* convert setState to getx */
              controller.provinsiValue.value = newValue!;
            },
            filterFn: (String? value, String? filter) {
              if (value == null) {
                return false;
              }
              return value.toLowerCase().contains(filter!.toLowerCase());
            },
            items: provinsiList,
            decoration: const InputDecoration(
                labelText: 'Provinsi',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.map)),
          ),
          const SizedBox(
            height: 30,
          ),
          // inputForm(
          //   context,
          //   'Kabupaten',
          //   'Masukkan Kabupaten',
          //   const Icon(Icons.share_location_outlined),
          //   TextInputType.text,
          //   controller.kabupatenController,
          // ),
          FormBuilderSearchableDropdown<String>(
            popupProps: const PopupProps.menu(showSearchBox: true),
            name: 'Kabupaten',
            onChanged: (String? newValue) {
              /* convert setState to getx */
              controller.kabupatenValue.value = newValue!;
            },
            filterFn: (String? value, String? filter) {
              if (value == null) {
                return false;
              }
              return value.toLowerCase().contains(filter!.toLowerCase());
            },
            items: kabupaten,
            decoration: const InputDecoration(
                labelText: 'Kabupaten',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.map)),
          ),
          const SizedBox(
            height: 30,
          ),
          // inputForm(
          //   context,
          //   'Kecamatan',
          //   'Masukkan Kecamatan',
          //   const Icon(Icons.location_city),
          //   TextInputType.text,
          //   controller.kecamatanController,
          // ),
          FormBuilderSearchableDropdown<String>(
            popupProps: const PopupProps.menu(showSearchBox: true),
            name: 'Kecamatan',
            onChanged: (String? newValue) {
              /* convert setState to getx */
              controller.kecamatanValue.value = newValue!;
            },
            filterFn: (String? value, String? filter) {
              if (value == null) {
                return false;
              }
              return value.toLowerCase().contains(filter!.toLowerCase());
            },
            items: kecamatan,
            decoration: const InputDecoration(
                labelText: 'Kecamatan',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.map)),
          ),
          const SizedBox(
            height: 30,
          ),
          // inputForm(
          //   context,
          //   'Kelurahan',
          //   'Masukkan Kelurahan',
          //   const Icon(Icons.location_city),
          //   TextInputType.text,
          //   controller.kelurahanController,
          // ),
          FormBuilderSearchableDropdown<String>(
            popupProps: const PopupProps.menu(showSearchBox: true),
            name: 'Kelurahan',
            onChanged: (String? newValue) {
              /* convert setState to getx */
              controller.kelurahanValue.value = newValue!;
            },
            filterFn: (String? value, String? filter) {
              if (value == null) {
                return false;
              }
              return value.toLowerCase().contains(filter!.toLowerCase());
            },
            items: kelurahan,
            decoration: const InputDecoration(
                labelText: 'Kelurahan',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.map)),
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

const provinsi = [
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

// convert provinsi to List<String>
List<String> provinsiList =
    provinsi.map((e) => e['name']).cast<String>().toList();

// Make list kabupaten in Yogyakarta
const kabupaten = [
  'Bantul',
  'Gunungkidul',
  'Kulonprogo',
  'Sleman',
  'Wonosari',
  'Kota Yogyakarta'
];

// Make list kecamatan in Sleman
const kecamatan = [
  'Danurejan',
  'Gondang',
  'Jatimulyo',
  'Kaliwates',
  'Kepoh',
  'Klari',
];

const kelurahan = [
  'Condongcatur',
  'Gading',
  'Gedongteng',
];
