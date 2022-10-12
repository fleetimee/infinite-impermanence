// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import '../controllers/list_agunan_lainnya_controller.dart';

class ListAgunanLainnyaView extends GetView<ListAgunanLainnyaController> {
  ListAgunanLainnyaView({Key? key}) : super(key: key);

  final data = Get.arguments[0];
  final plafon = Get.arguments[1];

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
        title: const Text('Agunan Lainnya Yang Terdaftar'),
        actions: [
          Obx(() {
            if (controller.isAgunanLainnyaProcessing.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {
                  // showBarModalBottomSheet(
                  //   clipBehavior: Clip.antiAlias,
                  //   bounce: true,
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.vertical(
                  //       top: Radius.circular(20),
                  //     ),
                  //   ),
                  //   context: context,
                  //   settings: RouteSettings(
                  //       name: Routes.LIST_AGUNAN_PERALATAN, arguments: data),
                  //   builder: (context) => FormTambahAgunanCash(),
                  //   isDismissible: false,
                  // );
                },
                icon: const Icon(FontAwesomeIcons.plus),
              );
            }
          })
        ],
      ),
      body: Obx(
        () {
          if (controller.isAgunanLainnyaProcessing.value) {
            return const Center(
              child: SataniaLoading(),
            );
          } else {
            if (controller.listAgunanLainnya.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.listAgunanLainnya.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    // The end action pane is the one at the right or the bottom side.
                    endActionPane: const ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.

                          onPressed: null,
                          backgroundColor: Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GFListTile(
                        color: secondaryColor,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Agunan Lainnya',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Divider(
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
                              controller
                                  .listAgunanLainnya[index].deskripsiPanjang
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
                                    paddedTextTanah('Keterangan'),
                                    paddedTextTanah(':'),
                                    paddedTextTanah(
                                      controller.listAgunanLainnya[index]
                                          .deskripsiPanjang
                                          .toString(),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    paddedTextTanah(''),
                                    paddedTextTanah(':'),
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
                                          controller.listAgunanLainnya[index]
                                              .nilaiPasar
                                              .toString(),
                                        ),
                                      ).text}',
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    paddedTextTanah('Nilai Liquidasi'),
                                    paddedTextTanah(':'),
                                    paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(
                                        decimalSeparator: '',
                                        thousandSeparator: '.',
                                        precision: 0,
                                        initialValue: double.parse(
                                          controller.listAgunanLainnya[index]
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
                                          controller.listAgunanLainnya[index]
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
                                          .listAgunanLainnya[index].pengikatan
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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
