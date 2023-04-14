// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../../insight_debitur/widget/insight_debitur_detail_debitur.dart';
import '../controllers/pengajuan_detail_controller.dart';

class DetailButton extends StatelessWidget {
  const DetailButton({
    super.key,
    required this.controller,
  });

  final PengajuanDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GFButton(
            onPressed: controller.isPenganjuanDetailLoading.value
                ? null
                : () {
                    showMaterialModalBottomSheet(
                      backgroundColor: secondaryColor,
                      context: context,
                      builder: (context) {
                        return PengajuanDetailVeryDetailed(
                            controller: controller);
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
        ));
  }
}

class PengajuanDetailVeryDetailed extends StatelessWidget {
  const PengajuanDetailVeryDetailed({
    super.key,
    required this.controller,
  });

  final PengajuanDetailController controller;

  @override
  Widget build(BuildContext context) {
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
                text: 'Pengajuan ${controller.pengajuanDetail.value.id}',
                type: GFTypographyType.typo1,
                showDivider: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ini adalah detail pengajuan  ${controller.pengajuanDetail.value.id}, disini berisikan data lengkap dari data debitur yang diajuakan, penilaian reviewer sampai penilaian pemutus.',
                style: Theme.of(context).textTheme.bodySmall?.merge(
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
                          paddedText(controller
                                      .pengajuanDetail.value.tglReview ==
                                  null
                              ? ': -'
                              : ': ${controller.formatDate(controller.pengajuanDetail.value.tglReview!.toIso8601String())}'),
                        ],
                      ),
                      TableRow(
                        children: [
                          paddedText('Tgl Putusan'),
                          paddedText(controller
                                      .pengajuanDetail.value.tglPemutusan ==
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: GFTypography(
                      text: 'Data Debitur',
                      type: GFTypographyType.typo2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GFButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.PENGAJUAN_PRINTING,
                          arguments: controller.pengajuanDetail.value,
                        );
                      },
                      icon: const Icon(
                        Icons.person,
                        color: GFColors.WHITE,
                      ),
                      text: 'Lihat Debitur',
                      color: GFColors.DARK,
                      size: GFSize.LARGE,
                      shape: GFButtonShape.pills,
                    ),
                  ),
                ],
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: GFTypography(
                      text: 'Tanggapan Analis',
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
                            arguments: controller.pengajuanDetail.value);
                      },
                      icon: const Icon(
                        Icons.print,
                        color: GFColors.WHITE,
                      ),
                      text: 'Print Tanggapan Analis',
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.pengajuanDetail.value.bahasanAnalis!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '${index + 1}. ${controller.pengajuanDetail.value.bahasanAnalis?[index]}',
                          style: Theme.of(context).textTheme.bodySmall?.merge(
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
              controller.pengajuanDetail.value.bahasanReviewer!.isEmpty
                  ? const SizedBox()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: GFTypography(
                                    text: 'Tanggapan Reviewer',
                                    type: GFTypographyType.typo2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GFButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.REVIEWER_PRINT,
                                          arguments:
                                              controller.pengajuanDetail.value);
                                    },
                                    icon: const Icon(
                                      Icons.print,
                                      color: GFColors.WHITE,
                                    ),
                                    text: 'Print Tanggapan Reviewer',
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
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.pengajuanDetail.value
                                  .bahasanReviewer!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    '${index + 1}. ${controller.pengajuanDetail.value.bahasanReviewer?[index]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
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
                      ],
                    ),
              controller.pengajuanDetail.value.checkReviewer == null
                  ? const SizedBox()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        paddedText('Penilaian Keuangan'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isKeuanganApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Karakter'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isKarakterApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Bisnis'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isBisnisApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Usaha'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkReviewer!.isJenisUsahaApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Agunan'),
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
              controller.pengajuanDetail.value.bahasanPengutus!.isEmpty
                  ? const SizedBox()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: GFTypography(
                                    text: 'Tanggapan Pemutus',
                                    type: GFTypographyType.typo2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GFButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.PENGUTUS_PRINT,
                                          arguments:
                                              controller.pengajuanDetail.value);
                                    },
                                    icon: const Icon(
                                      Icons.print,
                                      color: GFColors.WHITE,
                                    ),
                                    text: 'Print Tanggapan Pemutus',
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
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.pengajuanDetail.value
                                  .bahasanPengutus!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    '${index + 1}. ${controller.pengajuanDetail.value.bahasanPengutus?[index]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
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
                      ],
                    ),
              controller.pengajuanDetail.value.checkPengutus == null
                  ? const SizedBox()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        paddedText('Penilaian Keuangan'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isKeuanganApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Karakter'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isKarakterApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Bisnis'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isBisnisApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Usaha'),
                                        paddedText(
                                            ': ${controller.pengajuanDetail.value.checkPengutus!.isJenisUsahaApproved == true ? 'Disetujui ✅' : 'Ditolak ❌'}'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        paddedText('Penilaian Agunan'),
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
  }
}
