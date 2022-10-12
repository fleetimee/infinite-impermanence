// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numerus/numerus.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
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
            name: 'komponen',
            controller: controller.komponen,
            decoration: const InputDecoration(
              labelText: 'Komponen',
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
            controller: controller.tempatDasaran,
            decoration: const InputDecoration(
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
            decoration: const InputDecoration(
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
            controller: controller.luasLos,
            decoration: const InputDecoration(
              labelText: 'Luas',
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
            decoration: const InputDecoration(
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
            onChanged: (value) {
              controller.berlakuSampai = value!;
              debugPrint(value.toString());
            },
            errorFormatText: 'Format tanggal salah',
            errorInvalidText: 'Tanggal tidak valid',
            inputType: InputType.date,
            decoration: const InputDecoration(
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
            controller: controller.lokasiPasar,
            maxLines: 3,
            decoration: const InputDecoration(
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
          Row(
            children: [
              Expanded(
                child: FormBuilderSearchableDropdown<String>(
                  name: 'tempat_lahir',
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
                  onChanged: (value) {
                    controller.tanggalLahir = value!;
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
            controller: controller.alamat,
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
