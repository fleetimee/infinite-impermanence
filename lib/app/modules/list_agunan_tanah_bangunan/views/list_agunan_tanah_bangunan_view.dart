// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numerus/numerus.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_tanah_bangunan_controller.dart';

class ListAgunanTanahBangunanView
    extends GetView<ListAgunanTanahBangunanController> {
  ListAgunanTanahBangunanView({Key? key}) : super(key: key);

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
        title: const Text('Agunan Tanah Bangunan Yang Terdaftar'),
        actions: [
          Obx(() {
            if (controller.isAgunanTanahBangunanProcessing.value) {
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
                        name: Routes.LIST_AGUNAN_TANAH_BANGUNAN,
                        arguments: data),
                    builder: (context) => FormTambahAgunanTanahBangunan(),
                    isDismissible: false,
                  );
                },
                icon: const Icon(FontAwesomeIcons.plus),
              );
            }
          })
        ],
      ),
      body: Obx(() {
        if (controller.isAgunanTanahBangunanProcessing.value) {
          return const Center(
            child: SataniaLoading(),
          );
        } else {
          if (controller.listAgunanTanahBangunan.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.listAgunanTanahBangunan.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GFListTile(
                    color: secondaryColor,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Agunan Tanah & Bangunan ${(index + 1).toRomanNumeralString()}',
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
                          controller
                              .listAgunanTanahBangunan[index].deskripsiPendek
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
                                  controller.listAgunanTanahBangunan[index]
                                      .namaPemilik
                                      .toString(),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Bukti Kepemilikan'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  controller.listAgunanTanahBangunan[index]
                                      .buktiKepemilikan
                                      .toString(),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Luas'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  '${controller.listAgunanTanahBangunan[index].luasTanah} m2',
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Tanggal'),
                                paddedTextTanah(':'),
                                paddedTextTanah(DateFormat('dd/MM/yy').format(
                                    DateTime.parse(controller
                                        .listAgunanTanahBangunan[index].tanggal
                                        .toString())))
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Nilai Pasar'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiPasar.toString())).text}'),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Nilai Liquidasi'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiLiquidasi.toString())).text}',
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Lokasi'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  controller
                                      .listAgunanTanahBangunan[index].lokasi
                                      .toString(),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Pengikatan'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  controller
                                      .listAgunanTanahBangunan[index].pengikatan
                                      .toString(),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah(''),
                                const SizedBox.shrink(),
                                const SizedBox.shrink(),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Pemilik'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  controller.listAgunanTanahBangunan[index]
                                      .namaPemilik
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
                                      .listAgunanTanahBangunan[index].lokasi
                                      .toString(),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah(''),
                                const SizedBox.shrink(),
                                const SizedBox.shrink(),
                              ],
                            ),
                            TableRow(
                              children: [
                                paddedTextTanah('Summary'),
                                paddedTextTanah(':'),
                                paddedTextTanah(
                                  '${controller.listAgunanTanahBangunan[index].deskripsiPendek} dengan bukti kepemilikan ${controller.listAgunanTanahBangunan[index].buktiKepemilikan} di ${controller.listAgunanTanahBangunan[index].lokasi} dengan luas ${controller.listAgunanTanahBangunan[index].luasTanah} m2',
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
      }),
    );
  }
}

class FormTambahAgunanTanahBangunan extends StatelessWidget {
  FormTambahAgunanTanahBangunan({Key? key}) : super(key: key);

  final controller = Get.put(ListAgunanTanahBangunanController());
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
              'Form Tambah Agunan Tanah',
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
              child: FormInputAgunanTanahBangunan(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormInputAgunanTanahBangunan extends StatelessWidget {
  FormInputAgunanTanahBangunan({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanTanahBangunanController controller;
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
              hintText: 'Sebidang tanah di kota X',
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
            name: 'bukti_kepemilikan',
            controller: controller.buktiKepemilikan,
            decoration: const InputDecoration(
              labelText: 'Bukti Kepemilikan',
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
            name: 'luas_tanah',
            controller: controller.luasTanah,
            decoration: const InputDecoration(
              labelText: 'Luas Tanah',
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
          FormBuilderDateTimePicker(
            name: 'tanggal',
            inputType: InputType.date,
            onChanged: (value) {
              controller.tanggal = value!;
              debugPrint(value.toString());
            },
            onSaved: (value) {
              controller.tanggal = value!;
            },
            format: DateFormat('dd/MM/yyyy'),
            decoration: const InputDecoration(
              labelText: 'Tanggal',
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
            name: 'pengikatan',
            controller: controller.pengikatan,
            decoration: const InputDecoration(
              labelText: 'Pengikatan',
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
          const Text(
            'Nilai Agunan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: FormBuilderTextField(
                  name: 'nilai_pasar',
                  controller: controller.nilaiPasar,
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'persentase',
                  controller: controller.persentase,
                  decoration: const InputDecoration(
                    labelText: 'Persen',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'nilai_likuidasi',
            enabled: false,
            controller: controller.nilaiLiquidasi,
            decoration: const InputDecoration(
              labelText: 'Nilai Likuidasi',
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
            name: 'nilai_pengikatan',
            enabled: false,
            controller: controller.nilaiPengikatan,
            decoration: const InputDecoration(
              labelText: 'Nilai Pengikatan',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GFButton(
              onPressed: () {
                controller.hitungNilaiLiquidasi();
              },
              text: 'Hitung Nilai Liquidasi',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const Text(
            'Lokasi Agunan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FormBuilderTextField(
            name: 'lokasi',
            maxLines: 4,
            controller: controller.lokasi,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Lokasi',
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
            name: 'titik_koordinat',
            controller: controller.titikKoordinat,
            decoration: const InputDecoration(
              labelText: 'Titik Koordinat',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GFButton(
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  bounce: true,
                  isDismissible: false,
                  enableDrag: false,
                  builder: (context) {
                    return OpenStreetMapSearchAndPick(
                        center: LatLong(-7.8013753, 110.3647927),
                        buttonColor: primaryColor,
                        buttonText: 'Pilih Lokasi',
                        onPicked: (pickedData) {
                          var latLongString =
                              '${pickedData.latLong.latitude}, ${pickedData.latLong.longitude}';
                          controller.lokasi.text = pickedData.address;
                          controller.titikKoordinat.text = latLongString;
                          Get.back();
                        });
                  },
                );
              },
              text: 'Cari di Maps',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const Text(
            'Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          // TODO: Add summary generator
          FormBuilderTextField(
            name: 'deskripsi_panjang',
            controller: controller.deskripsiPanjang,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Summary',
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.saveAgunanTanahBangunan(data.id);

                  Get.back();
                  debugPrint(controller.formKey.currentState?.value.toString());
                } else {
                  debugPrint(controller.formKey.currentState?.value.toString());
                  debugPrint('validation failed');
                }
              },
              text: 'Simpan',
              color: primaryColor,
              fullWidthButton: true,
              elevation: 10,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
