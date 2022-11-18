// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numerus/numerus.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
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
                    bounce: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    settings: RouteSettings(
                        name: Routes.LIST_AGUNAN_KENDARAAN, arguments: data),
                    builder: (context) => FormTambahAgunanKendaraan(),
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
              child: BpdDiyLoader(),
            );
          } else {
            if (controller.listAgunanKendaraan.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.listAgunanKendaraan.length,
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
                                        controller.listAgunanKendaraan[index],
                                        index,
                                      ]),
                                  builder: (context) =>
                                      FormUbahAgunanKendaraan(),
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
                                          controller.deleteAgunanKendaraan(
                                              data.id,
                                              controller
                                                  .listAgunanKendaraan[index]
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
                                      controller
                                          .listAgunanKendaraan[index].jenis
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
                                      controller
                                          .listAgunanKendaraan[index].warna
                                          .toString(),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    paddedTextTanah('Tahun'),
                                    paddedTextTanah(':'),
                                    paddedTextTanah(
                                      controller
                                          .listAgunanKendaraan[index].tahun
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
                                      controller
                                          .listAgunanKendaraan[index].noBpkb
                                          .toString(),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    paddedTextTanah('Atas Nama'),
                                    paddedTextTanah(':'),
                                    paddedTextTanah(
                                      controller.listAgunanKendaraan[index]
                                          .namaPemilik
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
                                      controller.listAgunanKendaraan[index]
                                          .namaPemilik
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
                        child: Lottie.asset(
                          'assets/images/home/404.zip',
                          frameRate: FrameRate.max,
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
                          'Tidak ada data agunan kendaraan yang terdaftar atau koneksi internet bermasalah',
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

class FormUbahAgunanKendaraan extends StatelessWidget {
  FormUbahAgunanKendaraan({Key? key}) : super(key: key);

  final controller = Get.put(ListAgunanKendaraanController());
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
              child: FormUpdateAgunanKendaraan(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormUpdateAgunanKendaraan extends StatelessWidget {
  FormUpdateAgunanKendaraan({Key? key, required this.controller})
      : super(key: key);

  final ListAgunanKendaraanController controller;
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
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown(
                  name: 'jenis',
                  initialValue: data.jenis,
                  items: controller.jenisKendaraanList.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kendaraan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    controller.jenisKendaraanEdit = value.toString();
                    debugPrint(value.toString());
                  },
                  onSaved: (value) {
                    controller.jenisKendaraanEdit = value.toString();
                    debugPrint(value.toString());
                  },
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'merk',
                  controller: controller.merkEdit = TextEditingController(
                    text: data.merk,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Merk',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'type',
                  controller: controller.typeEdit = TextEditingController(
                    text: data.type,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Type',
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
                  name: 'warna',
                  controller: controller.warnaEdit = TextEditingController(
                    text: data.warna,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Warna',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'tahun',
                  controller: controller.tahunEdit = TextEditingController(
                    text: data.tahun.toString(),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Tahun',
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
                  name: 'no_polisi',
                  controller: controller.noPolisiEdit = TextEditingController(
                    text: data.noPolisi,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'No Polisi',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'no_rangka',
                  controller: controller.noRangkaEdit = TextEditingController(
                    text: data.noRangka,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'No Rangka',
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
                  name: 'no_mesin',
                  controller: controller.noMesinEdit = TextEditingController(
                    text: data.noMesin,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'No Mesin',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'no_bpkb',
                  controller: controller.noBpkbEdit = TextEditingController(
                    text: data.noBpkb,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'No BPKB',
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
                  name: 'kondisi',
                  controller: controller.keadaanEdit = TextEditingController(
                    text: data.kondisi,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Kondisi',
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
            name: 'nama_pemilik',
            controller: controller.atasNamaEdit = TextEditingController(
              text: data.namaPemilik,
            ),
            decoration: const InputDecoration(
              labelText: 'Atas Nama',
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
                  controller: controller.nilaiPasarEdit =
                      MoneyMaskedTextController(
                    decimalSeparator: '',
                    thousandSeparator: '.',
                    precision: 0,
                    initialValue: double.parse(data.nilaiPasar),
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
                controller.hitungNilaiLiquidasiEdit();
              },
              text: 'Hitung Nilai Liquidasi',
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
            readOnly: true,
            controller: controller.deskripsiPanjangEdit =
                TextEditingController(text: data.deskripsiPanjang),
            maxLines: 5,
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
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.updateAgunanKendaraan(
                      data.agunanId, controller.listAgunanKendaraan[index].id);
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

class FormTambahAgunanKendaraan extends StatelessWidget {
  FormTambahAgunanKendaraan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(ListAgunanKendaraanController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Form Tambah Agunan Kendaraan',
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
              child: FormInputAgunanKendaraan(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}

class FormInputAgunanKendaraan extends StatelessWidget {
  FormInputAgunanKendaraan({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ListAgunanKendaraanController controller;
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
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown(
                  name: 'jenis',
                  items: controller.jenisKendaraanList.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kendaraan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    controller.jenisKendaraan = value.toString();
                    debugPrint(value.toString());
                  },
                  onSaved: (value) {
                    controller.jenisKendaraan = value.toString();
                    debugPrint(value.toString());
                  },
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'merk',
                  controller: controller.merk,
                  decoration: const InputDecoration(
                    labelText: 'Merk',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'type',
                  controller: controller.type,
                  decoration: const InputDecoration(
                    labelText: 'Type',
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
                  name: 'warna',
                  controller: controller.warna,
                  decoration: const InputDecoration(
                    labelText: 'Warna',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'tahun',
                  controller: controller.tahun,
                  decoration: const InputDecoration(
                    labelText: 'Tahun',
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
                  name: 'no_polisi',
                  controller: controller.noPolisi,
                  decoration: const InputDecoration(
                    labelText: 'No Polisi',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'no_rangka',
                  controller: controller.noRangka,
                  decoration: const InputDecoration(
                    labelText: 'No Rangka',
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
                  name: 'no_mesin',
                  controller: controller.noMesin,
                  decoration: const InputDecoration(
                    labelText: 'No Mesin',
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
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'no_bpkb',
                  controller: controller.noBpkb,
                  decoration: const InputDecoration(
                    labelText: 'No BPKB',
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
                  name: 'kondisi',
                  controller: controller.keadaan,
                  decoration: const InputDecoration(
                    labelText: 'Kondisi',
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
            name: 'nama_pemilik',
            controller: controller.atasNama,
            decoration: const InputDecoration(
              labelText: 'Atas Nama',
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
            readOnly: true,
            controller: controller.deskripsiPanjang,
            maxLines: 5,
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
          Center(
            child: GFButton(
              onPressed: () {
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.saveAgunanKendaraan(data.id);
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
