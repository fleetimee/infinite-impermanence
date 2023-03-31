// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/widget/components/home_history_and_submission.dart/empty_history_and_submission.dart';
import 'package:akm/app/modules/home/widget/components/home_history_and_submission.dart/list_riwayat_input.dart';
import 'package:akm/app/modules/home/widget/components/home_history_and_submission.dart/list_riwayat_pengajuan.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class HomeHistoryAndSubmission extends StatelessWidget {
  final HomeController controller;

  const HomeHistoryAndSubmission({
    super.key,
    required this.controller,
  });

  final bool _showAlert = true;
  final int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedIndex,
      length: 2,
      child: ScaffoldGradientBackground(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.blue.shade900,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        body: Column(
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
                        return Column(
                          children: [
                            BootstrapAlert(
                              visible: _showAlert,
                              status: AlertStatus.success,
                              text:
                                  'Ini merupakan daftar riwayat penginputan debitur yang telah anda lakukan yang diurutkan berdasarkan alpabet',
                              isDismissible: true,
                              leadingIcon: Icons.people_outline,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              onDismissed: () {},
                            ),
                            BootstrapAlert(
                              visible: _showAlert,
                              status: AlertStatus.primary,
                              text:
                                  'Untuk fitur filter, sorting, dan pencarian, silahkan klik floating action button yang ada di pojok kanan bawah',
                              isDismissible: true,
                              leadingIcon: Icons.info_outline,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              onDismissed: () {},
                            ),
                            BootstrapAlert(
                              visible: _showAlert,
                              status: AlertStatus.warning,
                              text:
                                  'Untuk melihat detail debitur tap atau tekan pada card debitur yang diinginkan',
                              isDismissible: true,
                              leadingIcon: Icons.insert_comment_outlined,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              onDismissed: () {},
                            ),
                            Expanded(
                              child: ListRiwayatInput(
                                controller: controller,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return EmptyHistoryAndSubmission(
                          controller: controller,
                          text: 'Belum ada riwayat penginputan',
                          onPressed: () {
                            controller.refreshInputtan();
                          },
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
                            BootstrapAlert(
                              visible: _showAlert,
                              status: AlertStatus.primary,
                              text:
                                  'Ini merupakan daftar riwayat pengajuan debitur yang telah anda lakukan yang diurutkan berdasarkan alpabet',
                              isDismissible: true,
                              leadingIcon: Icons.info_outline,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              onDismissed: () {},
                            ),
                            Expanded(
                              child: ListRiwayatPengajuan(
                                controller: controller,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return EmptyHistoryAndSubmission(
                          controller: controller,
                          text: 'Belum ada riwayat pengajuan',
                          onPressed: () {
                            controller.refreshPengajuan();
                          },
                        );
                      }
                    }
                  })
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Get.toNamed('/home/input');
                },
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}
