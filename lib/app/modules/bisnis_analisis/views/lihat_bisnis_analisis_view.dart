// 🐦 Flutter imports:

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/bisnis_analisis_controller.dart';

class LihatBisnisAnalisisView extends GetView<BisnisAnalisisController> {
  LihatBisnisAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bisnis: ${data.peminjam1}'),
        actions: [
          IconButton(
            onPressed: () {
              AwesomeDialog(
                      context: Get.context!,
                      dialogType: DialogType.question,
                      animType: AnimType.bottomSlide,
                      dialogBackgroundColor: primaryColor,
                      titleTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      descTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      title: 'Konfirmasi',
                      bodyHeaderDistance: 25,
                      desc: 'Apakah yakin untuk menghapus item ini ?',
                      btnOkOnPress: () {
                        controller.deleteAnalisaBisnis(data.analisaBisnis.id);
                        Get.back();
                      },
                      btnOkText: 'Oke sip',
                      btnCancelText: 'Affa iyh',
                      btnCancelOnPress: () {})
                  .show();
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidTrashCan,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                    height: 25,
                  ),
                  Text(
                    controller.omzetDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
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
                    decoration: const InputDecoration(
                      labelText: 'Omzet Penjualan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.hargaBersaingDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 16,
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
                    decoration: const InputDecoration(
                      labelText: 'Harga Bersaing',
                      border: OutlineInputBorder(),
                    ),
                    // onChanged: (int? value) {
                    //   controller.hargaBersaing.value = value!;
                    //   print(controller.hargaBersaing.value);
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.persainganPasarDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderDropdown(
                    decoration: const InputDecoration(
                      labelText: 'Persaingan Pasar',
                      border: OutlineInputBorder(),
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
                  Text(
                    controller.lokasiUsaha,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderDropdown(
                    initialValue: data.analisaBisnis.nilaiLokasiUsaha,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Lokasi Usaha',
                      border: OutlineInputBorder(),
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
                  Text(
                    controller.kapasitasTerpasangDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderDropdown(
                    initialValue: data.analisaBisnis.nilaiProduktivitas,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Produktivitas (%) thd kap terpasang/omzet',
                      border: OutlineInputBorder(),
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
                  Text(
                    controller.kualitasProdukDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderDropdown(
                    enabled: false,
                    initialValue: data.analisaBisnis.nilaiKualitas,
                    decoration: const InputDecoration(
                      labelText: 'Kwalitas produk/jasa',
                      border: OutlineInputBorder(),
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
                    height: 30,
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
                  GFButton(
                    onPressed: () {
                      showBarModalBottomSheet(
                        backgroundColor: secondaryColor,
                        bounce: true,
                        context: context,
                        builder: (context) {
                          controller.hasilHitungCrrBisnis();
                          return Container(
                            padding: const EdgeInsets.all(16),
                            child: FormBuilder(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Center(
                                    child: Text(
                                      'Berikut adalah rincian',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      'CRR Bisnis 🎉🎉🎉',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Lottie.asset(
                                      'assets/images/home/bisnis_promp.zip',
                                      frameRate: FrameRate.max,
                                      height: 280,
                                      fit: BoxFit.cover,
                                      repeat: true,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Text(
                                          'Gagal memuat animasi',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'Total CRR : ${data.analisaBisnis.hasilCrrBisnis}',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    text: 'Lihat Hasil',
                    color: primaryColor,
                    size: GFSize.LARGE,
                    fullWidthButton: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
