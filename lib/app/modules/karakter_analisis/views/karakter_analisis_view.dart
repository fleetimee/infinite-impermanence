// ignore_for_file: avoid_print

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/karakter_analisis/views/components/hitung_crr.dart';
import 'package:akm/app/modules/karakter_analisis/views/components/score_pendidikan.dart';
import 'package:akm/app/modules/karakter_analisis/views/components/score_pengalaman.dart';
import 'package:akm/app/modules/karakter_analisis/views/components/score_umur.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/karakter_analisis_controller.dart';

class KarakterAnalisisView extends GetView<KarakterAnalisisController> {
  const KarakterAnalisisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: SideMenu(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: primaryColor.withOpacity(0.3),
        title: const Text(
          "Karakter Analisis",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120 + MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: AssetImage('assets/image/gradient/15.png'),
                          image: NetworkImage(
                            "https://wallpaperaccess.com/full/1601031.jpg",
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: primaryColor.withOpacity(0.85),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Obx(
                () => FormBuilder(
                  child: Column(
                    children: <Widget>[
                      GifView.asset(
                        'assets/images/karakter/header.gif',
                        frameRate: 30,
                        fit: BoxFit.cover,
                        loop: false,
                        height: 400,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Divider(
                          color: primaryColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Data Analisa Karakter',
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
                        'Berikut beberapa parameter yang harus diinputkan untuk mengetahui karakter debitur.',
                        style: TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.fade,
                          letterSpacing: 1,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FormBuilderTouchSpin(
                        displayFormat: NumberFormat('# Tahun'),
                        name: 'Umur',
                        decoration: InputDecoration(
                          labelText: 'Umur',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          controller.umur.value = value as int;
                          print(controller.umur.value);
                        },
                        min: 21,
                        max: 65,
                        step: 1,
                        initialValue: 21,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ScoreUmur(),
                      const SizedBox(
                        height: 40,
                      ),
                      FormBuilderDropdown(
                        name: 'Pendidikan',
                        items: const [
                          DropdownMenuItem(
                            value: 60,
                            child: Text('Tanpa Pendidikan'),
                          ),
                          DropdownMenuItem(
                            value: 70,
                            child: Text('SD'),
                          ),
                          DropdownMenuItem(
                            value: 75,
                            child: Text('SLTP'),
                          ),
                          DropdownMenuItem(
                            value: 80,
                            child: Text('SLTA'),
                          ),
                          DropdownMenuItem(
                            value: 85,
                            child: Text('D3'),
                          ),
                          DropdownMenuItem(
                            value: 90,
                            child: Text('S1'),
                          ),
                          DropdownMenuItem(
                            value: 95,
                            child: Text('S2'),
                          ),
                          DropdownMenuItem(
                            value: 96,
                            child: Text('S3'),
                          ),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Pendidikan',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          controller.scorePendidikan.value = value as int;
                          print(controller.scorePendidikan.value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ScorePendidikan(),
                      const SizedBox(
                        height: 40,
                      ),
                      FormBuilderDropdown(
                        name: 'Pengalaman dalam bisnis',
                        items: const [
                          DropdownMenuItem(
                            value: 60,
                            child: Text('1 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 65,
                            child: Text('2 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 70,
                            child: Text('3 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 75,
                            child: Text('4 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 80,
                            child: Text('5 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 85,
                            child: Text('6 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 90,
                            child: Text('7 Tahun'),
                          ),
                          DropdownMenuItem(
                            value: 95,
                            child: Text('8 Tahun +'),
                          ),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Lamanya berusaha',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          controller.scorePengalaman.value = value as int;
                          print(controller.scorePengalaman.value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ScorePengalaman(),
                      const SizedBox(
                        height: 40,
                      ),
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.uletDalamBisnis.value = value!;
                          print(controller.uletDalamBisnis.value);
                        },
                        name: 'Ulet Dalam Bisnis',
                        decoration: InputDecoration(
                          labelText: 'Ulet Dalam Bisnis',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.uletDalamBisnis.value == 95)
                            Text(
                              'Sangat ulet dalam mengelola usahanya dan memiliki banyak langganan',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.uletDalamBisnis.value >= 75 &&
                              controller.uletDalamBisnis.value < 95)
                            Text(
                              'Cukup ulet dalam mengelola usahanya dan memiliki langganan.',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.uletDalamBisnis.value >= 50 &&
                              controller.uletDalamBisnis.value < 75)
                            Text(
                              'Kurang ulet dalam mengelola usahanya dan memiliki sedikit langganan.',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.uletDalamBisnis.value < 50)
                            Text(
                              'Tidak ulet dalam mengelola usahanya dan tidak memiliki langganan.',
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
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.kakuFleksibel.value = value!;
                          print(controller.kakuFleksibel.value);
                        },
                        name: 'Kaku / Fleksibel',
                        decoration: InputDecoration(
                          labelText: 'Kaku / Fleksibel',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.kakuFleksibel.value == 95)
                            Text(
                              'Sangat fleksibel dalam berusaha dan menentukan harga',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.kakuFleksibel.value > 70 &&
                              controller.kakuFleksibel.value < 95)
                            Text(
                              'Fleksibel dalam berusaha dan menentukan harga.',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.kakuFleksibel.value > 50 &&
                              controller.kakuFleksibel.value <= 70)
                            Text(
                              'Kaku dalam berusaha dan menentukan harga.',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.kakuFleksibel.value <= 50)
                            Text(
                              'Sangat kaku dalam berusaha dan menentukan harga.',
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
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.inovatifKreatif.value = value!;
                          print(controller.inovatifKreatif.value);
                        },
                        name: 'Kreatif / Inovatif',
                        decoration: InputDecoration(
                          labelText: 'Kreatif / Inovatif',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.inovatifKreatif.value == 95)
                            Text(
                              'Sangat kreatif dan inovatif dalam mengembangkan usahanya',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.inovatifKreatif.value >= 75 &&
                              controller.inovatifKreatif.value < 95)
                            Text(
                              'Kratif dan selalu ingin mempunyai usaha kecil lebih lebih dari yang ada sekarang',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.inovatifKreatif.value >= 50 &&
                              controller.inovatifKreatif.value < 75)
                            Text(
                              'Kurang kreatif dan enggan mempunyai usaha kecil lebih dari yang ada sekarang',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.inovatifKreatif.value < 50)
                            Text(
                              'Sangat tidak kreatif dan malah menyepelekan usahanya',
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
                      FormBuilderSlider(
                        divisions: 10,
                        initialValue: 0,
                        min: 0,
                        max: 100,
                        onChanged: (double? value) {
                          controller.jujur.value = value!;
                          print(controller.jujur.value);
                        },
                        name: 'Memiliki kejujuran dalam bisnis',
                        decoration: InputDecoration(
                          labelText: 'Memiliki kejujuran dalam bisnis',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.jujur.value == 95)
                            Text(
                              'Memiliki kejujuran yang sangat baik dalam berusaha',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.jujur.value >= 75 &&
                              controller.jujur.value < 95)
                            Text(
                              'Memiliki kejujuran yang memadai dalam berusaha',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.jujur.value >= 50 &&
                              controller.jujur.value < 75)
                            Text(
                              'Memiliki kejujuran yang kurang memadai dalam berusaha',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.jujur.value < 50)
                            Text(
                              'Memiliki kejujuran yang sangat tidak memadai dalam berusaha',
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
                      FormBuilderTextField(
                        keyboardType: TextInputType.multiline,
                        controller: controller.deskripsi,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                        name: 'Deskripsi Bisnis Pemohon',
                        decoration: InputDecoration(
                          labelText: 'Deskripsi Bisnis Pemohon',
                          border: const OutlineInputBorder(),
                          alignLabelWithHint: true,
                          suffixIcon: IconButton(
                              onPressed: () => {
                                    // controller.hasilUntukDeskripsiBisnis(),
                                    // AwesomeDialog(
                                    //   context: context,
                                    //   titleTextStyle: const TextStyle(
                                    //     fontSize: 20,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: secondaryColor,
                                    //   ),
                                    //   descTextStyle: const TextStyle(
                                    //     fontSize: 15,
                                    //     fontWeight: FontWeight.normal,
                                    //     color: secondaryColor,
                                    //   ),
                                    //   dialogBackgroundColor: primaryColor,
                                    //   dialogType: DialogType.INFO_REVERSED,
                                    //   animType: AnimType.BOTTOMSLIDE,
                                    //   title: 'Sukses',
                                    //   desc:
                                    //       'Deskripsi bisnis pemohon berhasil ter-generate',
                                    //   btnOkOnPress: () {},
                                    // ).show()
                                  },
                              icon: const Icon(Icons.refresh_rounded)),
                        ),
                        maxLines: 10,
                        textInputAction: TextInputAction.newline,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      colorButton(
                        context,
                        'Hitung CRR',
                        () {
                          controller.hitungCrr();
                          showBarModalBottomSheet(
                              backgroundColor: secondaryColor,
                              bounce: true,
                              context: context,
                              builder: (context) {
                                return HitungCrr();
                              });
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
