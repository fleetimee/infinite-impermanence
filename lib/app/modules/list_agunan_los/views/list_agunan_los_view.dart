import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numerus/numerus.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../controllers/list_agunan_los_controller.dart';

class ListAgunanLosView extends GetView<ListAgunanLosController> {
  ListAgunanLosView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
      ),
      appBar: AppBar(
        title: const Text('Agunan Kios Yang Terdaftar'),
        actions: [
          Obx(() {
            if (controller.isAgunanLosProcessing.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {
                  showBarModalBottomSheet(
                    bounce: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    settings: RouteSettings(
                        name: Routes.LIST_AGUNAN_LOS, arguments: data),
                    builder: (context) => FormTambahAgunanLos(),
                    isDismissible: false,
                  );
                },
                icon: const Icon(FontAwesomeIcons.plus),
              );
            }
          })
        ],
      ),
      body: Obx(
        () {
          if (controller.isAgunanLosProcessing.value) {
            return const Center(
              child: SataniaLoading(),
            );
          } else {
            if (controller.listAgunanLos.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.listAgunanLos.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GFListTile(
                      color: secondaryColor,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Agunan Los (Kios Pasar) ${(index + 1).toRomanNumeralString()}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                          )
                        ],
                      ),
                      subTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DATA JAMINAN',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            controller.listAgunanLos[index].deskripsiPendek
                                .toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(0.5),
                              1: FlexColumnWidth(0.1),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                children: [
                                  paddedTextTanah('Atas Nama'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanLos[index].namaPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Tempat Tgl Lahir'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    '${controller.listAgunanLos[index].tempatLahir.toString()}, ${DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.listAgunanLos[index].tanggalLahir.toString()))}',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Alamat'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanLos[index].alamatPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Tempat Dasaran'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanLos[index].tempatDasaran
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('No Registrasi'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanLos[index].noRegistrasi
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Luas'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    '${controller.listAgunanLos[index].luasLos.toString()} m2',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Jenis Dagangan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanLos[index].jenisDagangan
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Jam Buka'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    '${controller.listAgunanLos[index].waktuBuka.toString()} - ${controller.listAgunanLos[index].waktuTutup.toString()} WIB',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Berlaku s/d'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    DateFormat('dd MMMM yyyy').format(
                                        DateTime.parse(controller
                                            .listAgunanLos[index].berlakuSampai
                                            .toString())),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah(''),
                                  paddedTextTanah(''),
                                  paddedTextTanah(''),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Pasar'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        controller
                                            .listAgunanLos[index].nilaiPasar
                                            .toString(),
                                      ),
                                    ).text}',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Likuidasi'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        controller
                                            .listAgunanLos[index].nilaiLiquidasi
                                            .toString(),
                                      ),
                                    ).text}',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Pengikatan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        controller.listAgunanLos[index]
                                            .nilaiPengikatan
                                            .toString(),
                                      ),
                                    ).text}',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah(''),
                                  paddedTextTanah(''),
                                  paddedTextTanah(''),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Lokasi Pasar'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanLos[index].lokasiPasar
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Pengikatan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanLos[index].pengikatan
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah(''),
                                  paddedTextTanah(''),
                                  paddedTextTanah(''),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Pemilik'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanLos[index].namaPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Alamat'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanLos[index].alamatPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Summary'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanLos[index].deskripsiPanjang
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: EmptyWidget(
                  image: 'assets/images/home/satania-crying.png',
                  title: 'Tidak ada data',
                  titleTextStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: secondaryColor,
                  ),
                  subtitleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: secondaryColor,
                  ),
                  hideBackgroundAnimation: true,
                  subTitle:
                      'Tidak ada data agunan tanah yang terdaftar atau koneksi internet bermasalah',
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class FormTambahAgunanLos extends StatelessWidget {
  FormTambahAgunanLos({Key? key}) : super(key: key);

  final controller = Get.put(ListAgunanLosController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Form Tambah Agunan Los',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            FormBuilder(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: FormInputAgunanLos(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormInputAgunanLos extends StatelessWidget {
  FormInputAgunanLos({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanLosController controller;
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detail Agunan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FormBuilderTextField(
            name: 'deskripsi_pendek',
            controller: controller.deskripsiPendek,
            decoration: const InputDecoration(
              labelText: 'Keterangan',
              hintText: 'KBP Pasar Lempuyangan...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'atas_nama',
            controller: controller.namaPemilik,
            decoration: const InputDecoration(
              labelText: 'Nama Pemilik',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          // TODO: Lanjut sini
          FormBuilderTextField(
            name: 'Alamat',
            controller: controller.alamat,
            decoration: const InputDecoration(
              labelText: 'Alamat Pemilik',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
