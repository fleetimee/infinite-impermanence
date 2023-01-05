// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/analisa_agunan/menu_analisa_agunan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_form_dashboard.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/header_agunan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/select_agunan/menu_pilih_agunan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/bisnis.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/detail_debitur.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/jenis_usaha.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/karakter.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/keuangan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/syarat_lainnya.dart';
import 'package:akm/app/modules/insight_debitur/views/components/list_tile_printing.dart';
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/modules/usaha_analisis/controllers/usaha_analisis_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturView extends GetView<InsightDebiturController> {
  InsightDebiturView({Key? key}) : super(key: key);

  final neracaController = Get.put(InputNeracaController());
  final rugiLabaController = Get.put(RugiLabaController());
  final analisaKeuanganController = Get.put(KeuanganAnalisisController());
  final analisaBisnisController = Get.put(BisnisAnalisisController());
  final analisaKarakterController = Get.put(KarakterAnalisisController());
  final analisaJenisUsahaController = Get.put(UsahaAnalisisController());
  final selectAgunanController = Get.put(AgunanPilihController());
  final analisaAgunanController = Get.put(AgunanAnalisisController());

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
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshInsightDebitur();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(
                color: primaryColor,
              ),
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(500),
                        topRight: Radius.circular(500),
                      ),
                      color: secondaryColor),
                  // padding: const EdgeInsets.only(bottom: 25, top: 5),
                  width: double.maxFinite,
                ),
              ),
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                // background: FutureBuilder(
                //   future: controller.img,
                //   builder: (context, AsyncSnapshot snapshot) {
                //     if (snapshot.hasData) {
                //       return FancyShimmerImage(
                //         imageUrl: snapshot.data,
                //         boxFit: BoxFit.cover,
                //       );
                //     } else {
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //   },
                // ),
                background: Image.asset(
                  'assets/images/home/copyright.jpg',
                  fit: BoxFit.cover,
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
                        Row(
                          children: [
                            const Chip(label: Text('UMKM')),
                            const SizedBox(width: 5),
                            Obx(
                              () => controller.isDataLoading.value
                                  ? const Chip(label: Text('Loading...'))
                                  : Chip(
                                      label: Text(controller
                                          .insightDebitur.value.jenisUsaha
                                          .toString())),
                            ),
                            const SizedBox(width: 5),
                            Obx(
                              () => controller.isDataLoading.value
                                  ? const Chip(label: Text('Loading...'))
                                  : controller.insightDebitur.value
                                              .inputRugiLaba ==
                                          null
                                      ? const SizedBox.shrink()
                                      : double.parse(controller.insightDebitur
                                                  .value.inputRugiLaba!.omzet
                                                  .toString()) <=
                                              100000000
                                          ? const Chip(label: Text('Mikro'))
                                          : const Chip(label: Text('Kecil')),
                            ),
                            const SizedBox(width: 5),
                            const Chip(label: Text('Tetap')),
                            const SizedBox(width: 5),
                            Obx(
                              () => controller.isDataLoading.value
                                  ? const Chip(label: Text('Loading...'))
                                  : controller.insightDebitur.value.inputKeuangan ==
                                          null
                                      ? const SizedBox.shrink()
                                      : double.parse(controller.insightDebitur.value.inputKeuangan!.kreditDiusulkan.toString()) >
                                                  0 &&
                                              double.parse(controller
                                                      .insightDebitur
                                                      .value
                                                      .inputKeuangan!
                                                      .kreditDiusulkan
                                                      .toString()) <=
                                                  10000000
                                          ? const Chip(
                                              label: Text('KUR Super Mikro'))
                                          : double.parse(controller.insightDebitur.value.inputKeuangan!.kreditDiusulkan.toString()) >
                                                      10000000 &&
                                                  double.parse(controller
                                                          .insightDebitur
                                                          .value
                                                          .inputKeuangan!
                                                          .kreditDiusulkan
                                                          .toString()) <=
                                                      100000000
                                              ? const Chip(label: Text('KUR Mikro'))
                                              : const Chip(label: Text('KUR Kecil')),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
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
                                  'Di-input oleh ${auth.currentUser?.displayName ?? 'Admin'} pada ${DateFormat('dd MMMM yyyy').format(
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
                                        controller
                                            .insightDebitur.value.peminjam1
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
                              onPressed: () {
                                Get.toNamed(Routes.DEBITUR_EDIT,
                                    arguments: controller.insightDebitur.value);
                              },
                              icon: const Icon(FontAwesomeIcons.pencil),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.GALLERY_IMAGE,
                                    arguments: controller.insightDebitur.value);
                              },
                              icon: const Icon(
                                FontAwesomeIcons.photoFilm,
                              ),
                              enableFeedback: true,
                              color: primaryColor,
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.GALLERY_FILE,
                                    arguments: controller.insightDebitur.value);
                              },
                              icon: const Icon(
                                FontAwesomeIcons.folderOpen,
                              ),
                              enableFeedback: true,
                              color: primaryColor,
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
                                                  if (neracaController
                                                      .isNeracaProcessing
                                                      .value) {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  } else {
                                                    return PrintNeraca();
                                                  }
                                                },
                                              ),
                                              Obx(
                                                () {
                                                  if (rugiLabaController
                                                      .isRugiLabaProcessing
                                                      .value) {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  } else {
                                                    return PrintRugiLaba();
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
                                                    return PrintInput();
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
                                                    return PrintPutusan();
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
                                                    return PrintUsulan();
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
                                                    return PrintUsulanBaru();
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
                                                    return PrintKeuangan();
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
                                                    return BisnisPrint();
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
                                                  return KarakterPrint();
                                                }
                                              }),
                                              Obx(() {
                                                if (analisaAgunanController
                                                    .isAnalisaAgunanProcessing
                                                    .value) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return PrintAgunan();
                                                }
                                              }),
                                              Obx(
                                                () {
                                                  if (analisaJenisUsahaController
                                                      .isAnalisaUsahaProcessing
                                                      .value) {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  } else {
                                                    return JenisUsahaPrint();
                                                  }
                                                },
                                              ),
                                              ModelPrint(
                                                  controller: controller),
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
                  GFItemsCarousel(
                    rowCount: 3,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/home/keuangan_slider.jpg',
                                  fit: BoxFit.cover,
                                  height: 200.0,
                                  color: Colors.black.withOpacity(0.6),
                                  colorBlendMode: BlendMode.darken,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Text(
                                      'Keuangan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(
                                    () => controller.isDataLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : controller.insightDebitur.value
                                                    .analisaKeuangan ==
                                                null
                                            ? const Text(
                                                'N/A',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Text(
                                                controller
                                                    .insightDebitur
                                                    .value
                                                    .analisaKeuangan!
                                                    .totalCrrKeuangan
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/home/karakter_slider.jpg',
                                  fit: BoxFit.cover,
                                  height: 200.0,
                                  color: Colors.black.withOpacity(0.6),
                                  colorBlendMode: BlendMode.darken,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Text(
                                      'Karakter',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(
                                    () => controller.isDataLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : controller.insightDebitur.value
                                                    .analisaKarakter ==
                                                null
                                            ? const Text(
                                                'N/A',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Text(
                                                controller
                                                    .insightDebitur
                                                    .value
                                                    .analisaKarakter!
                                                    .totalCrrKarakter
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/home/bisnis_slider.jpg',
                                  fit: BoxFit.cover,
                                  height: 200.0,
                                  color: Colors.black.withOpacity(0.6),
                                  colorBlendMode: BlendMode.darken,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Text(
                                      'Bisnis',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(
                                    () => controller.isDataLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : controller.insightDebitur.value
                                                    .analisaBisnis ==
                                                null
                                            ? const Text(
                                                'N/A',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Text(
                                                double.parse(controller
                                                        .insightDebitur
                                                        .value
                                                        .analisaBisnis!
                                                        .hasilCrrBisnis
                                                        .toString())
                                                    .toStringAsFixed(1),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/home/usaha_slider.jpg',
                                  fit: BoxFit.cover,
                                  height: 200.0,
                                  color: Colors.black.withOpacity(0.6),
                                  colorBlendMode: BlendMode.darken,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Text(
                                      'Jenis Usaha',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(
                                    () => controller.isDataLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : controller.insightDebitur.value
                                                    .analisaJenisUsaha ==
                                                null
                                            ? const Text(
                                                'N/A',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Text(
                                                double.parse(controller
                                                        .insightDebitur
                                                        .value
                                                        .analisaJenisUsaha!
                                                        .totalCrrUsaha
                                                        .toString())
                                                    .toStringAsFixed(1),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/home/agunan_slider.jpg',
                                  fit: BoxFit.cover,
                                  height: 200.0,
                                  color: Colors.black.withOpacity(0.6),
                                  colorBlendMode: BlendMode.darken,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Text(
                                      'Agunan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(
                                    () => controller.isDataLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : controller.insightDebitur.value
                                                    .analisaAgunan ==
                                                null
                                            ? const Text(
                                                'N/A',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Text(
                                                double.parse(controller
                                                        .insightDebitur
                                                        .value
                                                        .analisaAgunan!
                                                        .totalCrrAgunan
                                                        .toString())
                                                    .toStringAsFixed(1),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Obx(
                      () => controller.isDataLoading.value
                          ? const GFLoader(
                              type: GFLoaderType.custom,
                              loaderIconOne: Text('Please'),
                              loaderIconTwo: Text('Wait'),
                              loaderIconThree: Text('a moment'),
                            )
                          : GFProgressBar(
                              percentage: double.parse(
                                controller.insightDebitur.value.progress
                                    .toString(),
                              ),
                              animation: true,
                              animateFromLastPercentage: true,
                              lineHeight: 20,
                              backgroundColor: Colors.black26,
                              progressBarColor: primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  '${(double.parse(controller.insightDebitur.value.progress.toString()) * 100).toStringAsFixed(0)} %',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => controller.isDataLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : controller
                                        .insightDebitur.value.analisaKeuangan !=
                                    null &&
                                controller
                                        .insightDebitur.value.analisaAgunan !=
                                    null &&
                                controller
                                        .insightDebitur.value.analisaBisnis !=
                                    null &&
                                controller.insightDebitur.value
                                        .analisaJenisUsaha !=
                                    null &&
                                controller
                                        .insightDebitur.value.analisaKarakter !=
                                    null &&
                                controller
                                    .insightDebitur.value.syaratLain!.isNotEmpty &&
                                controller.insightDebitur.value.asuransi !=
                                    null &&
                                controller
                                        .insightDebitur.value.ijinLegitimasi !=
                                    null &&
                                controller
                                    .insightDebitur.value.upload!.isNotEmpty
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: GFButton(
                                    onPressed: () {
                                      Get.toNamed(
                                        Routes.PENGAJUAN_SUBMIT_ANALIS,
                                        arguments:
                                            controller.insightDebitur.value,
                                      );
                                    },
                                    text: controller.insightDebitur.value
                                            .pengajuan!.isNotEmpty
                                        ? 'Kirim Pengajuan (lagi ?)'
                                        : 'Kirim Pengajuan',
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    fullWidthButton: true,
                                    color: primaryColor,
                                    shape: GFButtonShape.pills,
                                    size: 50),
                              )
                            : const SizedBox.shrink(),
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
                  // This is for dynamic widget
                  Obx(() {
                    if (controller.isAgunanLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 20,
                            ),
                            child: HeaderAgunan(),
                          ),
                          MenuPilihAgunan(),
                          MenuMasukFormAgunan(),
                          MenuAnalisaAgunan()
                        ],
                      );
                    }
                  }),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: HeaderSyarat(),
                      ),
                      MenuInputanSyarat(),
                      MenuInputIjin(),
                      MenuAsuransi(),
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
                                        controller.insightDebitur.value
                                                    .peminjam2
                                                    .toString() ==
                                                ''
                                            ? paddedText('-')
                                            : paddedText(
                                                controller.insightDebitur.value
                                                    .peminjam2
                                                    .toString(),
                                              ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Peminjam 3'),
                                        controller.insightDebitur.value
                                                    .peminjam3
                                                    .toString() ==
                                                ''
                                            ? paddedText('-')
                                            : paddedText(
                                                controller.insightDebitur.value
                                                    .peminjam3
                                                    .toString(),
                                              ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Peminjam 4'),
                                        controller.insightDebitur.value
                                                    .peminjam4
                                                    .toString() ==
                                                ''
                                            ? paddedText('-')
                                            : paddedText(
                                                controller.insightDebitur.value
                                                    .peminjam4
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
                                          controller
                                              .insightDebitur.value.alamat1
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Alamat 2'),
                                        paddedText(
                                          controller.insightDebitur.value
                                                      .alamat2
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
                                        paddedText('Alamat 3'),
                                        paddedText(
                                          controller.insightDebitur.value
                                                      .alamat3
                                                      .toString() ==
                                                  ''
                                              ? '-'
                                              : controller
                                                  .insightDebitur.value.alamat3
                                                  .toString(),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Alamat 4'),
                                        paddedText(
                                          controller.insightDebitur.value
                                                      .alamat4
                                                      .toString() ==
                                                  ''
                                              ? '-'
                                              : controller
                                                  .insightDebitur.value.alamat4
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
                                              : controller.insightDebitur.value
                                                  .pekerjaan2
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
                                    TableRow(
                                      children: [
                                        paddedText('No HP'),
                                        paddedText(
                                          controller.insightDebitur.value.noHp
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('NPWP'),
                                        controller.insightDebitur.value.npwp
                                                    .toString() ==
                                                ''
                                            ? paddedText('-')
                                            : paddedText(
                                                controller
                                                    .insightDebitur.value.npwp
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
                                          controller.insightDebitur.value
                                              .statusKeluarga
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
                                    TableRow(
                                      children: [
                                        paddedText('Jumlah Karyawan'),
                                        paddedText(
                                          controller.insightDebitur.value
                                              .jumlahKaryawan
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
