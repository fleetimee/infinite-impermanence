// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/widget/insight_debitur_carousel.dart';
import 'package:akm/app/modules/insight_debitur/widget/insight_debitur_top_section.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
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
                  InsightDebiturTopSection(
                    controller: controller,
                    neracaController: neracaController,
                    rugiLabaController: rugiLabaController,
                    analisaKeuanganController: analisaKeuanganController,
                    analisaBisnisController: analisaBisnisController,
                    analisaKarakterController: analisaKarakterController,
                    analisaJenisUsahaController: analisaJenisUsahaController,
                    selectAgunanController: selectAgunanController,
                    analisaAgunanController: analisaAgunanController,
                  ),
                  InsightDebiturCarousel(
                    controller: controller,
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
                                controller
                                        .insightDebitur.value.asuransi !=
                                    null &&
                                controller
                                        .insightDebitur.value.ijinLegitimasi !=
                                    null &&
                                controller
                                    .insightDebitur.value.upload!.isNotEmpty &&
                                controller.insightDebitur.value.progress ==
                                    '1.0'
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: GFButton(
                                    onPressed: controller.insightDebitur.value
                                            .pengajuan!.isNotEmpty
                                        ? () {
                                            Get.toNamed(
                                              Routes.PENGAJUAN_DETAIL,
                                              arguments: controller
                                                  .insightDebitur
                                                  .value
                                                  .pengajuan
                                                  ?.first
                                                  .id,
                                            );
                                          }
                                        : () {
                                            Get.toNamed(
                                              Routes.PENGAJUAN_SUBMIT_ANALIS,
                                              arguments: controller
                                                  .insightDebitur.value,
                                            );
                                          },
                                    text: controller.insightDebitur.value
                                            .pengajuan!.isNotEmpty
                                        ? 'Sudah Kirim Pengajuan'
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
                                    TableRow(
                                      children: [
                                        paddedText('ID'),
                                        paddedText(controller
                                            .insightDebitur.value.id
                                            .toString()),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('No. Debitur'),
                                        paddedText(controller
                                            .insightDebitur.value.noDebitur
                                            .toString()),
                                      ],
                                    ),
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
