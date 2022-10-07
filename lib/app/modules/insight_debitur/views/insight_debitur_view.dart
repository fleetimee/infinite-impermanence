import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordions.dart';
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
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
  final analisaKarakterController = Get.put(KarakterAnalisisController());
  final analisaJenisUsahaController = Get.put(UsahaAnalisisController());

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
                                            Obx(() {
                                              if (analisaKarakterController
                                                  .isAnalisaKarakterProcessing
                                                  .value) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else {
                                                return GFListTile(
                                                  title: const Text(
                                                    'Karakter',
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
                                                      FontAwesomeIcons
                                                          .teamspeak,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                  subTitleText:
                                                      'Print hasil Analisa Karakter',
                                                  icon: controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaKarakter !=
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
                                                          buttonBoxShadow: true,
                                                          color:
                                                              GFColors.SUCCESS,
                                                        )
                                                      : GFButton(
                                                          onPressed: () {
                                                            Get.snackbar(
                                                              'Error',
                                                              'Data Karakter belum lengkap',
                                                              backgroundColor:
                                                                  Colors.red,
                                                              colorText:
                                                                  Colors.white,
                                                            );
                                                          },
                                                          text: "NOT READY",
                                                          buttonBoxShadow: true,
                                                          color:
                                                              GFColors.DANGER,
                                                        ),
                                                );
                                              }
                                            }),
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

Widget paddedText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 17),
    ),
  );
}
