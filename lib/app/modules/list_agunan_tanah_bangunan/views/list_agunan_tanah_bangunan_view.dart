// 🐦 Flutter imports:

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart' as ml;
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
                                    name: Routes.LIST_AGUNAN_TANAH_BANGUNAN,
                                    arguments: [
                                      controller.listAgunanTanahBangunan[index],
                                      index,
                                    ]),
                                builder: (context) =>
                                    FormUbahAgunanTanahBangunan(),
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
                                        controller.deleteAgunanTanahBangunan(
                                            data.id,
                                            controller
                                                .listAgunanTanahBangunan[index]
                                                .id);
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Agunan Tanah & Bangunan ${(index + 1).toRomanNumeralString()}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              GFButton(
                                icon: const Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 15,
                                  color: GFColors.DANGER,
                                ),
                                text: "Denah Lokasi",
                                color: primaryColor,
                                size: GFSize.SMALL,
                                type: GFButtonType.outline,
                                onPressed: () {
                                  showBarModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 600,
                                        child: FlutterMap(
                                          options: MapOptions(
                                            center: LatLng(
                                              // Split string to get latitude and longitude
                                              double.parse(controller
                                                  .listAgunanTanahBangunan[
                                                      index]
                                                  .titikKoordinat!
                                                  .split(',')[0]),
                                              double.parse(controller
                                                  .listAgunanTanahBangunan[
                                                      index]
                                                  .titikKoordinat!
                                                  .split(',')[1]),
                                            ),
                                            zoom: 18.0,
                                          ),
                                          nonRotatedChildren: [
                                            AttributionWidget.defaultWidget(
                                              source: 'Novian Andika',
                                              onSourceTapped: null,
                                            ),
                                          ],
                                          children: [
                                            TileLayer(
                                              urlTemplate:
                                                  // Use google tile maps
                                                  'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                                              // 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                              userAgentPackageName:
                                                  'com.example.app',
                                              maxZoom: 20,
                                            ),
                                            PopupMarkerLayerWidget(
                                              options: PopupMarkerLayerOptions(
                                                popupController: controller
                                                    .popupLayerController,
                                                markers: [
                                                  Marker(
                                                    point: LatLng(
                                                      // Split string to get latitude and longitude
                                                      double.parse(controller
                                                          .listAgunanTanahBangunan[
                                                              index]
                                                          .titikKoordinat!
                                                          .split(',')[0]),
                                                      double.parse(controller
                                                          .listAgunanTanahBangunan[
                                                              index]
                                                          .titikKoordinat!
                                                          .split(',')[1]),
                                                    ),
                                                    width: 40,
                                                    height: 40,
                                                    builder: (_) => const Icon(
                                                      Icons.location_on,
                                                      size: 50,
                                                      color: GFColors.DANGER,
                                                    ),
                                                    anchorPos: AnchorPos.align(
                                                      AnchorAlign.top,
                                                    ),
                                                  ),
                                                ],
                                                markerRotateAlignment:
                                                    PopupMarkerLayerOptions
                                                        .rotationAlignmentFor(
                                                            AnchorAlign.top),
                                                popupBuilder:
                                                    (BuildContext context,
                                                            Marker marker) =>
                                                        ExamplePopup(marker),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
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
                                          .listAgunanTanahBangunan[index]
                                          .tanggal
                                          .toString())))
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
                                  paddedTextTanah('Nilai Pasar Tanah'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiPasarTanah.toString())).text}'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Liquidasi Tanah'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiLiquidasiTanah.toString())).text}'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Pasar Bangunan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiPasarBangunan.toString())).text}'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Liquidasi Bangunan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiLiquidasiBangunan.toString())).text}'),
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
                                  paddedTextTanah('Total Nilai Pasar'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiPasar.toString())).text}'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Total Nilai Liquidasi'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanahBangunan[index].nilaiLiquidasi.toString())).text}',
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
                                    controller.listAgunanTanahBangunan[index]
                                        .pengikatan
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
                                  paddedTextTanah('Titik Koordinat'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanTanahBangunan[index]
                                        .titikKoordinat
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
                                    controller.listAgunanTanahBangunan[index]
                                        .deskripsiPanjang
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
                    'Tidak ada data agunan tanah dan bangunan yang terdaftar atau koneksi internet bermasalah',
              ),
            );
          }
        }
      }),
    );
  }
}

