// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';

// 🌎 Project imports:
import 'package:akm/app/routes/app_pages.dart';
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
                                      : Icons.check_circle_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                            text: controller.isPenganjuanDetailLoading.value
                                ? 'Loading...'
                                : controller.pengajuanDetail.value.status!,
                            color: controller.pengajuanDetail.value.status ==
                                    'PENDING'
                                ? GFColors.DANGER
                                : controller.pengajuanDetail.value.status ==
                                        'REVIEWED'
                                    ? GFColors.WARNING
                                    : GFColors.SUCCESS,
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
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Debitur',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      controller.isPenganjuanDetailLoading.value
                          ? const Text('Loading...')
                          : SizedBox(
                              width: 120,
                              child: Text(
                                controller
                                    .pengajuanDetail.value.debitur!.peminjam1!,
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                ),
                              ),
                            ),
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
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Analis',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          controller.isPenganjuanDetailLoading.value
                              ? const Text('Loading...')
                              : Text(
                                  controller.pengajuanDetail.value.user![0]
                                      .displayName!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Reviewer',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          controller.isPenganjuanDetailLoading.value
                              ? const Text('Loading...')
                              : SizedBox(
                                  width: 120,
                                  child: Text(
                                    // ignore: prefer_is_empty
                                    controller.pengajuanDetail.value.user!
                                                .length <
                                            2
                                        ? '-'
                                        : controller.pengajuanDetail.value
                                            .user![1].displayName!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Pemutus',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          controller.isPenganjuanDetailLoading.value
                              ? const Text('Loading...')
                              : SizedBox(
                                  width: 120,
                                  child: Text(
                                    controller.pengajuanDetail.value.user!
                                                .length <
                                            3
                                        ? '-'
                                        : controller.pengajuanDetail.value
                                            .user![2].displayName!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                    ),
                                  ),
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
                Get.dialog(
                  AlertDialog(
                    icon: const Icon(Icons.info_outline),
                    title: const Text('Detail'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () => controller.isPenganjuanDetailLoading.value
                              ? const Text('Loading...')
                              : Text(
                                  controller.pengajuanDetail.value.status!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GFButton(
                          onPressed: () {
                            Get.toNamed(Routes.ANALIS_PRINT,
                                arguments: controller.pengajuanDetail.value);
                          },
                          text: 'Tanggapan Analis',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GFButton(
                          onPressed: () {
                            Get.toNamed(Routes.REVIEWER_PRINT,
                                arguments: controller.pengajuanDetail.value);
                          },
                          text: 'Tanggapan Reviewer',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GFButton(
                          onPressed: () {
                            Get.toNamed(Routes.PENGUTUS_PRINT,
                                arguments: controller.pengajuanDetail.value);
                          },
                          text: 'Tanggapan Pemutus',
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
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
