// 🐦 Flutter imports:
// ignore_for_file: file_names

import 'dart:convert';

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/bisnis_analisis/views/components/lihat_hitung_crr_bisnis.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/bisnis_analisis_controller.dart';

class LihatBisnisAnalisisView extends GetView<BisnisAnalisisController> {
  LihatBisnisAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bisnis: ${data.peminjam1}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: FormBuilder(
              key: controller.formKey,
              onChanged: () {
                controller.formKey.currentState!.save();
                debugPrint(controller.formKey.currentState!.value.toString());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Data Analisa Bisnis',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Visibility(
                    visible: false,
                    child: FormBuilderTextField(
                      name: 'debiturId',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Berikut beberapa parameter yang harus diinputkan untuk mengetahui kelayakan bisnis dari debitur.',
                    style: TextStyle(
                      color: Colors.grey,
                      overflow: TextOverflow.fade,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderDropdown(
                    name: 'nilai_omzet',
                    items: jsonDecode(controller.omzetList)
                        .map<DropdownMenuItem<int>>(
                          (item) => DropdownMenuItem<int>(
                            value: item['value'],
                            child: Text(
                              item['label'],
                            ),
                          ),
                        )
                        .toList(),
                    initialValue: data.analisaBisnis.nilaiOmzet,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Omzet Penjualan',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                    name: 'nilai_harga_bersaing',
                    enabled: false,
                    items: jsonDecode(controller.hargaBersaingList)
                        .map<DropdownMenuItem<int>>(
                          (item) => DropdownMenuItem<int>(
                            value: item['value'],
                            child: Text(
                              item['label'],
                            ),
                          ),
                        )
                        .toList(),
                    initialValue: data.analisaBisnis.nilaiHargaBersaing,
                    decoration: InputDecoration(
                      labelText: 'Harga Bersaing',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // onChanged: (int? value) {
                    //   controller.hargaBersaing.value = value!;
                    //   print(controller.hargaBersaing.value);
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                    decoration: InputDecoration(
                      labelText: 'Persaingan Pasar',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    enabled: false,
                    initialValue: data.analisaBisnis.nilaiPersaingan,
                    items: jsonDecode(controller.persainganPasarList)
                        .map<DropdownMenuItem<int>>(
                          (item) => DropdownMenuItem<int>(
                            value: item['value'],
                            child: Text(
                              item['label'],
                            ),
                          ),
                        )
                        .toList(),
                    name: 'nilai_persaingan',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                    initialValue: data.analisaBisnis.nilaiLokasiUsaha,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Lokasi Usaha',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: jsonDecode(controller.lokasiPasarList)
                        .map<DropdownMenuItem<int>>(
                          (item) => DropdownMenuItem<int>(
                            value: item['value'],
                            child: Text(
                              item['label'],
                            ),
                          ),
                        )
                        .toList(),
                    name: 'nilai_lokasi',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                    initialValue: data.analisaBisnis.nilaiProduktivitas,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Produktivitas (%) thd kap terpasang/omzet',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: jsonDecode(controller.kapasitasTerpasanList)
                        .map<DropdownMenuItem<int>>(
                          (item) => DropdownMenuItem<int>(
                            value: item['value'],
                            child: Text(
                              item['label'],
                            ),
                          ),
                        )
                        .toList(),
                    name: 'nilai_produktivitas',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderDropdown(
                    enabled: false,
                    initialValue: data.analisaBisnis.nilaiKualitas,
                    decoration: InputDecoration(
                      labelText: 'Kwalitas produk/jasa',
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: jsonDecode(controller.ratingList)
                        .map<DropdownMenuItem<int>>(
                          (item) => DropdownMenuItem<int>(
                            value: item['value'],
                            child: Text(
                              item['label'],
                            ),
                          ),
                        )
                        .toList(),
                    name: 'nilai_kualitas',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextField(
                    controller: controller.deskripsi = TextEditingController(
                      text: data.analisaBisnis.deskripsiBisnis,
                    ),
                    enabled: false,
                    textAlign: TextAlign.start,
                    name: 'deskripsi_bisnis',
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi Bisnis Pemohon',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 7,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text(
                      "Lihat CRR",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: secondaryColor,
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                        maximumSize: const Size.fromWidth(double.infinity),
                        fixedSize: const Size(500, 50)),
                    onPressed: () {
                      showBarModalBottomSheet(
                        backgroundColor: secondaryColor,
                        bounce: true,
                        context: context,
                        builder: (context) {
                          return LihatHitungCrrBisnis();
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
