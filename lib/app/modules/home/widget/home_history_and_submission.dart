// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:

class HomeHistoryAndSubmission extends StatelessWidget {
  final HomeController controller;

  const HomeHistoryAndSubmission({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            physics: NeverScrollableScrollPhysics(),
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'History',
                icon: Icon(Icons.history),
              ),
              Tab(
                icon: Icon(Icons.subject_outlined),
                text: 'Submissions',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Obx(() {
                  if (controller.isMyInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (controller.listMyInput.isNotEmpty) {
                      return RefreshIndicator(
                        onRefresh: () {
                          return controller.refreshInputtan();
                        },
                        child: ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.listMyInput.length,
                          itemBuilder: (context, index) {
                            bool isSameDate = true;
                            final dateString =
                                controller.listMyInput[index].tglSekarang;

                            if (index == 0) {
                              isSameDate = false;
                            } else {
                              final prevDateString = controller
                                  .listMyInput[index - 1].tglSekarang
                                  ?.toIso8601String();
                              final DateTime prevDate =
                                  DateTime.parse(prevDateString!);
                              isSameDate =
                                  dateString!.isAtSameMomentAs(prevDate);
                            }
                            if (index == 0 || !(isSameDate)) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    DateFormat('EEEE, dd MMMM yyyy')
                                        .format(dateString!),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GFCard(
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.white.withOpacity(0.9),
                                    elevation: 5,
                                    titlePosition: GFPosition.start,
                                    title: GFListTile(
                                      avatar: const Icon(
                                          FontAwesomeIcons.bookBookmark),
                                      title: Text(
                                        controller
                                            .listMyInput[index].peminjam1!,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black87,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subTitle: Text(
                                        controller
                                            .listMyInput[index].bidangUsaha!,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      icon: GFButton(
                                        onPressed: (() {
                                          Get.toNamed(Routes.INSIGHT_DEBITUR,
                                              arguments: controller
                                                  .listMyInput[index].id);
                                        }),
                                        text: 'Detail',
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return GFCard(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                padding: const EdgeInsets.all(10),
                                color: Colors.white.withOpacity(0.9),
                                elevation: 5,
                                titlePosition: GFPosition.start,
                                title: GFListTile(
                                  avatar:
                                      const Icon(FontAwesomeIcons.bookBookmark),
                                  title: Text(
                                    controller.listMyInput[index].peminjam1!,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  subTitle: Text(
                                    controller.listMyInput[index].bidangUsaha!,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  icon: GFButton(
                                    onPressed: (() {
                                      Get.toNamed(Routes.INSIGHT_DEBITUR,
                                          arguments:
                                              controller.listMyInput[index].id);
                                    }),
                                    text: 'Detail',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
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
                                  'Data Tidak Ditemukan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Center(
                                child: Lottie.asset(
                                  'assets/images/home/empty.json',
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
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Belum ada riwayat input debitur',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 1.2,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      onPressed: () {
                                        controller.refreshInputtan();
                                      },
                                      child: const Text(
                                        'Refresh',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
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
                }),
                Obx(() {
                  if (controller.isMySubmissionProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (controller.listMySubmission.isNotEmpty) {
                      return RefreshIndicator(
                        onRefresh: () {
                          return controller.refreshPengajuan();
                        },
                        child: ListView.builder(
                          itemCount: controller.listMySubmission.length,
                          itemBuilder: (context, index) {
                            bool isSameDate = true;
                            final dateString =
                                controller.listMySubmission[index].tglSubmit;

                            if (index == 0) {
                              isSameDate = false;
                            } else {
                              final prevDateString = controller
                                  .listMySubmission[index - 1].tglSubmit
                                  ?.toIso8601String();
                              final DateTime prevDate =
                                  DateTime.parse(prevDateString!);
                              isSameDate = dateString! == prevDate;
                            }

                            if (index == 0 || !(isSameDate)) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    DateFormat('EEEE, dd MMMM yyyy')
                                        .format(dateString!),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GFCard(
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.white.withOpacity(0.9),
                                    elevation: 5,
                                    titlePosition: GFPosition.start,
                                    title: GFListTile(
                                      avatar: const Icon(
                                          FontAwesomeIcons.bookBookmark),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.listMySubmission[index]
                                                .debitur.peminjam1!,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black87,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '#',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black87,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                ': ${controller.listMySubmission[index].id}',
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black87,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                      subTitle: controller
                                                  .listMySubmission[index]
                                                  .status ==
                                              'PENDING'
                                          ? const Text(
                                              'Status : Pending',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : controller.listMySubmission[index]
                                                      .status ==
                                                  'REVIEWED'
                                              ? const Text(
                                                  'Status : Sedang Direview',
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : controller
                                                          .listMySubmission[
                                                              index]
                                                          .status ==
                                                      'DONE'
                                                  ? const Text(
                                                      'Status : Diterima',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : const Text(
                                                      'Status : Ditolak 🤣',
                                                      style: TextStyle(
                                                        color: Colors.pink,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                      icon: GFButton(
                                        onPressed: (() {
                                          Get.toNamed(Routes.PENGAJUAN_DETAIL,
                                              arguments: controller
                                                  .listMySubmission[index].id);
                                        }),
                                        text: 'Detail',
                                        color: Colors.blue,
                                        textStyle: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return GFCard(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                padding: const EdgeInsets.all(10),
                                color: Colors.white.withOpacity(0.9),
                                elevation: 5,
                                titlePosition: GFPosition.start,
                                title: GFListTile(
                                  avatar:
                                      const Icon(FontAwesomeIcons.bookBookmark),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.listMySubmission[index]
                                            .debitur.peminjam1!,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black87,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '#',
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            ': ${controller.listMySubmission[index].id}',
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                  subTitle: controller
                                              .listMySubmission[index].status ==
                                          'PENDING'
                                      ? const Text(
                                          'Status : Pending',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : controller.listMySubmission[index]
                                                  .status ==
                                              'REVIEWED'
                                          ? const Text(
                                              'Status : Sedang Direview',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : controller.listMySubmission[index]
                                                      .status ==
                                                  'DONE'
                                              ? const Text(
                                                  'Status : Diterima',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : const Text(
                                                  'Status : Ditolak 🤣',
                                                  style: TextStyle(
                                                    color: Colors.pink,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                  icon: GFButton(
                                    onPressed: (() {
                                      Get.toNamed(Routes.PENGAJUAN_DETAIL,
                                          arguments: controller
                                              .listMySubmission[index].id);
                                    }),
                                    text: 'Detail',
                                    color: Colors.blue,
                                    textStyle: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
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
                                  'Data Tidak Ditemukan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Center(
                                child: Lottie.asset(
                                  'assets/images/home/empty.json',
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
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Belum ada riwayat pengajuan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 1.2,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      onPressed: () {
                                        controller.refreshPengajuan();
                                      },
                                      child: const Text(
                                        'Refresh',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
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
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
