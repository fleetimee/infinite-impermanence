import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:numerus/numerus.dart';

import '../controllers/list_agunan_kendaraan_controller.dart';

class ListAgunanKendaraanView extends GetView<ListAgunanKendaraanController> {
  ListAgunanKendaraanView({Key? key}) : super(key: key);

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
        title: const Text('Agunan Kendaraan Yang Terdaftar'),
        actions: [
          Obx(() {
            if (controller.isAgunanKendaraanProcessing.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {
                  showBarModalBottomSheet(
                    expand: true,
                    bounce: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    settings: RouteSettings(
                        name: Routes.LIST_AGUNAN_KENDARAAN, arguments: data),
                    builder: (context) => Container(),
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
          if (controller.isAgunanKendaraanProcessing.value) {
            return const Center(
              child: SataniaLoading(),
            );
          } else {
            if (controller.listAgunanKendaraan.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.listAgunanKendaraan.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GFListTile(
                      color: secondaryColor,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Agunan Kendaraan ${(index + 1).toRomanNumeralString()}',
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
                            controller.listAgunanKendaraan[index].jenis
                                        .toString() ==
                                    'Spd Motor'
                                ? "Kendaraan Roda 2"
                                : "Kendaraan Roda 4",
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
                                  paddedTextTanah('Jenis'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanKendaraan[index].jenis
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Merk'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanKendaraan[index].merk
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Tipe'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanKendaraan[index].type
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Warna'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanKendaraan[index].warna
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Tahun'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanKendaraan[index].tahun
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('No. Polisi'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanKendaraan[index].noPolisi
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('No. Rangka'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanKendaraan[index].noRangka
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('No. Mesin'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanKendaraan[index].noMesin
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('No. BPKB'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanKendaraan[index].noBpkb
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Atas Nama'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanKendaraan[index].namaPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Keadaan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanKendaraan[index].kondisi
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
                                  paddedTextTanah('Nilai Pasar'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        controller.listAgunanKendaraan[index]
                                            .nilaiPasar
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
                                        controller.listAgunanKendaraan[index]
                                            .nilaiLiquidasi
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
                                        controller.listAgunanKendaraan[index]
                                            .nilaiPengikatan
                                            .toString(),
                                      ),
                                    ).text}',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Pengikatan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanKendaraan[index].pengikatan
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
                                    controller
                                        .listAgunanKendaraan[index].namaPemilik
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
                                  paddedTextTanah('Summary'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      '${controller.listAgunanKendaraan[index].jenis == 'Spd Motor' ? 'Kendaraan Roda 2 (Dua)' : 'Kendaraan Roda 4 (Empat)'} Merk ${controller.listAgunanKendaraan[index].merk} Tahun ${controller.listAgunanKendaraan[index].tahun}, sesuai yang tercantum dalam BPKB asli ${controller.listAgunanKendaraan[index].noBpkb}, No Polisi ${controller.listAgunanKendaraan[index].noPolisi}, No Rangka ${controller.listAgunanKendaraan[index].noRangka}, No Mesin ${controller.listAgunanKendaraan[index].noMesin}, Warna ${controller.listAgunanKendaraan[index].warna}, dengan kondisi ${controller.listAgunanKendaraan[index].kondisi}'),
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
