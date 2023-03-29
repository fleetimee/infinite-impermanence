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
import 'package:random_avatar/random_avatar.dart';

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
                text: 'Riwayat Penginputan',
                icon: Icon(Icons.history),
              ),
              Tab(
                icon: Icon(Icons.subject_outlined),
                text: 'Riwayat Pengajuan',
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
                      return ListRiwayatInput(
                        controller: controller,
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

class ListRiwayatInput extends StatelessWidget {
  const ListRiwayatInput({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.refreshInputtan();
      },
      child: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.listMyInput.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              color: Colors.white,
              elevation: 6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                enableFeedback: true,
                leading: RandomAvatar(
                  '${controller.listMyInput[index].peminjam1}',
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
                title: Text('${controller.listMyInput[index].peminjam1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Progress: ${(double.parse(controller.listMyInput[index].progress!) * 100).toStringAsFixed(0)} %',
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: double.parse(
                              controller.listMyInput[index].progress!),
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            (double.parse(controller
                                            .listMyInput[index].progress!) >=
                                        0.1 &&
                                    double.parse(controller
                                            .listMyInput[index].progress!) <
                                        0.6)
                                ? Colors.red
                                : (double.parse(controller.listMyInput[index]
                                                .progress!) >=
                                            0.6 &&
                                        double.parse(controller
                                                .listMyInput[index].progress!) <
                                            1.0)
                                    ? Colors.yellow
                                    : Colors.green,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      DateFormat('dd/MM/yy')
                          .format(controller.listMyInput[index].tglSekarang!)
                          .toString(),
                    ),
                  ],
                ),
                splashColor: Colors.blueAccent,
                onTap: () {
                  Get.toNamed(
                    Routes.INSIGHT_DEBITUR,
                    arguments: controller.listMyInput[index].id,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
