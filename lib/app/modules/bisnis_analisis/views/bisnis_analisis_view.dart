// ignore_for_file: avoid_print

// 🐦 Flutter imports:
import 'dart:convert';

import 'package:akm/app/modules/bisnis_analisis/views/components/input/keterangan_omzet.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/bisnis_analisis/views/components/hitung_crr_bisnis.dart';
import 'package:akm/app/widget/color_button.dart';
import '../controllers/bisnis_analisis_controller.dart';

class BisnisAnalisisView extends GetView<BisnisAnalisisController> {
  const BisnisAnalisisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Analysis'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Obx(
              () => FormBuilder(
                key: controller.formKey,
                onChanged: () {
                  controller.formKey.currentState!.save();
                  debugPrint(controller.formKey.currentState!.value.toString());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
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
                      decoration: InputDecoration(
                        labelText: 'Omzet Penjualan',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (int? value) {
                        controller.omzetPenjualan.value = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    KeteranganOmzet(),
                    const SizedBox(
                      height: 8,
                    ),
                    FormBuilderDropdown(
                      name: 'nilai_harga_bersaing',
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
                      decoration: InputDecoration(
                        labelText: 'Harga Bersaing',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (int? value) {
                        controller.hargaBersaing.value = value!;
                        print(controller.hargaBersaing.value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        if (controller.hargaBersaing.value == 90)
                          Text(
                            'Score ${controller.hargaBersaing.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.hargaBersaing.value == 80)
                          Text(
                            'Score ${controller.hargaBersaing.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.hargaBersaing.value == 70)
                          Text(
                            'Score ${controller.hargaBersaing.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.hargaBersaing.value == 60)
                          Text(
                            'Score ${controller.hargaBersaing.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.hargaBersaing.value == 50)
                          Text(
                            'Score ${controller.hargaBersaing.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FormBuilderDropdown(
                      onChanged: (int? value) {
                        controller.persainganPasar.value = value!;
                        print(controller.persainganPasar.value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Persaingan Pasar',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        if (controller.persainganPasar.value == 90)
                          Text(
                            'Score ${controller.persainganPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (controller.persainganPasar.value == 80)
                          Text(
                            'Score ${controller.persainganPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (controller.persainganPasar.value == 70)
                          Text(
                            'Score ${controller.persainganPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (controller.persainganPasar.value == 60)
                          Text(
                            'Score ${controller.persainganPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (controller.persainganPasar.value == 50)
                          Text(
                            'Score ${controller.persainganPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FormBuilderDropdown(
                      onChanged: (int? value) {
                        controller.lokasiPasar.value = value!;
                        print(controller.lokasiPasar.value);
                      },
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
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        if (controller.lokasiPasar.value == 90)
                          Text(
                            'Score ${controller.lokasiPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.lokasiPasar.value == 80)
                          Text(
                            'Score ${controller.lokasiPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.lokasiPasar.value == 70)
                          Text(
                            'Score ${controller.lokasiPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.lokasiPasar.value == 50)
                          Text(
                            'Score ${controller.lokasiPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.lokasiPasar.value == 40)
                          Text(
                            'Score ${controller.lokasiPasar.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FormBuilderDropdown(
                      onChanged: (int? value) {
                        controller.kapasitasTerpasan.value = value!;
                        print(controller.kapasitasTerpasan.value);
                      },
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
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        if (controller.kapasitasTerpasan.value == 90)
                          Text(
                            'Score ${controller.kapasitasTerpasan.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.kapasitasTerpasan.value == 80)
                          Text(
                            'Score ${controller.kapasitasTerpasan.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.kapasitasTerpasan.value == 70)
                          Text(
                            'Score ${controller.kapasitasTerpasan.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.kapasitasTerpasan.value == 60)
                          Text(
                            'Score ${controller.kapasitasTerpasan.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.kapasitasTerpasan.value == 50)
                          Text(
                            'Score ${controller.kapasitasTerpasan.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FormBuilderDropdown(
                      onChanged: (int? value) {
                        controller.rating.value = value!;
                        print(controller.rating.value);
                      },
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
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        if (controller.rating.value == 90)
                          Text(
                            'Score ${controller.rating.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.rating.value == 80)
                          Text(
                            'Score ${controller.rating.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.rating.value == 70)
                          Text(
                            'Score ${controller.rating.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.rating.value == 60)
                          Text(
                            'Score ${controller.rating.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (controller.rating.value == 50)
                          Text(
                            'Score ${controller.rating.value}',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FormBuilderTextField(
                      controller: controller.deskripsi,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                      name: 'deskripsi_bisnis',
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi Bisnis Pemohon',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    colorButton(
                      context,
                      'Hitung CRR',
                      () => showBarModalBottomSheet(
                        backgroundColor: secondaryColor,
                        bounce: true,
                        context: context,
                        builder: (context) {
                          controller.hasilHitungCrrBisnis();
                          return HitungCrrBisnis();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
