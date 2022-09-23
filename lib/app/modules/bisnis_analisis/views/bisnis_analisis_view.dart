// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../controllers/bisnis_analisis_controller.dart';
import 'components/hitung_crr_bisnis.dart';

// 🌎 Project imports:
 import '../../../common/style.dart';

class BisnisAnalisisView extends GetView<BisnisAnalisisController> {
  BisnisAnalisisView({Key? key}) : super(key: key);

  final debiturId = Get.arguments;

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
                    debugPrint(
                        controller.formKey.currentState!.value.toString());
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
                          controller: controller.debiturId =
                              TextEditingController(text: debiturId.toString()),
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
                      keteranganOmzet(),
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
                      Obx(
                        () => keteranganHargaBersaing(),
                      ),
                      const SizedBox(
                        height: 20,
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
                      Obx(
                        () => keteranganPersainganPasar(),
                      ),
                      const SizedBox(
                        height: 20,
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
                      Obx(
                        () => lokasiPasar(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderDropdown(
                        onChanged: (int? value) {
                          controller.kapasitasTerpasan.value = value!;
                          print(controller.kapasitasTerpasan.value);
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Produktivitas (%) thd kap terpasang/omzet',
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
                      Obx(
                        () => kapasitasTerpasan(),
                      ),
                      const SizedBox(
                        height: 20,
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
                      rating(),
                      const SizedBox(
                        height: 20,
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
                      OutlinedButton.icon(
                        icon: const Icon(Icons.check),
                        label: const Text(
                          "Hitung CRR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
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
                              controller.hasilHitungCrrBisnis();
                              return HitungCrrBisnis();
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Column keteranganHargaBersaing() {
    return Column(
      children: [
        Center(
          child: Text(
            controller.hargaBersaing.value == 90
                ? 'Score 90'
                : controller.hargaBersaing.value == 80
                    ? 'Score 80'
                    : controller.hargaBersaing.value == 70
                        ? 'Score 70'
                        : controller.hargaBersaing.value == 60
                            ? 'Score 60'
                            : controller.hargaBersaing.value == 50
                                ? 'Score 50'
                                : '',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Column(
            children: [
              controller.hargaBersaing.value == 90
                  ? FormBuilderTextField(
                      name: 'keteranganHargaBersaing',
                      controller: controller.hargaBersaingKeterangan =
                          TextEditingController(text: 'Lebih murah diatas 10%'),
                    )
                  : controller.hargaBersaing.value == 80
                      ? FormBuilderTextField(
                          name: 'keteranganHargaBersaing',
                          controller: controller.hargaBersaingKeterangan =
                              TextEditingController(
                                  text: 'lebih murah 5 - 10%'),
                        )
                      : controller.hargaBersaing.value == 70
                          ? FormBuilderTextField(
                              name: 'keteranganHargaBersaing',
                              controller: controller.hargaBersaingKeterangan =
                                  TextEditingController(
                                      text: 'lebih murah s/d 5%'),
                            )
                          : controller.hargaBersaing.value == 60
                              ? FormBuilderTextField(
                                  name: 'keteranganHargaBersaing',
                                  controller:
                                      controller.hargaBersaingKeterangan =
                                          TextEditingController(
                                              text: 'Sama dengan pesaing'),
                                )
                              : controller.hargaBersaing.value == 50
                                  ? FormBuilderTextField(
                                      name: 'keteranganHargaBersaing',
                                      controller: controller
                                              .hargaBersaingKeterangan =
                                          TextEditingController(
                                              text: 'Lebih mahal dari pesaing'),
                                    )
                                  : FormBuilderTextField(
                                      name: 'keteranganHargaBersaing',
                                      controller:
                                          controller.hargaBersaingKeterangan =
                                              TextEditingController(text: ''),
                                    ),
            ],
          ),
        ),
      ],
    );
  }

  Column keteranganPersainganPasar() {
    return Column(
      children: [
        Center(
          child: Text(
            controller.persainganPasar.value == 90
                ? 'Score 90'
                : controller.persainganPasar.value == 80
                    ? 'Score 80'
                    : controller.persainganPasar.value == 70
                        ? 'Score 70'
                        : controller.persainganPasar.value == 60
                            ? 'Score 60'
                            : controller.persainganPasar.value == 50
                                ? 'Score 50'
                                : '',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Column(
            children: [
              controller.persainganPasar.value == 90
                  ? FormBuilderTextField(
                      name: 'keteranganPersainganPasar',
                      controller: controller.persainganPasarKeterangan =
                          TextEditingController(text: 'Tidak ketat'),
                    )
                  : controller.persainganPasar.value == 80
                      ? FormBuilderTextField(
                          name: 'keteranganPersainganPasar',
                          controller: controller.persainganPasarKeterangan =
                              TextEditingController(text: 'Kurang ketat'),
                        )
                      : controller.persainganPasar.value == 70
                          ? FormBuilderTextField(
                              name: 'keteranganPersainganPasar',
                              controller: controller.persainganPasarKeterangan =
                                  TextEditingController(text: 'Cukup ketat'),
                            )
                          : controller.persainganPasar.value == 60
                              ? FormBuilderTextField(
                                  name: 'keteranganPersainganPasar',
                                  controller:
                                      controller.persainganPasarKeterangan =
                                          TextEditingController(text: 'Ketat'),
                                )
                              : controller.persainganPasar.value == 50
                                  ? FormBuilderTextField(
                                      name: 'keteranganPersainganPasar',
                                      controller:
                                          controller.persainganPasarKeterangan =
                                              TextEditingController(
                                                  text: 'Sangat ketat'),
                                    )
                                  : FormBuilderTextField(
                                      name: 'keteranganPersainganPasar',
                                      controller:
                                          controller.persainganPasarKeterangan =
                                              TextEditingController(text: ''),
                                    ),
            ],
          ),
        ),
      ],
    );
  }

  Column lokasiPasar() {
    return Column(
      children: [
        Center(
          child: Text(
            controller.lokasiPasar.value == 90
                ? 'Score 90'
                : controller.lokasiPasar.value == 80
                    ? 'Score 80'
                    : controller.lokasiPasar.value == 70
                        ? 'Score 70'
                        : controller.lokasiPasar.value == 60
                            ? 'Score 60'
                            : controller.lokasiPasar.value == 50
                                ? 'Score 50'
                                : '',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Column(
            children: [
              controller.lokasiPasar.value == 90
                  ? FormBuilderTextField(
                      name: 'keteranganLokasiPasar',
                      controller: controller.lokasiPasarKeterangan =
                          TextEditingController(text: 'Sangat strategis'),
                    )
                  : controller.lokasiPasar.value == 80
                      ? FormBuilderTextField(
                          name: 'keteranganLokasiPasar',
                          controller: controller.lokasiPasarKeterangan =
                              TextEditingController(text: 'Strategis'),
                        )
                      : controller.lokasiPasar.value == 70
                          ? FormBuilderTextField(
                              name: 'keteranganLokasiPasar',
                              controller: controller.lokasiPasarKeterangan =
                                  TextEditingController(
                                      text: 'Cukup strategis'),
                            )
                          : controller.lokasiPasar.value == 60
                              ? FormBuilderTextField(
                                  name: 'keteranganLokasiPasar',
                                  controller: controller.lokasiPasarKeterangan =
                                      TextEditingController(
                                          text: 'Kurang strategis'),
                                )
                              : controller.lokasiPasar.value == 50
                                  ? FormBuilderTextField(
                                      name: 'keteranganLokasiPasar',
                                      controller:
                                          controller.lokasiPasarKeterangan =
                                              TextEditingController(
                                                  text: 'Tidak strategis'),
                                    )
                                  : FormBuilderTextField(
                                      name: 'keteranganLokasiPasar',
                                      controller:
                                          controller.lokasiPasarKeterangan =
                                              TextEditingController(text: ''),
                                    ),
            ],
          ),
        ),
      ],
    );
  }

  Column kapasitasTerpasan() {
    return Column(
      children: [
        Center(
          child: Text(
            controller.kapasitasTerpasan.value == 90
                ? 'Score 90'
                : controller.kapasitasTerpasan.value == 80
                    ? 'Score 80'
                    : controller.kapasitasTerpasan.value == 70
                        ? 'Score 70'
                        : controller.kapasitasTerpasan.value == 60
                            ? 'Score 60'
                            : controller.kapasitasTerpasan.value == 50
                                ? 'Score 50'
                                : '',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Column(
            children: [
              controller.kapasitasTerpasan.value == 90
                  ? FormBuilderTextField(
                      name: 'keteranganKapasitasTerpasan',
                      controller: controller.kapasitasTerpasanKeterangan =
                          TextEditingController(text: 'Lebih dari 80%'),
                    )
                  : controller.kapasitasTerpasan.value == 80
                      ? FormBuilderTextField(
                          name: 'keteranganKapasitasTerpasan',
                          controller: controller.kapasitasTerpasanKeterangan =
                              TextEditingController(text: 's/d 80%'),
                        )
                      : controller.kapasitasTerpasan.value == 70
                          ? FormBuilderTextField(
                              name: 'keteranganKapasitasTerpasan',
                              controller:
                                  controller.kapasitasTerpasanKeterangan =
                                      TextEditingController(text: 's/d 70%'),
                            )
                          : controller.kapasitasTerpasan.value == 60
                              ? FormBuilderTextField(
                                  name: 'keteranganKapasitasTerpasan',
                                  controller: controller
                                          .kapasitasTerpasanKeterangan =
                                      TextEditingController(text: 's/d 60%'),
                                )
                              : controller.kapasitasTerpasan.value == 50
                                  ? FormBuilderTextField(
                                      name: 'keteranganKapasitasTerpasan',
                                      controller: controller
                                              .kapasitasTerpasanKeterangan =
                                          TextEditingController(
                                              text: 's/d 50%'),
                                    )
                                  : FormBuilderTextField(
                                      name: 'keteranganKapasitasTerpasan',
                                      controller: controller
                                              .kapasitasTerpasanKeterangan =
                                          TextEditingController(text: ''),
                                    ),
            ],
          ),
        ),
      ],
    );
  }

  Column rating() {
    return Column(
      children: [
        Center(
          child: Text(
            controller.rating.value == 90
                ? 'Score 90'
                : controller.rating.value == 80
                    ? 'Score 80'
                    : controller.rating.value == 70
                        ? 'Score 70'
                        : controller.rating.value == 60
                            ? 'Score 60'
                            : controller.rating.value == 50
                                ? 'Score 50'
                                : '',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Column(
            children: [
              controller.rating.value == 90
                  ? FormBuilderTextField(
                      name: 'keteranganRating',
                      controller: controller.ratingKeterangan =
                          TextEditingController(text: 'Sangat baik'),
                    )
                  : controller.rating.value == 80
                      ? FormBuilderTextField(
                          name: 'keteranganRating',
                          controller: controller.ratingKeterangan =
                              TextEditingController(text: 'Baik'),
                        )
                      : controller.rating.value == 70
                          ? FormBuilderTextField(
                              name: 'keteranganRating',
                              controller: controller.ratingKeterangan =
                                  TextEditingController(text: 'Cukup'),
                            )
                          : controller.rating.value == 60
                              ? FormBuilderTextField(
                                  name: 'keteranganRating',
                                  controller: controller.ratingKeterangan =
                                      TextEditingController(
                                          text: 'Kurang Baik'),
                                )
                              : controller.rating.value == 50
                                  ? FormBuilderTextField(
                                      name: 'keteranganRating',
                                      controller: controller.ratingKeterangan =
                                          TextEditingController(text: 'Jelek'),
                                    )
                                  : FormBuilderTextField(
                                      name: 'keteranganRating',
                                      controller: controller.ratingKeterangan =
                                          TextEditingController(text: ''),
                                    ),
            ],
          ),
        ),
      ],
    );
  }

  Column keteranganOmzet() {
    return Column(
      children: [
        Center(
          child: Text(
            controller.omzetPenjualan.value == 90
                ? 'Score 90'
                : controller.omzetPenjualan.value == 80
                    ? 'Score 80'
                    : controller.omzetPenjualan.value == 70
                        ? 'Score 70'
                        : controller.omzetPenjualan.value == 60
                            ? 'Score 60'
                            : controller.omzetPenjualan.value == 50
                                ? 'Score 50'
                                : '',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Column(
            children: [
              controller.omzetPenjualan.value == 90
                  ? FormBuilderTextField(
                      name: 'keteranganOmzet',
                      controller: controller.omzetPenjualanKeterangan =
                          TextEditingController(text: 'Lebih dari 80%'),
                      onChanged: (value) {
                        controller.omzetPenjualanKeterangan.text = value!;
                      },
                      onSaved: (value) {
                        controller.omzetPenjualanKeterangan.text = value!;
                      },
                      onSubmitted: (value) {
                        controller.omzetPenjualanKeterangan.text = value!;
                      },
                    )
                  : controller.omzetPenjualan.value == 80
                      ? FormBuilderTextField(
                          name: 'keteranganOmzet',
                          controller: controller.omzetPenjualanKeterangan =
                              TextEditingController(text: 's/d 80%'),
                        )
                      : controller.omzetPenjualan.value == 70
                          ? FormBuilderTextField(
                              name: 'keteranganOmzet',
                              controller: controller.omzetPenjualanKeterangan =
                                  TextEditingController(text: 's/d 70%'),
                            )
                          : controller.omzetPenjualan.value == 60
                              ? FormBuilderTextField(
                                  name: 'keteranganOmzet',
                                  controller: controller
                                          .omzetPenjualanKeterangan =
                                      TextEditingController(text: 's/d 60%'),
                                )
                              : controller.omzetPenjualan.value == 50
                                  ? FormBuilderTextField(
                                      name: 'keteranganOmzet',
                                      controller:
                                          controller.omzetPenjualanKeterangan =
                                              TextEditingController(
                                                  text: 's/d 50%'),
                                    )
                                  : FormBuilderTextField(
                                      name: 'keteranganOmzet',
                                      controller:
                                          controller.omzetPenjualanKeterangan =
                                              TextEditingController(text: ''),
                                    ),
            ],
          ),
        ),
      ],
    );
  }
}
