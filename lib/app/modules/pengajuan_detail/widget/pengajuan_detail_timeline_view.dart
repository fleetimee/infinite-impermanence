// 🐦 Flutter imports:
import 'package:akm/app/modules/pengajuan_detail/controllers/pengajuan_detail_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DetailPengajuanTimelineView extends StatelessWidget {
  const DetailPengajuanTimelineView({
    super.key,
    required this.controller,
  });

  final PengajuanDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.isPenganjuanDetailLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: ListView(
                    children: [
                      controller.pengajuanDetail.value.status == 'PENDING'
                          ? // Initial
                          const BuildPending()
                          : controller.pengajuanDetail.value.status ==
                                  'REVIEWED'
                              ? // Done
                              const BuildReviewed()
                              : // Rejected
                              const BuildDone()
                    ],
                  ),
                ),
              ),
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
