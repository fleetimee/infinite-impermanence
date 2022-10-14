// 🐦 Flutter imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numerus/numerus.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/list_agunan_cash_controller.dart';

class ListAgunanCashView extends GetView<ListAgunanCashController> {
  ListAgunanCashView({Key? key}) : super(key: key);

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
        title: const Text('Agunan Cash Yang Terdaftar'),
        actions: [
          Obx(() {
            if (controller.isAgunanCashProcessing.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {
                  showBarModalBottomSheet(
                    clipBehavior: Clip.antiAlias,
                    bounce: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    settings: RouteSettings(
                        name: Routes.LIST_AGUNAN_PERALATAN, arguments: data),
                    builder: (context) => FormTambahAgunanCash(),
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
          if (controller.isAgunanCashProcessing.value) {
            return const Center(
              child: SataniaLoading(),
            );
          } else {
            if (controller.listAgunanCash.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.listAgunanCash.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(10),
                          spacing: 10,
                          onPressed: ((context) => {
                                showBarModalBottomSheet(
                                  clipBehavior: Clip.antiAlias,
                                  bounce: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  settings: RouteSettings(
                                      name: Routes.LIST_AGUNAN_CASH,
                                      arguments: [
                                        controller.listAgunanCash[index],
                                        index,
                                      ]),
                                  builder: (context) => FormUbahAgunanCash(),
                                  isDismissible: false,
                                )
                              }),
                          backgroundColor: GFColors.WARNING,
                          foregroundColor: Colors.white,
                          icon: FontAwesomeIcons.pen,
                          label: 'Ubah',
                        ),
                        SlidableAction(
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(10),
                          spacing: 10,
                          onPressed: ((context) => {
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
                                        desc:
                                            'Apakah yakin untuk menghapus item ini ?',
                                        btnOkOnPress: () {
                                          controller.deleteAgunanCash(
                                              data.id,
                                              controller
                                                  .listAgunanCash[index].id);
                                        },
                                        btnOkText: 'Oke sip',
                                        btnCancelText: 'Affa iyh',
                                        btnCancelOnPress: () {})
                                    .show()
                              }),
                          backgroundColor: GFColors.DANGER,
                          foregroundColor: Colors.white,
                          icon: FontAwesomeIcons.trash,
                          label: 'Hapus',
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GFListTile(
                        color: secondaryColor,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Agunan Cash ${(index + 1).toRomanNumeralString()}',
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
                              controller.listAgunanCash[index].deskripsiPanjang
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
                                      controller.listAgunanCash[index]
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
                                          controller
                                              .listAgunanCash[index].nilaiPasar
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
                                          controller.listAgunanCash[index]
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
                                          controller.listAgunanCash[index]
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
                                          .listAgunanCash[index].pengikatan
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

class FormUbahAgunanCash extends StatelessWidget {
  FormUbahAgunanCash({Key? key}) : super(key: key);

  final controller = Get.put(ListAgunanCashController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Form Ubah Agunan Cash',
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
              child: FormUpdateAgunanCash(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormTambahAgunanCash extends StatelessWidget {
  FormTambahAgunanCash({Key? key}) : super(key: key);

  final controller = Get.put(ListAgunanCashController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Form Tambah Agunan Cash',
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
              child: FormInputAgunanCash(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormUpdateAgunanCash extends StatelessWidget {
  FormUpdateAgunanCash({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanCashController controller;
  final data = Get.arguments[0];
  final index = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                name: 'deskripsi_pendek_edit',
                controller: controller.deskripsiPanjangEdit =
                    TextEditingController(text: data.deskripsiPanjang),
                decoration: const InputDecoration(
                  labelText: 'Keterangan',
                  hintText: 'Mesin Pemisah Gabah...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                      name: 'nilai_pasar_edit',
                      controller: controller.nilaiPasarEdit =
                          MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(
                          data.nilaiPasar.toString(),
                        ),
                      ),
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
                      controller: controller.persentaseEdit,
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
                name: 'nilai_liquidasi',
                enabled: false,
                controller: controller.nilaiLiquidasiEdit =
                    MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(
                          data.nilaiLiquidasi.toString(),
                        )),
                decoration: const InputDecoration(
                  labelText: 'Nilai Liquidasi',
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
                controller: controller.nilaiPengikatanEdit =
                    MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(
                          data.nilaiPengikatan.toString(),
                        )),
                decoration: const InputDecoration(
                  labelText: 'Nilai Pengikatan',
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
                controller: controller.pengikatanEdit =
                    TextEditingController(text: data.pengikatan),
                decoration: const InputDecoration(
                  labelText: 'Pengikatan',
                  hintText: 'SKUM',
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
                    controller.hitungNilaiLiquidasiEdit();
                  },
                  text: 'Hitung Nilai Liquidasi',
                  elevation: 10,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 225,
          ),
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.updateAgunanCash(
                      data.agunanId, controller.listAgunanCash[index].id);
                  Get.back();
                  debugPrint(controller.formKey.currentState?.value.toString());
                } else {
                  debugPrint(controller.formKey.currentState?.value.toString());
                  debugPrint('validation failed');
                }
              },
              text: 'Update',
              color: primaryColor,
              fullWidthButton: true,
              elevation: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class FormInputAgunanCash extends StatelessWidget {
  FormInputAgunanCash({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanCashController controller;
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                controller: controller.deskripsiPanjang,
                decoration: const InputDecoration(
                  labelText: 'Keterangan',
                  hintText: 'Mesin Pemisah Gabah...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                name: 'nilai_liquidasi',
                enabled: false,
                controller: controller.nilaiLiquidasi,
                decoration: const InputDecoration(
                  labelText: 'Nilai Liquidasi',
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
              const SizedBox(
                height: 12.0,
              ),
              FormBuilderTextField(
                name: 'pengikatan',
                controller: controller.pengikatan,
                decoration: const InputDecoration(
                  labelText: 'Pengikatan',
                  hintText: 'SKUM',
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
            ],
          ),
          const SizedBox(
            height: 225,
          ),
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.saveAgunanCash(data.id);
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
        ],
      ),
    );
  }
}