class FormUbahAgunanTanahBangunan extends StatelessWidget {
  FormUbahAgunanTanahBangunan({Key? key}) : super(key: key);

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
              'Form Ubah Agunan Bangunan',
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
              child: FormUpdateAgunanTanahBangunan(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormUpdateAgunanTanahBangunan extends StatelessWidget {
  FormUpdateAgunanTanahBangunan({Key? key, required this.controller})
      : super(key: key);

  final ListAgunanTanahBangunanController controller;
  final data = Get.arguments[0];
  final index = Get.arguments[1];

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
            controller: controller.deskripsiPendekEdit =
                TextEditingController(text: data.deskripsiPendek),
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
            name: 'nama_pemilik',
            controller: controller.namaPemilikEdit =
                TextEditingController(text: data.namaPemilik),
            decoration: const InputDecoration(
              labelText: 'Nama Pemilik',
              hintText: 'Novian Andika',
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
            controller: controller.buktiKepemilikanEdit =
                TextEditingController(text: data.buktiKepemilikan),
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
            controller: controller.luasTanahEdit =
                TextEditingController(text: data.luasTanah.toString()),
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
            initialValue: data.tanggal,
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
            controller: controller.pengikatanEdit =
                TextEditingController(text: data.pengikatan),
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
          const Text(
            'Tanah',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: FormBuilderTextField(
                  name: 'nilai_pasar_tanah',
                  controller: controller.nilaiPasarTanahEdit =
                      MoneyMaskedTextController(
                          initialValue: double.parse(data.nilaiPasarTanah),
                          thousandSeparator: '.',
                          decimalSeparator: '',
                          precision: 0),
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar Tanah',
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
                  name: 'persentase_tanah',
                  controller: controller.persentaseTanahEdit,
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
            name: 'nilaiLiquidasiTanah',
            enabled: false,
            controller: controller.nilaiLiquidasiTanahEdit =
                MoneyMaskedTextController(
                    initialValue: double.parse(data.nilaiLiquidasiTanah),
                    thousandSeparator: '.',
                    decimalSeparator: '',
                    precision: 0),
            decoration: const InputDecoration(
              labelText: 'Nilai Liquidasi Tanah',
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
            'Bangunan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: FormBuilderTextField(
                  name: 'nilai_pasar_bangunan',
                  controller: controller.nilaiPasarBangunanEdit =
                      MoneyMaskedTextController(
                          initialValue: double.parse(data.nilaiPasarBangunan),
                          thousandSeparator: '.',
                          decimalSeparator: '',
                          precision: 0),
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar Bangunan',
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
                  name: 'persentase_bangunan',
                  controller: controller.persentaseBangunanEdit,
                  decoration: const InputDecoration(
                    labelText: 'Persen Bangunan',
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
            name: 'totalNilaiBangunan',
            enabled: false,
            controller: controller.nilaiLiquidasiBangunanEdit =
                MoneyMaskedTextController(
                    initialValue: double.parse(data.nilaiLiquidasiBangunan),
                    thousandSeparator: '.',
                    decimalSeparator: '',
                    precision: 0),
            decoration: const InputDecoration(
              labelText: 'Nilai Liquidasi Bangunan',
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
            'Total',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'nilai_pasar',
            enabled: false,
            controller: controller.nilaiPasarEdit = MoneyMaskedTextController(
                initialValue: double.parse(data.nilaiPasar),
                thousandSeparator: '.',
                decimalSeparator: '',
                precision: 0),
            decoration: const InputDecoration(
              labelText: 'Total Nilai Pasar',
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
            name: 'nilai_likuidasi',
            enabled: false,
            controller: controller.nilaiLiquidasiEdit =
                MoneyMaskedTextController(
                    initialValue: double.parse(data.nilaiLiquidasi),
                    thousandSeparator: '.',
                    decimalSeparator: '',
                    precision: 0),
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
            controller: controller.nilaiPengikatanEdit =
                MoneyMaskedTextController(
                    initialValue: double.parse(data.nilaiPengikatan),
                    thousandSeparator: '.',
                    decimalSeparator: '',
                    precision: 0),
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
                controller.yep();
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
            controller: controller.lokasiEdit =
                TextEditingController(text: data.lokasi),
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
            controller: controller.titikKoordinatEdit =
                TextEditingController(text: data.titikKoordinat),
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
                    return SizedBox(
                      child: OpenStreetMapSearchAndPick(
                          center: LatLong(-7.8013753, 110.3647927),
                          buttonColor: primaryColor,
                          buttonText: 'Pilih Lokasi',
                          onPicked: (pickedData) {
                            var latLongString =
                                '${pickedData.latLong.latitude}, ${pickedData.latLong.longitude}';
                            controller.lokasiEdit.text = pickedData.address;
                            controller.titikKoordinatEdit.text = latLongString;
                            Get.back();
                          }),
                    );
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
          FormBuilderTextField(
            name: 'deskripsi_panjang',
            controller: controller.deskripsiPanjangEdit =
                TextEditingController(text: data.deskripsiPanjang),
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
          Align(
            alignment: Alignment.bottomRight,
            child: GFButton(
              onPressed: () {
                controller.generateDeskripsiEdit();
              },
              text: 'Generate Deskripsi',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.updateAgunanTanahBangunan(data.agunanId,
                      controller.listAgunanTanahBangunan[index].id);

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
              'Form Tambah Agunan Tanah Bangunan',
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
            name: 'nama_pemilik',
            controller: controller.namaPemilik,
            decoration: const InputDecoration(
              labelText: 'Nama Pemilik',
              hintText: 'Novian Andika',
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
          const Text(
            'Tanah',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: FormBuilderTextField(
                  name: 'nilai_pasar_tanah',
                  controller: controller.nilaiPasarTanah,
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar Tanah',
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
                  name: 'persentase_tanah',
                  controller: controller.persentaseTanah,
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
            name: 'nilaiLiquidasiTanah',
            enabled: false,
            controller: controller.nilaiLiquidasiTanah,
            decoration: const InputDecoration(
              labelText: 'Nilai Liquidasi Tanah',
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
            'Bangunan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: FormBuilderTextField(
                  name: 'nilai_pasar_bangunan',
                  controller: controller.nilaiPasarBangunan,
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar Bangunan',
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
                  name: 'persentase_bangunan',
                  controller: controller.persentaseBangunan,
                  decoration: const InputDecoration(
                    labelText: 'Persen Bangunan',
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
            name: 'totalNilaiBangunan',
            enabled: false,
            controller: controller.nilaiLiquidasiBangunan,
            decoration: const InputDecoration(
              labelText: 'Nilai Liquidasi Bangunan',
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
            'Total',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'nilai_pasar',
            enabled: false,
            controller: controller.nilaiPasar,
            decoration: const InputDecoration(
              labelText: 'Total Nilai Pasar',
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
            name: 'nilai_likuidasi',
            enabled: false,
            controller: controller.nilaiLiquidasi,
            decoration: const InputDecoration(
              labelText: 'Total Nilai Likuidasi',
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
              labelText: 'Total Nilai Pengikatan',
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
                controller.boom();
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
          Align(
            alignment: Alignment.bottomRight,
            child: GFButton(
              onPressed: () {
                controller.generateDeskripsi();
              },
              text: 'Generate Deskripsi',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 20.0,
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
        ],
      ),
    );
  }
}

class ExamplePopup extends StatefulWidget {
  final Marker marker;

  const ExamplePopup(this.marker, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamplePopupState();
}

class _ExamplePopupState extends State<ExamplePopup> {
  final List<IconData> _icons = [
    FontAwesomeIcons.skull,
    FontAwesomeIcons.ghost,
    FontAwesomeIcons.skullCrossbones,
  ];
  int _currentIcon = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => setState(() {
          _currentIcon = (_currentIcon + 1) % _icons.length;
        }),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(_icons[_currentIcon]),
            ),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Lokasi Agunan',
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              'Position: ${widget.marker.point.latitude}, ${widget.marker.point.longitude}',
              style: const TextStyle(fontSize: 12.0),
            ),
            GFButton(
              onPressed: () async {
                await ml.MapLauncher.showMarker(
                  mapType: ml.MapType.google,
                  coords: ml.Coords(widget.marker.point.latitude,
                      widget.marker.point.longitude),
                  title: 'Lokasi Agunan',
                  description: 'Ini merupakan lokasi agunan',
                );
              },
              text: 'Open in Maps',
            ),
          ],
        ),
      ),
    );
  }
}
