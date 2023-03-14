// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as animasi;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numerus/numerus.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah_bangunan/views/list_agunan_tanah_bangunan_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/list_agunan_tanah_controller.dart';

class ListAgunanTanahView extends GetView<ListAgunanTanahController> {
  ListAgunanTanahView({Key? key}) : super(key: key);

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
        title: const Text('Agunan Tanah Yang Terdaftar'),
        actions: [
          Obx(() {
            if (controller.isAgunanTanahProcessing.value) {
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
                        name: Routes.LIST_AGUNAN_TANAH, arguments: data),
                    builder: (context) => FormTambahAgunanTanah(),
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
        if (controller.isAgunanTanahProcessing.value) {
          return const Center(
            child: BpdDiyLoader(),
          );
        } else {
          if (controller.listAgunanTanah.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.listAgunanTanah.length,
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
                                      controller.listAgunanTanah[index],
                                      index,
                                    ]),
                                builder: (context) => FormUbahAgunanTanah(),
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
                                        controller.deleteAgunanTanah(
                                            data.id,
                                            controller
                                                .listAgunanTanah[index].id);
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
                                'Agunan Tanah ${(index + 1).toRomanNumeralString()}',
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
                                                  .listAgunanTanah[index]
                                                  .titikKoordinat!
                                                  .split(',')[0]),
                                              double.parse(controller
                                                  .listAgunanTanah[index]
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
                                                          .listAgunanTanah[
                                                              index]
                                                          .titikKoordinat!
                                                          .split(',')[0]),
                                                      double.parse(controller
                                                          .listAgunanTanah[
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
                            controller.listAgunanTanah[index].deskripsiPendek
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
                                    controller
                                        .listAgunanTanah[index].namaPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Bukti Kepemilikan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanTanah[index].buktiKepemilikan
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Luas'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    '${controller.listAgunanTanah[index].luasTanah} m2',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Tanggal'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(DateFormat('dd/MM/yy').format(
                                      DateTime.parse(controller
                                          .listAgunanTanah[index].tanggal
                                          .toString())))
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Pasar'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                      'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanah[index].nilaiPasar.toString())).text}'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Nilai Likuidasi'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(controller.listAgunanTanah[index].nilaiLiquidasi.toString())).text}',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Lokasi'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanTanah[index].lokasi
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Pengikatan'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanTanah[index].pengikatan
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
                                    controller
                                        .listAgunanTanah[index].namaPemilik
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Alamat'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller.listAgunanTanah[index].lokasi
                                        .toString(),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  paddedTextTanah('Titik Koordinat'),
                                  paddedTextTanah(':'),
                                  paddedTextTanah(
                                    controller
                                        .listAgunanTanah[index].titikKoordinat
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
                                    controller
                                        .listAgunanTanah[index].deskripsiPanjang
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
            return Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Tidak ada data',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    Center(
                      child: animasi.Lottie.asset(
                        'assets/images/home/404.zip',
                        frameRate: animasi.FrameRate.max,
                        fit: BoxFit.cover,
                        repeat: true,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text(
                            'Gagal memuat animasi',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Tidak ada data agunan tanah yang terdaftar atau koneksi internet bermasalah',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          color: secondaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      }),
    );
  }
}

class FormUbahAgunanTanah extends StatelessWidget {
  FormUbahAgunanTanah({Key? key}) : super(key: key);

