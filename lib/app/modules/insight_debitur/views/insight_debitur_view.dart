import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/modules/usaha_analisis/controllers/usaha_analisis_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../controllers/insight_debitur_controller.dart';

class InsightDebiturView extends GetView<InsightDebiturController> {
  InsightDebiturView({Key? key}) : super(key: key);

  final neracaController = Get.put(InputNeracaController());
  final analisaKeuanganController = Get.put(KeuanganAnalisisController());
  final analisaBisnisController = Get.put(BisnisAnalisisController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          secondaryColor,
          Colors.white60,
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(500),
                      topRight: Radius.circular(500),
                    ),
                    color: secondaryColor),
                padding: const EdgeInsets.only(bottom: 25, top: 5),
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
                          IconButton(
                            color: primaryColor,
                            enableFeedback: true,
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.pencil),
                          ),
                          IconButton(
                            color: primaryColor,
                            enableFeedback: true,
                            onPressed: () {
                              showBarModalBottomSheet(
                                bounce: true,
                                backgroundColor: secondaryColor,
                                context: context,
                                builder: (context) => SizedBox(
                                  height: 650,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const GFCard(
                                        boxFit: BoxFit.cover,
                                        titlePosition: GFPosition.start,
                                        showOverlayImage: true,
                                        imageOverlay: AssetImage(
                                          'assets/images/home/printing.jpg',
                                        ),
                                        colorFilter: ColorFilter.mode(
                                          Color.fromARGB(221, 8, 8, 8),
                                          BlendMode.darken,
                                        ),
                                        title: GFListTile(
                                          title: Text(
                                            'Printing Centre',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 47,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        content: Text(
                                          "Print berkas berkas mu disini, tetapi jangan lupa diinput dulu",
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView(
                                          children: [
                                            Obx(
                                              () {
                                                if (analisaKeuanganController
                                                    .isAnalisaKeuanganProcessing
                                                    .value) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return GFListTile(
                                                    title: const Text(
                                                      'Putusan',
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    avatar: const GFAvatar(
                                                      backgroundColor:
                                                          primaryColor,
                                                      child: Icon(
                                                        FontAwesomeIcons.rebel,
                                                        color: secondaryColor,
                                                      ),
                                                    ),
                                                    subTitleText:
                                                        'Print surat putusan',
                                                    icon: controller
                                                                .insightDebitur
                                                                .value
                                                                .analisaKeuangan !=
                                                            null
                                                        ? GFButton(
                                                            onPressed: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .PUTUSAN_PRINT,
                                                                  arguments:
                                                                      controller
                                                                          .insightDebitur
                                                                          .value);
                                                            },
                                                            text: "READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color: GFColors
                                                                .SUCCESS,
                                                          )
                                                        : GFButton(
                                                            onPressed: () {
                                                              Get.snackbar(
                                                                'Error',
                                                                'Data Keuangan belum lengkap',
                                                                backgroundColor:
                                                                    Colors.red,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                              );
                                                            },
                                                            text: "NOT READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color:
                                                                GFColors.DANGER,
                                                          ),
                                                  );
                                                }
                                              },
                                            ),
                                            Obx(
                                              () {
                                                if (analisaKeuanganController
                                                    .isAnalisaKeuanganProcessing
                                                    .value) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return GFListTile(
                                                    title: const Text(
                                                      'Usulan',
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    avatar: const GFAvatar(
                                                      backgroundColor:
                                                          primaryColor,
                                                      child: Icon(
                                                        FontAwesomeIcons.uikit,
                                                        color: secondaryColor,
                                                      ),
                                                    ),
                                                    subTitleText:
                                                        'Print surat usulan',
                                                    icon: controller
                                                                .insightDebitur
                                                                .value
                                                                .analisaKeuangan !=
                                                            null
                                                        ? GFButton(
                                                            onPressed: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .USULAN_BARU_PRINT,
                                                                  arguments:
                                                                      controller
                                                                          .insightDebitur
                                                                          .value);
                                                            },
                                                            text: "READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color: GFColors
                                                                .SUCCESS,
                                                          )
                                                        : GFButton(
                                                            onPressed: () {
                                                              Get.snackbar(
                                                                'Error',
                                                                'Data Keuangan belum lengkap',
                                                                backgroundColor:
                                                                    Colors.red,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                              );
                                                            },
                                                            text: "NOT READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color:
                                                                GFColors.DANGER,
                                                          ),
                                                  );
                                                }
                                              },
                                            ),
                                            Obx(
                                              () {
                                                if (analisaKeuanganController
                                                    .isAnalisaKeuanganProcessing
                                                    .value) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return GFListTile(
                                                    title: const Text(
                                                      'Keuangan',
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    avatar: const GFAvatar(
                                                      backgroundColor:
                                                          primaryColor,
                                                      child: Icon(
                                                        FontAwesomeIcons.gitlab,
                                                        color: secondaryColor,
                                                      ),
                                                    ),
                                                    subTitleText:
                                                        'Print hasil Analisa Keuangan',
                                                    icon: controller
                                                                .insightDebitur
                                                                .value
                                                                .analisaKeuangan !=
                                                            null
                                                        ? GFButton(
                                                            onPressed: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .KEUANGAN_PRINT,
                                                                  arguments:
                                                                      controller
                                                                          .insightDebitur
                                                                          .value);
                                                            },
                                                            text: "READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color: GFColors
                                                                .SUCCESS,
                                                          )
                                                        : GFButton(
                                                            onPressed: () {
                                                              Get.snackbar(
                                                                'Error',
                                                                'Data Keuangan belum lengkap',
                                                                backgroundColor:
                                                                    Colors.red,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                              );
                                                            },
                                                            text: "NOT READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color:
                                                                GFColors.DANGER,
                                                          ),
                                                  );
                                                }
                                              },
                                            ),
                                            Obx(
                                              () {
                                                if (analisaBisnisController
                                                    .isAnalisaBisnisProcessing
                                                    .value) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return GFListTile(
                                                    title: const Text(
                                                      'Bisnis',
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    avatar: const GFAvatar(
                                                      backgroundColor:
                                                          primaryColor,
                                                      child: Icon(
                                                        FontAwesomeIcons.docker,
                                                        color: secondaryColor,
                                                      ),
                                                    ),
                                                    subTitleText:
                                                        'Print hasil Analisa Bisnis',
                                                    icon: controller
                                                                .insightDebitur
                                                                .value
                                                                .analisaBisnis !=
                                                            null
                                                        ? GFButton(
                                                            onPressed: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .BISNIS_PRINT,
                                                                  arguments:
                                                                      controller
                                                                          .insightDebitur
                                                                          .value);
                                                            },
                                                            text: "READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color: GFColors
                                                                .SUCCESS,
                                                          )
                                                        : GFButton(
                                                            onPressed: () {
                                                              Get.snackbar(
                                                                'Error',
                                                                'Data Bisnis belum lengkap',
                                                                backgroundColor:
                                                                    Colors.red,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                              );
                                                            },
                                                            text: "NOT READY",
                                                            buttonBoxShadow:
                                                                true,
                                                            color:
                                                                GFColors.DANGER,
                                                          ),
                                                  );
                                                }
                                              },
                                            ),
                                            // TODO: Lanjut disini
                                            GFListTile(
                                              title: const Text(
                                                'Karakter',
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              avatar: const GFAvatar(
                                                backgroundColor: primaryColor,
                                                child: Icon(
                                                  FontAwesomeIcons.teamspeak,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              subTitleText:
                                                  'Print hasil Analisa Karakter',
                                              icon: GFButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes.BISNIS_PRINT,
                                                      arguments: controller
                                                          .insightDebitur
                                                          .value);
                                                },
                                                text: "READY",
                                                buttonBoxShadow: true,
                                                color: GFColors.SUCCESS,
                                              ),
                                            ),
                                            GFListTile(
                                              title: const Text(
                                                'Jenis Usaha',
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              avatar: const GFAvatar(
                                                backgroundColor: primaryColor,
                                                child: Icon(
                                                  FontAwesomeIcons.unity,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              subTitleText:
                                                  'Print hasil Analisa Jenis Usaha',
                                              icon: GFButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes.BISNIS_PRINT,
                                                      arguments: controller
                                                          .insightDebitur
                                                          .value);
                                                },
                                                text: "READY",
                                                buttonBoxShadow: true,
                                                color: GFColors.SUCCESS,
                                              ),
                                            ),
                                            GFListTile(
                                              title: const Text(
                                                'Model',
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              avatar: const GFAvatar(
                                                backgroundColor: primaryColor,
                                                child: Icon(
                                                  FontAwesomeIcons.pagelines,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              subTitleText:
                                                  'Print model bobot yang digunakan',
                                              icon: GFButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes.BISNIS_PRINT,
                                                      arguments: controller
                                                          .insightDebitur
                                                          .value);
                                                },
                                                text: "READY",
                                                buttonBoxShadow: true,
                                                color: GFColors.SUCCESS,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(FontAwesomeIcons.print),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 25,
                //   ),
                //   child: GFItemsCarousel(
                //       rowCount: 2,
                //       children: controller.imageList.map(
                //         (url) {
                //           return Container(
                //             margin: const EdgeInsets.all(5.0),
                //             child: ClipRRect(
                //               borderRadius:
                //                   const BorderRadius.all(Radius.circular(5.0)),
                //               child: Image.network(url,
                //                   fit: BoxFit.cover, width: 1000.0),
                //             ),
                //           );
                //         },
                //       ).toList()),
                // ),
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
                    MenuAnalisaKeuangan(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: HeaderKarakter(),
                    ),
                    MenuAnalisaKarakter(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: HeaderBisnis(),
                    ),
                    MenuAnalisaBisnis(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: HeaderJenisUsaha(),
                    ),
                    MenuAnalisaJenisUsaha(),
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

class HeaderJenisUsaha extends StatelessWidget {
  HeaderJenisUsaha({
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
                    FontAwesomeIcons.battleNet,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Jenis Usaha',
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

class HeaderKarakter extends StatelessWidget {
  HeaderKarakter({
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
                    FontAwesomeIcons.steam,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Karakter',
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

class HeaderBisnis extends StatelessWidget {
  HeaderBisnis({
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
                    FontAwesomeIcons.tiktok,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Bisnis',
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
                                    "Input Neraca terlebih dahulu",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 18,
                                    ),
                                  ),
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
                                              Get.toNamed(Routes.LIHAT_KEUANGAN,
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
                                              Get.toNamed(Routes.EDIT_KEUANGAN,
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

class MenuAnalisaKeuangan extends StatelessWidget {
  MenuAnalisaKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaKeuanganController = Get.put(KeuanganAnalisisController());

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
                'Analisa Keuangan',
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
                  if (analisaKeuanganController
                      .isKeuanganAnalisisProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaKeuangan ==
                        null) {
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
                  if (analisaKeuanganController
                      .isKeuanganAnalisisProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        //Check if neraca is empty
                        controller.insightDebitur.value.inputKeuangan == null
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
                                    "Input Keuangan terlebih dahulu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : controller.insightDebitur.value.analisaKeuangan !=
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
                                              Get.toNamed(
                                                  Routes
                                                      .LIHAT_KEUANGAN_ANALISIS,
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
                                              Get.toNamed(
                                                  Routes.EDIT_KEUANGAN_ANALISIS,
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
                                        Get.toNamed(Routes.KEUANGAN_ANALISIS,
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

class MenuAnalisaKarakter extends StatelessWidget {
  MenuAnalisaKarakter({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaKarakterController = Get.put(KarakterAnalisisController());

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
                'Analisa Karakter',
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
                  if (analisaKarakterController
                      .isAnalisaKarakterProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaKarakter ==
                        null) {
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
                  if (analisaKarakterController
                      .isAnalisaKarakterProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.analisaKarakter == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.KARAKTER_ANALISIS,
                                        arguments:
                                            controller.insightDebitur.value);
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
                              )
                            : Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          Get.toNamed(
                                              Routes.LIHAT_KARAKTER_ANALISIS,
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
                                          Get.toNamed(
                                              Routes.EDIT_KARAKTER_ANALISIS,
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

class MenuAnalisaBisnis extends StatelessWidget {
  MenuAnalisaBisnis({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaKarakterController = Get.put(KarakterAnalisisController());
  final analisaBisnisController = Get.put(BisnisAnalisisController());

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
                'Analisa Bisnis',
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
                  if (analisaBisnisController.isAnalisaBisnisProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaBisnis == null) {
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
                  if (analisaBisnisController.isAnalisaBisnisProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.analisaBisnis == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.BISNIS_ANALISIS,
                                        arguments:
                                            controller.insightDebitur.value);
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
                              )
                            : Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          Get.toNamed(
                                              Routes.LIHAT_BISNIS_ANALISIS,
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
                                          Get.toNamed(
                                              Routes.EDIT_BISNIS_ANALISIS,
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

class MenuAnalisaJenisUsaha extends StatelessWidget {
  MenuAnalisaJenisUsaha({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaKarakterController = Get.put(KarakterAnalisisController());
  final analisaBisnisController = Get.put(BisnisAnalisisController());
  final analisaJenisUsahaController = Get.put(UsahaAnalisisController());

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
                'Analisa Jenis Usaha',
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
                  if (analisaJenisUsahaController
                      .isAnalisaUsahaProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaJenisUsaha ==
                        null) {
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
                  if (analisaJenisUsahaController
                      .isAnalisaUsahaProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.analisaJenisUsaha ==
                                null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.USAHA_ANALISIS,
                                        arguments:
                                            controller.insightDebitur.value);
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
                              )
                            : Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          Get.toNamed(
                                              Routes.LIHAT_USAHA_ANALISIS,
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
                                          Get.toNamed(
                                              Routes.EDIT_USAHA_ANALISIS,
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
