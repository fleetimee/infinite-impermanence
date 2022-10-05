import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/insight_debitur_controller.dart';

class InsightDebiturView extends GetView<InsightDebiturController> {
  InsightDebiturView({Key? key}) : super(key: key);

  final neracaController = Get.put(InputNeracaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: secondaryColor),
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                width: double.maxFinite,
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: FutureBuilder(
                future: controller.img,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return FancyShimmerImage(
                      imageUrl: snapshot.data,
                      boxFit: BoxFit.cover,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => controller.isDataLoading.value
                            ? const Text(
                                'Loading...',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                'Di-input oleh ${controller.insightDebitur.value.createdBy ?? 'Admin'} pada ${DateFormat('dd MMMM yyyy').format(
                                  DateTime.parse(controller
                                      .insightDebitur.value.tglSekarang
                                      .toString()),
                                )}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Obx(
                              () => controller.isDataLoading.value
                                  ? const Text('Loading...')
                                  : Text(
                                      controller.insightDebitur.value.peminjam1
                                          .toString(),
                                      style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                          const Icon(
                            FontAwesomeIcons.userNinja,
                            size: 30,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: HeaderKeuangan(),
                    ),
                    MenuNeraca(),
                    MenuRugiLaba(),
                    MenuInputKeuangan(),
                    MenuRugiLaba()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: HeaderDetailDebitur(controller: controller),
                ),
                Obx(
                  () => controller.isDataLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Data Pribadi',
                                style: detailDebiturHeading,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              // Table Data Pribadi
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                  1: FlexColumnWidth(1),
                                },
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                children: [
                                  TableRow(children: [
                                    paddedText('No. Debitur'),
                                    paddedText(controller
                                        .insightDebitur.value.noDebitur
                                        .toString()),
                                  ]),
                                  TableRow(
                                    children: [
                                      paddedText('Peminjam 1'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.peminjam1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Peminjam 2'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.peminjam2
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Asal KTP 1'),
                                      paddedText(
                                        controller.insightDebitur.value.ktp1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Asal KTP 2'),
                                      paddedText(
                                        controller.insightDebitur.value.ktp2
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Alamat 1'),
                                      paddedText(
                                        controller.insightDebitur.value.alamat1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Alamat 2'),
                                      paddedText(
                                        controller.insightDebitur.value.alamat2
                                                    .toString() ==
                                                ''
                                            ? '-'
                                            : controller
                                                .insightDebitur.value.alamat2
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('No. KTP 1'),
                                      paddedText(
                                        controller.insightDebitur.value.noKtp1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('No. KTP 2'),
                                      paddedText(
                                        controller.insightDebitur.value.noKtp2
                                                    .toString() ==
                                                ''
                                            ? '-'
                                            : controller
                                                .insightDebitur.value.noKtp2
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Pekerjaan 1'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.pekerjaan1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Pekerjaan 2'),
                                      paddedText(
                                        controller.insightDebitur.value
                                                    .pekerjaan2
                                                    .toString() ==
                                                ''
                                            ? '-'
                                            : controller
                                                .insightDebitur.value.pekerjaan2
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('TTL'),
                                      paddedText(
                                        '${controller.insightDebitur.value.tempatLahir.toString()}, ${DateFormat('dd MMMM yyyy').format(
                                          DateTime.parse(
                                            controller.insightDebitur.value
                                                .tanggalLahir
                                                .toString(),
                                          ),
                                        )}',
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Umur'),
                                      paddedText(
                                        controller.insightDebitur.value.umur
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Deskripsi'),
                                      paddedText(
                                        controller.insightDebitur.value
                                            .deskripsiDebitur
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Text(
                                'Data Agunan',
                                style: detailDebiturHeading,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                  1: FlexColumnWidth(1),
                                },
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                children: [
                                  TableRow(
                                    children: [
                                      paddedText('Pemilik Agunan 1'),
                                      paddedText(
                                        controller.insightDebitur.value
                                                    .pemilikAgunan1
                                                    .toString() ==
                                                ''
                                            ? '-'
                                            : controller.insightDebitur.value
                                                .pemilikAgunan1
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Pemilik Agunan 2'),
                                      paddedText(
                                        controller.insightDebitur.value
                                                    .pemilikAgunan2
                                                    .toString() ==
                                                ''
                                            ? '-'
                                            : controller.insightDebitur.value
                                                .pemilikAgunan2
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Text(
                                'Data Relasi',
                                style: detailDebiturHeading,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              // Table Relasi
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                  1: FlexColumnWidth(1),
                                },
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                children: [
                                  TableRow(
                                    children: [
                                      paddedText('Sts Keluarga'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.statusKeluarga
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Tanggungan'),
                                      paddedText(
                                        '${controller.insightDebitur.value.jumlahTanggungan.toString()} Orang',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Text(
                                'Data Pendidikan',
                                style: detailDebiturHeading,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              // Table Pendidikan
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                  1: FlexColumnWidth(1),
                                },
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                children: [
                                  TableRow(
                                    children: [
                                      paddedText('Pendidikan Terakhir'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.pendidikan
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Text(
                                'Data Usaha',
                                style: detailDebiturHeading,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              // Table Usaha
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                  1: FlexColumnWidth(1),
                                },
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                children: [
                                  TableRow(
                                    children: [
                                      paddedText('Lamanya Berusaha'),
                                      paddedText(
                                        '${controller.insightDebitur.value.lamanyaBerusaha.toString()} Tahun',
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Jenis Usaha'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.jenisUsaha
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Bidang Usaha'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.bidangUsaha
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Lokasi Usaha'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.lokasiUsaha
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderDetailDebitur extends StatelessWidget {
  const HeaderDetailDebitur({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TabBar(
        controller: controller.tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: primaryColor,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.userInjured,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Detail Debitur',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderKeuangan extends StatelessWidget {
  HeaderKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final neracaController = Get.put(InputNeracaController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TabBar(
        controller: controller.tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: primaryColor,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.paypal,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Keuangan',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuNeraca extends StatelessWidget {
  MenuNeraca({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final neracaController = Get.put(InputNeracaController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GFAccordion(
          titleChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Neraca',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(
                () {
                  if (neracaController.isNeracaProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.inputNeraca == null) {
                      return Row(
                        children: const [
                          Text(
                            'Belum di-input',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.red,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sudah di-input',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Obx(
                () {
                  if (neracaController.isNeracaProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.inputNeraca != null
                            ? const SizedBox()
                            : Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.INPUT_NERACA,
                                        arguments:
                                            controller.insightDebitur.value.id);
                                  },
                                  child: const Text(
                                    "Input",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        controller.insightDebitur.value.inputNeraca == null
                            ? const SizedBox()
                            : Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.LIHAT_NERACA,
                                        arguments: controller
                                            .insightDebitur.value.inputNeraca);
                                  },
                                  child: const Text(
                                    "Lihat",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        controller.insightDebitur.value.inputNeraca == null
                            ? const SizedBox()
                            : Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.EDIT_NERACA,
                                        arguments: controller
                                            .insightDebitur.value.inputNeraca);
                                  },
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}

class MenuRugiLaba extends StatelessWidget {
  MenuRugiLaba({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final rugiLabaController = Get.put(RugiLabaController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GFAccordion(
          titleChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Rugi / Laba',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Obx(
                () {
                  if (rugiLabaController.isRugiLabaProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.inputRugiLaba == null) {
                      return Row(
                        children: const [
                          Text(
                            'Belum di-input',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.red,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sudah di-input',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Obx(
                () {
                  if (rugiLabaController.isRugiLabaProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        //Check if neraca is empty
                        controller.insightDebitur.value.inputNeraca == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Get.snackbar('Error', 'Dibilangin batu',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  },
                                  child: const Text(
                                      "Input Neraca terlebih dahulu"),
                                ),
                              )
                            : controller.insightDebitur.value.inputRugiLaba !=
                                    null
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.VIEW_RUGI_LABA,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Lihat",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.EDIT_RUGI_LABA,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.RUGI_LABA,
                                            arguments: controller
                                                .insightDebitur.value);
                                      },
                                      child: const Text(
                                        "Input",
                                        style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}

class MenuInputKeuangan extends StatelessWidget {
  MenuInputKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final inputKeuanganController = Get.put(InputKeuanganController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GFAccordion(
          titleChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Input Keuangan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Obx(
                () {
                  if (inputKeuanganController.isInputKeuanganProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.inputKeuangan == null) {
                      return Row(
                        children: const [
                          Text(
                            'Belum di-input',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.red,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sudah di-input',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Obx(
                () {
                  if (inputKeuanganController.isInputKeuanganProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        //Check if neraca is empty
                        controller.insightDebitur.value.inputRugiLaba == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Get.snackbar('Error', 'Dibilangin batu',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  },
                                  child: const Text(
                                    "Input Rugi Laba terlebih dahulu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : controller.insightDebitur.value.inputKeuangan !=
                                    null
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.VIEW_RUGI_LABA,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Lihat",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.EDIT_RUGI_LABA,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.INPUT_KEUANGAN,
                                            arguments: controller
                                                .insightDebitur.value);
                                      },
                                      child: const Text(
                                        "Input",
                                        style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}

Widget paddedText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 17),
    ),
  );
}
