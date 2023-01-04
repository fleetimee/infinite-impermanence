// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timeline_tile/timeline_tile.dart';

// 🌎 Project imports:
import '../../insight_debitur/views/insight_debitur_view.dart';
import '../controllers/pengajuan_detail_controller.dart';

class PengajuanDetailView extends GetView<PengajuanDetailController> {
  const PengajuanDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => controller.isPenganjuanDetailLoading.value
              ? const Text('Loading...')
              : Text('Tracking: ${controller.pengajuanDetail.value.id!}'),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Obx(() => GFButton(
                            icon: Icon(
                              controller.pengajuanDetail.value.status ==
                                      'PENDING'
                                  ? Icons.pending_actions_outlined
                                  : controller.pengajuanDetail.value.status ==
                                          'REVIEWED'
                                      ? Icons.pentagon
                                      : controller.pengajuanDetail.value
                                                  .status ==
                                              'DONE'
                                          ? Icons.done_all_outlined
                                          : Icons.error_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                            text: controller.isPenganjuanDetailLoading.value
                                ? 'Loading...'
                                : controller.pengajuanDetail.value.status!,
                            color: controller.pengajuanDetail.value.status ==
                                    'PENDING'
                                ? GFColors.DARK
                                : controller.pengajuanDetail.value.status ==
                                        'REVIEWED'
                                    ? GFColors.WARNING
                                    : controller.pengajuanDetail.value.status ==
                                            'DONE'
                                        ? GFColors.SUCCESS
                                        : GFColors.DANGER,
                            size: GFSize.LARGE,
                          ))
                    ],
                  ),
                  // vertical divider
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'No. Pengajuan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Obx(
                        () => GFButton(
                          icon: const Icon(
                            Icons.numbers_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          text: controller.isPenganjuanDetailLoading.value
                              ? 'Loading...'
                              : controller.pengajuanDetail.value.id!,
                          color: GFColors.INFO,
                          size: GFSize.LARGE,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.40),
                      1: FlexColumnWidth(0.60),
                    },
                    children: [
                      TableRow(
                        children: [
                          paddedText('Nama Debitur'),
                          paddedText(controller.isPenganjuanDetailLoading.value
                              ? 'Loading...'
                              : controller
                                  .pengajuanDetail.value.debitur!.peminjam1!),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Obx(
                    () => Container(
                      padding:
                          const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.40),
                          1: FlexColumnWidth(0.60),
                        },
                        children: [
                          TableRow(
                            children: [
                              paddedText('Nama Analis'),
                              paddedText(
                                  controller.isPenganjuanDetailLoading.value
                                      ? 'Loading...'
                                      : controller.pengajuanDetail.value
                                          .user![0].displayName!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding:
                          const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.40),
                          1: FlexColumnWidth(0.60),
                        },
                        children: [
                          TableRow(
                            children: [
                              paddedText('Nama Reviewer'),
                              paddedText(
                                  controller.isPenganjuanDetailLoading.value
                                      ? 'Loading...'
                                      : controller.pengajuanDetail.value.user!
                                                  .length <
                                              2
                                          ? '-'
                                          : controller.pengajuanDetail.value
                                              .user![1].displayName!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding:
                          const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.40),
                          1: FlexColumnWidth(0.60),
                        },
                        children: [
                          TableRow(
                            children: [
                              paddedText('Nama Pemutus'),
                              paddedText(
                                  controller.isPenganjuanDetailLoading.value
                                      ? 'Loading...'
                                      : controller.pengajuanDetail.value.user!
                                                  .length <
                                              3
                                          ? '-'
                                          : controller.pengajuanDetail.value
                                              .user![2].displayName!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GFButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  backgroundColor: secondaryColor,
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GFTypography(
                                text:
                                    'Pengajuan ${controller.pengajuanDetail.value.id}',
                                type: GFTypographyType.typo1,
                                showDivider: false,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Ini adalah detail pengajuan  ${controller.pengajuanDetail.value.id}, disini berisikan data lengkap dari data debitur yang diajuakan, penilaian reviewer sampai penilaian pemutus.',
                                style:
                                    Theme.of(context).textTheme.caption?.merge(
                                          const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const GFTypography(
                                text: 'Data Pengajuan',
                                type: GFTypographyType.typo2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(0.40),
                                      1: FlexColumnWidth(0.60),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          paddedText('Nama Analis'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.user![0].displayName}'),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          paddedText('Nama Reviewer'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.user!.length < 2 ? '-' : controller.pengajuanDetail.value.user![1].displayName}'),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          paddedText('Nama Pemutus'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.user!.length < 3 ? '-' : controller.pengajuanDetail.value.user![2].displayName}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(0.40),
                                      1: FlexColumnWidth(0.60),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          paddedText('Tgl Pengajuan'),
                                          paddedText(
                                              ': ${controller.formatDate(controller.pengajuanDetail.value.tglSubmit!.toIso8601String())}'),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          paddedText('Tgl Review'),
                                          paddedText(controller.pengajuanDetail
                                                      .value.tglReview ==
                                                  null
                                              ? ': -'
                                              : ': ${controller.formatDate(controller.pengajuanDetail.value.tglReview!.toIso8601String())}'),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          paddedText('Tgl Putusan'),
                                          paddedText(controller.pengajuanDetail
                                                      .value.tglPemutusan ==
                                                  null
                                              ? ': -'
                                              : ': ${controller.formatDate(controller.pengajuanDetail.value.tglPemutusan!.toIso8601String())}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(0.40),
                                      1: FlexColumnWidth(0.60),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          paddedText('Status'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.status}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const GFTypography(
                                text: 'Data Debitur',
                                type: GFTypographyType.typo2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(0.40),
                                      1: FlexColumnWidth(0.60),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          paddedText('No. Debitur'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.debitur!.noDebitur}'),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          paddedText('Nama Debitur'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.debitur!.peminjam1}'),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          paddedText('Alamat'),
                                          paddedText(
                                              ': ${controller.pengajuanDetail.value.debitur!.alamat1}'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: GFTypography(
                                      text: 'Bahasan Analis',
                                      type: GFTypographyType.typo2,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: GFButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.ANALIS_PRINT,
                                            arguments: controller
                                                .pengajuanDetail.value);
                                      },
                                      icon: const Icon(
                                        Icons.print,
                                        color: GFColors.WHITE,
                                      ),
                                      text: 'Print Bahasan Analis',
                                      color: GFColors.DARK,
                                      shape: GFButtonShape.pills,
                                      size: GFSize.LARGE,
                                      fullWidthButton: false,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.pengajuanDetail.value
                                        .bahasanAnalis!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          '${index + 1}. ${controller.pengajuanDetail.value.bahasanAnalis?[index]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.merge(
                                                const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              controller.pengajuanDetail.value.bahasanReviewer!
                                      .isEmpty
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Expanded(
                                                  child: GFTypography(
                                                    text: 'Bahasan Reviewer',
                                                    type:
                                                        GFTypographyType.typo2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: GFButton(
                                                    onPressed: () {
                                                      Get.toNamed(
                                                          Routes.REVIEWER_PRINT,
                                                          arguments: controller
                                                              .pengajuanDetail
                                                              .value);
                                                    },
                                                    icon: const Icon(
                                                      Icons.print,
                                                      color: GFColors.WHITE,
                                                    ),
                                                    text:
                                                        'Print Bahasan Reviewer',
                                                    color: GFColors.DARK,
                                                    shape: GFButtonShape.pills,
                                                    size: GFSize.LARGE,
                                                    fullWidthButton: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: controller
                                                  .pengajuanDetail
                                                  .value
                                                  .bahasanReviewer!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Text(
                                                    '${index + 1}. ${controller.pengajuanDetail.value.bahasanReviewer?[index]}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        ?.merge(
                                                          const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              controller.pengajuanDetail.value.checkReviewer ==
                                      null
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const GFTypography(
                                              text: 'Penilaian Reviewer',
                                              type: GFTypographyType.typo2,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.40),
                                                    1: FlexColumnWidth(0.60),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Keuangan'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isKeuanganApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Karakter'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isKarakterApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Bisnis'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isBisnisApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Usaha'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isJenisUsahaApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Agunan'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isAgunanApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                              controller.pengajuanDetail.value.bahasanPengutus!
                                      .isEmpty
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Expanded(
                                                  child: GFTypography(
                                                    text: 'Bahasan Pemutus',
                                                    type:
                                                        GFTypographyType.typo2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: GFButton(
                                                    onPressed: () {
                                                      Get.toNamed(
                                                          Routes.PENGUTUS_PRINT,
                                                          arguments: controller
                                                              .pengajuanDetail
                                                              .value);
                                                    },
                                                    icon: const Icon(
                                                      Icons.print,
                                                      color: GFColors.WHITE,
                                                    ),
                                                    text:
                                                        'Print Bahasan Pemutus',
                                                    color: GFColors.DARK,
                                                    shape: GFButtonShape.pills,
                                                    size: GFSize.LARGE,
                                                    fullWidthButton: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: controller
                                                  .pengajuanDetail
                                                  .value
                                                  .bahasanPengutus!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Text(
                                                    '${index + 1}. ${controller.pengajuanDetail.value.bahasanPengutus?[index]}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        ?.merge(
                                                          const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              controller.pengajuanDetail.value.checkPengutus ==
                                      null
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const GFTypography(
                                              text: 'Penilaian Pemutus',
                                              type: GFTypographyType.typo2,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.40),
                                                    1: FlexColumnWidth(0.60),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Keuangan'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isKeuanganApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Karakter'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isKarakterApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Bisnis'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isBisnisApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Usaha'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isJenisUsahaApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedText(
                                                            'Penilaian Agunan'),
                                                        paddedText(
                                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isAgunanApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
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
              },
              text: 'Detail',
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              elevation: 5,
              fullWidthButton: true,
              size: GFSize.LARGE,
              color: GFColors.SUCCESS,
              shape: GFButtonShape.pills,
            ),
          ),
          Obx(() => Expanded(
                child: ListView(
                  children: [
                    controller.pengajuanDetail.value.status == 'PENDING'
                        ? // Initial
                        const BuildPending()
                        : controller.pengajuanDetail.value.status == 'REVIEWED'
                            ? // Done
                            const BuildReviewed()
                            : // Rejected
                            const BuildDone()
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class BuildDone extends StatelessWidget {
  const BuildDone({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/pengajuan_create.zip',
            title: 'Pengajuan Dibuat',
            message:
                'Pengajuan berhasil dibuat dan sudah disampaikan ke Reviewer.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/notes-document.zip',
            title: 'Review (Reviewer)',
            message: 'Pengajuan sedang dalam proses review oleh reviewer.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/writing.zip',
            title: 'Review (Pemutus)',
            message: 'Pengajuan sedang dalam proses review oleh pemutus.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
          afterLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isLast: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: false,
            asset: 'assets/images/home/done.zip',
            title: 'Pengajuan Selesai',
            message: 'Lihat hasil pengajuan anda.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
      ],
    );
  }
}

class BuildReviewed extends StatelessWidget {
  const BuildReviewed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/pengajuan_create.zip',
            title: 'Pengajuan Dibuat',
            message:
                'Pengajuan berhasil dibuat dan sudah disampaikan ke Reviewer.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/notes-document.zip',
            title: 'Review (Reviewer)',
            message: 'Pengajuan sedang dalam proses review oleh reviewer.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF2B619C),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/writing.zip',
            title: 'Review (Pemutus)',
            message: 'Pengajuan sedang dalam proses review oleh pemutus.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
          afterLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isLast: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFFDADADA),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: true,
            asset: 'assets/images/home/done.zip',
            title: 'Pengajuan Selesai',
            message: 'Lihat hasil pengajuan anda.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
      ],
    );
  }
}

class BuildPending extends StatelessWidget {
  const BuildPending({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF27AA69),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/pengajuan_create.zip',
            title: 'Pengajuan Dibuat',
            message:
                'Pengajuan berhasil dibuat dan sudah disampaikan ke Reviewer.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF2B619C),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            asset: 'assets/images/home/notes-document.zip',
            title: 'Review (Reviewer)',
            message: 'Pengajuan sedang dalam proses review oleh reviewer.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFF27AA69),
          ),
          afterLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFFDADADA),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: true,
            asset: 'assets/images/home/writing.zip',
            title: 'Review (Pemutus)',
            message: 'Pengajuan sedang dalam proses review oleh pemutus.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
          afterLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isLast: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFFDADADA),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: true,
            asset: 'assets/images/home/done.zip',
            title: 'Pengajuan Selesai',
            message: 'Lihat hasil pengajuan anda.',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
      ],
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key? key,
    this.asset,
    this.title,
    this.message,
    this.disabled = false,
  }) : super(key: key);

  final String? asset;
  final String? title;
  final String? message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Opacity(
              opacity: disabled ? 0.5 : 1,
              // child: Image.network(asset!, height: 50),
              child: Lottie.asset(
                asset!,
                height: 100,
                width: 100,
                frameRate: FrameRate(60),
                animate: true,
                fit: BoxFit.cover,
              )),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  message!,
                  style: GoogleFonts.yantramanav(
                    color: disabled
                        ? const Color(0xFFD5D5D5)
                        : const Color(0xFF636564),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