  final controller = Get.put(ListAgunanTanahController());
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
              'Form Ubah Agunan Tanah',
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
              child: FormUpdateAgunanTanah(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormUpdateAgunanTanah extends StatelessWidget {
  FormUpdateAgunanTanah({Key? key, required this.controller}) : super(key: key);

  final ListAgunanTanahController controller;
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
              prefixIcon: Icon(Icons.description),
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
              prefixIcon: Icon(Icons.person),
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
              prefixIcon: Icon(Icons.document_scanner),
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
            keyboardType: TextInputType.number,
            controller: controller.luasTanahEdit =
                TextEditingController(text: data.luasTanah.toString()),
            decoration: const InputDecoration(
              labelText: 'Luas Tanah',
              prefixIcon: Icon(Icons.square_foot),
              suffixText: 'M2',
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
              prefixIcon: Icon(Icons.calendar_today),
              suffixIcon: Icon(Icons.arrow_drop_down),
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
              prefixIcon: Icon(Icons.change_circle_outlined),
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
                  name: 'nilai_pasar_edit',
                  keyboardType: TextInputType.number,
                  controller: controller.nilaiPasarEdit =
                      MoneyMaskedTextController(
                          initialValue: double.parse(data.nilaiPasar),
                          thousandSeparator: '.',
                          decimalSeparator: '',
                          precision: 0),
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar',
                    prefixText: 'Rp. ',
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
                  name: 'persentase_edit',
                  keyboardType: TextInputType.number,
                  controller: controller.persentaseEdit,
                  decoration: const InputDecoration(
                    labelText: 'Persen',
                    suffixText: '%',
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
            controller: controller.nilaiLiquidasiEdit =
                MoneyMaskedTextController(
                    initialValue: double.parse(data.nilaiLiquidasi),
                    thousandSeparator: '.',
                    decimalSeparator: '',
                    precision: 0),
            decoration: const InputDecoration(
              labelText: 'Nilai Likuidasi',
              prefixText: 'Rp. ',
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
              prefixText: 'Rp. ',
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
                if (controller.formKey.currentState?.fields['nilai_pasar_edit']
                            ?.value !=
                        '' &&
                    controller.formKey.currentState?.fields['persentase_edit']
                            ?.value !=
                        '') {
                  controller.hitungNilaiLiquidasiEdit();
                } else {
                  Get.snackbar(
                    'Error',
                    'Nilai Pasar Tanah & Persentase Tidak Boleh Kosong',
                    icon: const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              text: 'Hitung Nilai Likuidasi',
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
              prefixIcon: Icon(Icons.location_searching),
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
                        center: LatLong(
                          double.parse(controller.homeController.latitude.value
                              .split(' ')[1]),
                          double.parse(controller
                              .homeController.longtitude.value
                              .split(' ')[1]),
                        ),
                        buttonColor: primaryColor,
                        buttonText: 'Pilih Lokasi',
                        onPicked: (pickedData) {
                          var latLongString =
                              '${pickedData.latLong.latitude}, ${pickedData.latLong.longitude}';
                          controller.lokasiEdit.text = pickedData.address;
                          controller.titikKoordinatEdit.text = latLongString;
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
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.updateAgunanTanah(
                      data.agunanId, controller.listAgunanTanah[index].id);

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
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}

class FormTambahAgunanTanah extends StatelessWidget {
  FormTambahAgunanTanah({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(ListAgunanTanahController());
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
              child: FormInputAgunanTanah(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormInputAgunanTanah extends StatelessWidget {
  FormInputAgunanTanah({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanTanahController controller;
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
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Keterangan',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.description),
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
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Nama Pemilik',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.person),
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
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Bukti Kepemilikan',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.document_scanner),
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
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.luasTanah,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            decoration: const InputDecoration(
              labelText: 'Luas Tanah',
              suffixText: 'M2',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.square_foot),
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.required(),
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
              prefixIcon: Icon(Icons.calendar_today),
              suffixIcon: Icon(Icons.arrow_drop_down),
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
            validator: FormBuilderValidators.required(),
            controller: controller.pengikatan,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Pengikatan',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.change_circle_outlined),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.required(),
                  controller: controller.nilaiPasar,
                  decoration: const InputDecoration(
                    labelText: 'Nilai Pasar',
                    alignLabelWithHint: true,
                    prefixText: 'Rp. ',
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(100),
                    FormBuilderValidators.min(0),
                    FormBuilderValidators.maxLength(3),
                  ]),
                  controller: controller.persentase,
                  decoration: const InputDecoration(
                    suffixText: '%',
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
            validator: FormBuilderValidators.required(),
            readOnly: true,
            controller: controller.nilaiLiquidasi,
            decoration: const InputDecoration(
              labelText: 'Nilai Likuidasi',
              alignLabelWithHint: true,
              prefixText: 'Rp. ',
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
            readOnly: true,
            controller: controller.nilaiPengikatan,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              prefixText: 'Rp. ',
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
                if (controller.formKey.currentState?.fields['nilai_pasar']
                            ?.value !=
                        '' &&
                    controller.formKey.currentState?.fields['persentase']
                            ?.value !=
                        '') {
                  controller.hitungNilaiLiquidasi();
                } else {
                  Get.snackbar(
                    'Error',
                    'Nilai Pasar Tanah & Persentase Tidak Boleh Kosong',
                    icon: const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              text: 'Hitung Nilai Likuidasi',
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
              labelText: 'Lokasi',
              hintText: 'Masukkan/Pilih Lokasi Agunan',
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
            validator: FormBuilderValidators.required(),
            controller: controller.titikKoordinat,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.location_searching),
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
                        center: LatLong(
                          double.parse(controller.homeController.latitude.value
                              .split(' ')[1]),
                          double.parse(controller
                              .homeController.longtitude.value
                              .split(' ')[1]),
                        ),
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
            maxLines: 7,
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
                  controller.saveAgunanTanah(data.id);

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

Widget paddedTextTanah(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );
}
