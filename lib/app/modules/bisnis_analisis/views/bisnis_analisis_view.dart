// ignore_for_file: avoid_print

import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/bisnis_analisis_controller.dart';

class BisnisAnalisisView extends GetView<BisnisAnalisisController> {
  const BisnisAnalisisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
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
                  child: Column(
                    children: <Widget>[
                      GifView.asset(
                        'assets/images/business/header.gif',
                        frameRate: 30,
                        fit: BoxFit.cover,
                        loop: false,
                        height: 400,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FormBuilderSlider(
                        divisions: 10,
                        initialValue: 50,
                        min: 0,
                        max: 100,
                        onChanged: (double? value) {
                          controller.omzetPenjualan.value = value!;
                          print(controller.omzetPenjualan.value);
                        },
                        name: 'Omzet Penjualan',
                        decoration: InputDecoration(
                          labelText: 'Omzet Penjualan',
                          hintText: 'Angecekkan Omzet Penjualan',
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
                          if (controller.omzetPenjualan.value == 100)
                            Text(
                              'Omzet Penjualan sangat fantastis',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.omzetPenjualan.value >= 80.0 &&
                              controller.omzetPenjualan.value <= 99.0)
                            Text(
                              'Omzet Selalu berada diatas 80% dari target',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.omzetPenjualan.value >= 60.0 &&
                              controller.omzetPenjualan.value < 80.0)
                            Text(
                              'Omzet Selalu berada diatas 60% dari target',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.omzetPenjualan.value >= 40.0 &&
                              controller.omzetPenjualan.value < 60.0)
                            Text(
                              'Omzet Selalu berada diatas 40% dari target',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.omzetPenjualan.value >= 20.0 &&
                              controller.omzetPenjualan.value < 40.0)
                            Text(
                              'Omzet Selalu berada diatas 20% dari target',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.omzetPenjualan.value >= 0.0 &&
                              controller.omzetPenjualan.value < 20.0)
                            Text('Omzet Penjualan sangatlah buruk',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FormBuilderSwitch(
                        name: 'Harga Bersaing',
                        decoration: InputDecoration(
                          labelText: 'Harga Bersaing',
                          hintText: 'Angecekkan Omzet Penjualan',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          controller.hargaBersaing.value
                              ? 'Sama dengan pesaing'
                              : 'Tidak sama dengan pesaing',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        onChanged: (bool? value) {
                          controller.hargaBersaing.value = value!;
                          print(controller.hargaBersaing.value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.hargaBersaing.value == true)
                            Text(
                              'Harga sama dengan pesaing sejenis',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.hargaBersaing.value == false)
                            Text(
                              'Harga tidak sama dengan pesaing sejenis',
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
                        onChanged: (String? value) {
                          controller.persainganPasar.value = value!;
                          print(controller.persainganPasar.value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Persaingan',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Sangat Tidak Ketat',
                            child: Text('Sangat Tidak Ketat'),
                          ),
                          DropdownMenuItem(
                            value: 'Tidak Ketat',
                            child: Text('Tidak Ketat'),
                          ),
                          DropdownMenuItem(
                            value: 'Ketat',
                            child: Text('Ketat'),
                          ),
                          DropdownMenuItem(
                            value: 'Cukup Ketat',
                            child: Text('Cukup Ketat'),
                          ),
                          DropdownMenuItem(
                            value: 'Sangat Ketat',
                            child: Text('Sangat Ketat'),
                          ),
                        ],
                        name: 'Persaingan',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.persainganPasar.value ==
                              'Sangat Tidak Ketat')
                            Text(
                              'Usaha sejenis di sekitar masih sepi dan hampir tidak ada saingan',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (controller.persainganPasar.value == 'Tidak Ketat')
                            Text(
                              'Usaha sejenis di sekitar belum banyak',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.persainganPasar.value == 'Ketat')
                            Text(
                              'Usaha sejenis di sekitar ada sedikit saingan',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.persainganPasar.value == 'Cukup Ketat')
                            Text(
                              'Usaha sejenis di sekitar sudah banyak saingan',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.persainganPasar.value ==
                              'Sangat Ketat')
                            Text(
                              'Usaha sejenis di sekitar sangat banyak saingan',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          // Initial value
                          if (controller.persainganPasar.value == '')
                            Text(
                              'Pilih Persaingan',
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
                      FormBuilderSwitch(
                        name: 'Lokasi',
                        onChanged: (bool? value) {
                          controller.lokasiPasar.value = value!;
                          print(controller.lokasiPasar.value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Lokasi',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          controller.lokasiPasar.value
                              ? 'Strategis'
                              : 'Tidak Strategis',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.lokasiPasar.value == true)
                            Text(
                              'Lokasi mudah dijangkau pelanggan',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.lokasiPasar.value == false)
                            Text(
                              'Lokasi tidak mudah dijangkau pelanggan',
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
                      FormBuilderSlider(
                        name: 'Produktivitas terhadap kapasitas terpasan',
                        initialValue: 0,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        onChanged: (double? value) {
                          controller.kapasitasTerpasan.value = value!;
                          print(controller.kapasitasTerpasan.value);
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Produktivitas terhadap kapasitas terpasan',
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
                          if (controller.kapasitasTerpasan.value == 100)
                            Text(
                              'Tercapai terhadap penjualan dengan sempurna',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.kapasitasTerpasan.value >= 80 &&
                              controller.kapasitasTerpasan.value <= 99)
                            Text(
                              'Tercapai terhadap penjualan dengan cukup',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.kapasitasTerpasan.value >= 60 &&
                              controller.kapasitasTerpasan.value <= 79)
                            Text(
                              'Tercapai terhadap penjualan dengan normal',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.kapasitasTerpasan.value >= 40 &&
                              controller.kapasitasTerpasan.value <= 59)
                            Text(
                              'Tercapai terhadap penjualan dengan kurang',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.kapasitasTerpasan.value >= 0 &&
                              controller.kapasitasTerpasan.value <= 39)
                            Text(
                              'Tidak Tercapai terhadap penjualan ',
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
                      FormBuilderRatingBar(
                        // color the start with yellow color
                        glow: false,
                        wrapAlignment: WrapAlignment.center,
                        itemPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        name: 'Kualitas',
                        onChanged: (double? value) {
                          controller.rating.value = value!;
                          print(controller.rating.value);
                        },
                        initialRating: 0,
                        decoration: InputDecoration(
                          labelText: 'Kualitas',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          if (controller.rating.value == 5)
                            Text(
                              'Sangat Bagus',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.rating.value == 4)
                            Text(
                              'Bagus',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.rating.value == 3)
                            Text(
                              'Cukup Bagus',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.rating.value == 2)
                            Text(
                              'Kurang Bagus',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.rating.value == 1)
                            Text(
                              'Sangat Kurang Bagus',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (controller.rating.value == 0)
                            Text(
                              'Pilih Rating',
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
                        name: 'Deskripsi Bisnis Pemohon',
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi Bisnis Pemohon',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        keyboardType: TextInputType.number,
                        maxLines: 10,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      colorButton(
                        context,
                        'Submit',
                        () => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Berhasil',
                          desc: 'Data berhasil ditambahkan',
                          btnOkOnPress: () {
                            Navigator.pop(context);
                          },
                        ).show(),
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
}
