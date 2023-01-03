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
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
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
import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_agunan_tanah_bangunan/views/list_agunan_tanah_bangunan_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
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
                    expand: true,
                    clipBehavior: Clip.antiAlias,
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
              child: BpdDiyLoader(),
            );
          } else {
            if (controller.listAgunanLos.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.listAgunanLos.length,
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
                                        controller.listAgunanLos[index],
                                        index,
                                      ]),
                                  builder: (context) => FormUbahAgunanKios(),
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
                                          controller.deleteAgunanLos(
                                              data.id,
                                              controller
                                                  .listAgunanLos[index].id);
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
                                  'Agunan Los (Kios Pasar) ${(index + 1).toRomanNumeralString()}',
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
                                                    .listAgunanLos[index]
                                                    .titikKoordinat!
                                                    .split(',')[0]),
                                                double.parse(controller
                                                    .listAgunanLos[index]
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
                                                options:
                                                    PopupMarkerLayerOptions(
                                                  popupController: controller
                                                      .popupLayerController,
                                                  markers: [
                                                    Marker(
                                                      point: LatLng(
                                                        // Split string to get latitude and longitude
                                                        double.parse(controller
                                                            .listAgunanLos[
                                                                index]
                                                            .titikKoordinat!
                                                            .split(',')[0]),
                                                        double.parse(controller
                                                            .listAgunanLos[
                                                                index]
                                                            .titikKoordinat!
                                                            .split(',')[1]),
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      builder: (_) =>
                                                          const Icon(
                                                        Icons.location_on,
                                                        size: 50,
                                                        color: GFColors.DANGER,
                                                      ),
                                                      anchorPos:
                                                          AnchorPos.align(
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
                                      controller
                                          .listAgunanLos[index].namaPemilik
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
                                    paddedTextTanah('Komponen'),
                                    paddedTextTanah(':'),
                                    paddedTextTanah(
                                      controller.listAgunanLos[index].komponen
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
                                      controller
                                          .listAgunanLos[index].noRegistrasi
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
                                              .listAgunanLos[index]
                                              .berlakuSampai
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
                                          controller.listAgunanLos[index]
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
                                    paddedTextTanah('Lokasi Pasar'),
                                    paddedTextTanah(':'),
                                    paddedTextTanah(
                                      controller
                                          .listAgunanLos[index].lokasiPasar
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
                                          .listAgunanLos[index].titikKoordinat
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
                                          .listAgunanLos[index].namaPemilik
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
                          'Tidak ada data agunan kios yang terdaftar atau koneksi internet bermasalah',
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
        },
      ),
    );
  }
}

class FormUbahAgunanKios extends StatelessWidget {
  FormUbahAgunanKios({Key? key}) : super(key: key);

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
              'Form Ubah Agunan Kios',
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
              child: FormUpdateAgunanKios(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormUpdateAgunanKios extends StatelessWidget {
  FormUpdateAgunanKios({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanLosController controller;
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
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.deskripsiPendekEdit = TextEditingController(
              text: data.deskripsiPendek,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.description),
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
            name: 'komponen',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.komponenEdit = TextEditingController(
              text: data.komponen,
            ),
            decoration: const InputDecoration(
              labelText: 'Komponen',
              prefixIcon: Icon(Icons.settings_input_component),
              hintText: 'KBP.',
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
            name: 'tempat_dasaran',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.tempatDasaranEdit = TextEditingController(
              text: data.tempatDasaran,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.home_mini),
              labelText: 'Tempat Dasaran',
              alignLabelWithHint: true,
              hintText: '4Los2C',
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
            name: 'no_registrasi',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.noRegistrasiEdit = TextEditingController(
              text: data.noRegistrasi,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.confirmation_number),
              labelText: 'No Registrasi',
              hintText: '0017/LMPY/-/2021',
              alignLabelWithHint: true,
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
            name: 'luas',
            keyboardType: TextInputType.number,
            controller: controller.luasLosEdit = TextEditingController(
              text: data.luasLos.toString(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Luas',
              prefixIcon: Icon(Icons.square_foot),
              alignLabelWithHint: true,
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
            name: 'jenis_dagangan',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.jenisDaganganEdit = TextEditingController(
              text: data.jenisDagangan,
            ),
            decoration: const InputDecoration(
              labelText: 'Jenis Dagangan',
              prefixIcon: Icon(Icons.shopping_bag),
              alignLabelWithHint: true,
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
          Row(
            children: [
              Expanded(
                child: FormBuilderDateTimePicker(
                  initialValue: // convert HH:MM:SS to DateTime
                      DateTime.parse('2021-01-01 ${data.waktuBuka}.000'),
                  name: 'waktu_buka',
                  validator: FormBuilderValidators.required(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  helpText: 'Waktu Buka',
                  inputType: InputType.time,
                  format: DateFormat('HH:mm'),
                  currentDate: DateTime.now(),
                  enableInteractiveSelection: true,
                  initialTime: TimeOfDay.now(),
                  onSaved: (value) {
                    controller.waktuBukaEdit = value!;
                  },
                  onChanged: (value) {
                    controller.waktuBukaEdit = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Waktu Buka',
                    prefixIcon: Icon(Icons.access_time),
                    alignLabelWithHint: true,
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
                child: FormBuilderDateTimePicker(
                  initialValue: // convert HH:MM:SS to DateTime
                      DateTime.parse('2021-01-01 ${data.waktuTutup}.000'),
                  name: 'waktu_tutup',
                  validator: FormBuilderValidators.required(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  helpText: 'Waktu Tutup',
                  inputType: InputType.time,
                  format: DateFormat('HH:mm'),
                  currentDate: DateTime.now(),
                  enableInteractiveSelection: true,
                  initialTime: TimeOfDay.now(),
                  onSaved: (value) {
                    controller.waktuTutupEdit = value!;
                  },
                  onChanged: (value) {
                    controller.waktuTutupEdit = value!;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.access_time),
                    labelText: 'Waktu Tutup',
                    alignLabelWithHint: true,
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
          FormBuilderDateTimePicker(
            initialValue: data.berlakuSampai,
            name: 'berlaku_sampai',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.berlakuSampaiEdit = value!;
              debugPrint(value.toString());
            },
            onSaved: (value) {
              controller.berlakuSampaiEdit = value!;
              debugPrint(value.toString());
            },
            errorFormatText: 'Format tanggal salah',
            errorInvalidText: 'Tanggal tidak valid',
            inputType: InputType.date,
            decoration: const InputDecoration(
              labelText: 'Berlaku Sampai',
              prefixIcon: Icon(Icons.calendar_today),
              suffixIcon: Icon(Icons.arrow_drop_down),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            format: DateFormat('EEE, dd MMMM yyyy'),
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'lokasi_pasar',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.lokasiPasarEdit = TextEditingController(
              text: data.lokasiPasar,
            ),
            maxLines: 3,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.location_on),
              labelText: 'Lokasi Pasar',
              alignLabelWithHint: true,
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
            controller: controller.titikKoordinatEdit = TextEditingController(
              text: data.titikKoordinat,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.location_searching),
              labelText: 'Titik Koordinat',
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
                          controller.titikKoordinatEdit.text = latLongString;
                          controller.lokasiPasarEdit.text = pickedData.address;

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
                  controller: controller.nilaiPasarEdit =
                      MoneyMaskedTextController(
                          initialValue:
                              double.parse(data.nilaiPasar.toString()),
                          thousandSeparator: '.',
                          decimalSeparator: '',
                          precision: 0),
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
            name: 'nilai_likuidasi',
            enabled: false,
            controller: controller.nilaiLiquidasiEdit =
                MoneyMaskedTextController(
                    initialValue: double.parse(data.nilaiLiquidasi.toString()),
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
                    initialValue: double.parse(data.nilaiPengikatan.toString()),
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
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'pengikatan',
            controller: controller.pengikatanEdit = TextEditingController(
              text: data.pengikatan,
            ),
            decoration: const InputDecoration(
              labelText: 'Pengikatan',
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
          const Text(
            'Detail Pemilik',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FormBuilderTextField(
            name: 'atas_nama',
            controller: controller.namaPemilikEdit = TextEditingController(
              text: data.namaPemilik,
            ),
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
          Row(
            children: [
              Expanded(
                child: FormBuilderSearchableDropdown<String>(
                  name: 'tempat_lahir',
                  initialValue: data.tempatLahir,
                  onChanged: (value) {
                    controller.tempatLahirEdit.text = value!;
                    debugPrint(value);
                  },
                  onSaved: (value) {
                    controller.tempatLahirEdit.text = value!;
                    debugPrint(value);
                  },
                  validator: FormBuilderValidators.required(),
                  items: allProvinsi,
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: 'Search',
                    labelText: 'Search',
                  ),
                  filterFn: (provinsi, filter) =>
                      provinsi.toLowerCase().contains(filter.toLowerCase()),
                  decoration: const InputDecoration(
                    labelText: 'Tempat Lahir',
                    alignLabelWithHint: true,
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
                child: FormBuilderDateTimePicker(
                  name: 'tanggal_lahir',
                  initialValue: data.tanggalLahir,
                  onChanged: (value) {
                    controller.tanggalLahirEdit = value!;
                    debugPrint(value.toString());
                  },
                  onSaved: (value) {
                    controller.tanggalLahirEdit = value!;
                    debugPrint(value.toString());
                  },
                  errorFormatText: 'Format tanggal salah',
                  errorInvalidText: 'Tanggal tidak valid',
                  inputType: InputType.date,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  format: DateFormat('dd MMMM yyyy'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'Alamat',
            controller: controller.alamatEdit = TextEditingController(
              text: data.alamatPemilik,
            ),
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Alamat Pemilik',
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
                          controller.alamat.text = pickedData.address;
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
            name: 'summary',
            readOnly: true,
            controller: controller.deskripsiPanjangEdit = TextEditingController(
              text: data.deskripsiPanjang,
            ),
            maxLines: 14,
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
                controller.generateDescriptionEdit();
              },
              text: 'Generate Deskripsi',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.updateAgunanLos(
                      data.agunanId, controller.listAgunanLos[index].id);
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
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.deskripsiPendek,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.description),
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
            name: 'komponen',
            controller: controller.komponen,
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Komponen',
              prefixIcon: Icon(Icons.settings_input_component),
              hintText: 'KBP.',
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
            name: 'tempat_dasaran',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.tempatDasaran,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.home_mini),
              labelText: 'Tempat Dasaran',
              alignLabelWithHint: true,
              hintText: '4Los2C',
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
            name: 'no_registrasi',
            controller: controller.noRegistrasi,
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.confirmation_number),
              labelText: 'No Registrasi',
              hintText: '0017/LMPY/-/2021',
              alignLabelWithHint: true,
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
            name: 'luas',
            keyboardType: TextInputType.number,
            controller: controller.luasLos,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Luas',
              prefixIcon: Icon(Icons.square_foot),
              alignLabelWithHint: true,
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
            name: 'jenis_dagangan',
            controller: controller.jenisDagangan,
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.shopping_bag),
              labelText: 'Jenis Dagangan',
              alignLabelWithHint: true,
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
          Row(
            children: [
              Expanded(
                child: FormBuilderDateTimePicker(
                  name: 'waktu_buka',
                  helpText: 'Waktu Buka',
                  validator: FormBuilderValidators.required(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputType: InputType.time,
                  format: DateFormat('HH:mm'),
                  currentDate: DateTime.now(),
                  enableInteractiveSelection: true,
                  initialTime: TimeOfDay.now(),
                  onSaved: (value) {
                    controller.waktuBuka = value!;
                  },
                  onChanged: (value) {
                    controller.waktuBuka = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Waktu Buka',
                    prefixIcon: Icon(Icons.access_time),
                    alignLabelWithHint: true,
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
                child: FormBuilderDateTimePicker(
                  name: 'waktu_tutup',
                  validator: FormBuilderValidators.required(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  helpText: 'Waktu Tutup',
                  inputType: InputType.time,
                  format: DateFormat('HH:mm'),
                  currentDate: DateTime.now(),
                  enableInteractiveSelection: true,
                  initialTime: TimeOfDay.now(),
                  onSaved: (value) {
                    controller.waktuTutup = value!;
                  },
                  onChanged: (value) {
                    controller.waktuTutup = value!;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.access_time),
                    labelText: 'Waktu Tutup',
                    alignLabelWithHint: true,
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
          FormBuilderDateTimePicker(
            name: 'berlaku_sampai',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.berlakuSampai = value!;
              debugPrint(value.toString());
            },
            errorFormatText: 'Format tanggal salah',
            errorInvalidText: 'Tanggal tidak valid',
            inputType: InputType.date,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.calendar_today),
              suffixIcon: Icon(Icons.arrow_drop_down),
              labelText: 'Berlaku Sampai',
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            format: DateFormat('EEE, dd MMMM yyyy'),
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'lokasi_pasar',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.lokasiPasar,
            maxLines: 3,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.location_on),
              labelText: 'Lokasi Pasar',
              alignLabelWithHint: true,
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
              prefixIcon: Icon(Icons.location_searching),
              labelText: 'Titik Koordinat',
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
                          controller.titikKoordinat.text = latLongString;
                          controller.lokasiPasar.text = pickedData.address;

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
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.required(),
                  decoration: const InputDecoration(
                    prefixText: 'Rp. ',
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
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(100),
                    FormBuilderValidators.min(0),
                  ]),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.persentase,
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
            readOnly: true,
            controller: controller.nilaiLiquidasi,
            decoration: const InputDecoration(
              prefixText: 'Rp. ',
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
            readOnly: true,
            controller: controller.nilaiPengikatan,
            decoration: const InputDecoration(
              prefixText: 'Rp. ',
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
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.pengikatan,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.bookmark_outlined),
              labelText: 'Pengikatan',
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
              text: 'Hitung Nilai Liquidasi',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const Text(
            'Detail Pemilik',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FormBuilderTextField(
            name: 'atas_nama',
            validator: FormBuilderValidators.required(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.namaPemilik,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
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
          Row(
            children: [
              Expanded(
                child: FormBuilderSearchableDropdown<String>(
                  name: 'tempat_lahir',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    controller.tempatLahir.text = value!;
                    debugPrint(value);
                  },
                  onSaved: (value) {
                    controller.tempatLahir.text = value!;
                    debugPrint(value);
                  },
                  validator: FormBuilderValidators.required(),
                  items: allProvinsi,
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: 'Search',
                    labelText: 'Search',
                  ),
                  filterFn: (provinsi, filter) =>
                      provinsi.toLowerCase().contains(filter.toLowerCase()),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    labelText: 'Tempat Lahir',
                    alignLabelWithHint: true,
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
                child: FormBuilderDateTimePicker(
                  name: 'tanggal_lahir',
                  validator: FormBuilderValidators.required(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    controller.tanggalLahir = value!;
                    debugPrint(value.toString());
                  },
                  errorFormatText: 'Format tanggal salah',
                  errorInvalidText: 'Tanggal tidak valid',
                  inputType: InputType.date,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    labelText: 'Tanggal Lahir',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  format: DateFormat('dd MMMM yyyy'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          FormBuilderTextField(
            name: 'Alamat',
            controller: controller.alamat,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Alamat Pemilik',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.location_on_outlined),
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
                          controller.alamat.text = pickedData.address;
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
            name: 'summary',
            readOnly: true,
            controller: controller.deskripsiPanjang,
            maxLines: 14,
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
                controller.generateDescription();
              },
              text: 'Generate Deskripsi',
              elevation: 10,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.saveAgunanLos(data.id);
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
