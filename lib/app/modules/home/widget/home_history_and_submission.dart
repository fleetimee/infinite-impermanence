// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
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
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Pengajuan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  '${controller.listMySubmission.length} Pengajuan',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListRiwayatPengajuan(
                              controller: controller,
                            ),
                          ),
                        ],
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

class ListRiwayatPengajuan extends StatelessWidget {
  const ListRiwayatPengajuan({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(
      fontSize: 15,
      color: Colors.grey,
    );

    return RefreshIndicator(
      onRefresh: () {
        return controller.refreshPengajuan();
      },
      child: Scrollbar(
        child: ListView.builder(
          itemCount: controller.listMySubmission.length,
          itemBuilder: (context, index) {
            Widget buildChip(int index) {
              Color chipColor;
              String chipText;

              String status = controller.listMySubmission[index].status;

              switch (status) {
                case 'PENDING':
                  chipColor = Colors.blue;
                  chipText = 'PENDING';
                  break;
                case 'REVIEWED':
                  chipColor = Colors.yellow;
                  chipText = 'REVIEWED';
                  break;
                case 'DONE':
                  chipColor = Colors.green;
                  chipText = 'DONE';
                  break;
                default:
                  chipColor = Colors.red;
                  chipText = 'DITOLAK';
                  break;
              }

              return Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  elevation: 6,
                  backgroundColor: chipColor,
                  label: Text(
                    chipText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                elevation: 6,
                color: Colors.white,
                child: ListTile(
                  splashColor: Colors.blueAccent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  enableFeedback: true,
                  title: TitlePengajuan(
                    controller: controller,
                    subtitleStyle: subtitleStyle,
                    index: index,
                    buildChip: buildChip,
                  ),
                  trailing: Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  leading: RandomAvatar(
                    '${controller.listMySubmission[index].debitur.peminjam1}',
                    height: 50,
                    width: 50,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.PENGAJUAN_DETAIL,
                        arguments: controller.listMySubmission[index].id);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitlePengajuan extends StatelessWidget {
  const TitlePengajuan({
    super.key,
    required this.controller,
    required this.subtitleStyle,
    required this.index,
    required this.buildChip,
  });

  final HomeController controller;
  final TextStyle subtitleStyle;
  final int index;
  final Widget Function(int) buildChip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${controller.listMySubmission[index].debitur.peminjam1}',
        ),
        const SizedBox(height: 5),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(0.30),
            1: FlexColumnWidth(0.03),
            2: FlexColumnWidth(0.67),
          },
          children: [
            TableRow(
              children: [
                Text(
                  'No Pengajuan',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listMySubmission[index].id}',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Tgl Pengajuan',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                      .format(controller.listMySubmission[index].tglSubmit),
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Status',
                  style: subtitleStyle,
                ),
                Text(
                  '',
                  style: subtitleStyle,
                ),
                buildChip(index),
              ],
            ),
          ],
        ),
      ],
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
      child: Scrollbar(
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
                                                  .listMyInput[index]
                                                  .progress!) <
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
      ),
    );
  }
}
