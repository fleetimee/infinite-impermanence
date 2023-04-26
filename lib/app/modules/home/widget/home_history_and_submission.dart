// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/widget/components/home_history_and_submission.dart/empty_history_and_submission.dart';
import 'package:akm/app/modules/home/widget/components/home_history_and_submission.dart/list_riwayat_input.dart';
import 'package:akm/app/modules/home/widget/components/home_history_and_submission.dart/list_riwayat_pengajuan.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class HomeHistoryAndSubmission extends StatefulWidget {
  final HomeController controller;

  const HomeHistoryAndSubmission({
    super.key,
    required this.controller,
  });

  @override
  State<HomeHistoryAndSubmission> createState() =>
      _HomeHistoryAndSubmissionState();
}

class _HomeHistoryAndSubmissionState extends State<HomeHistoryAndSubmission> {
  final bool _showAlert = true;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              indicatorColor: Colors.white,
              tabs: const [
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
                    if (widget.controller.isMyInputProcessing.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (widget.controller.listMyInput.isNotEmpty) {
                        return Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/home/reviewer_completed.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
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
                                    controller: widget.controller,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return EmptyHistoryAndSubmission(
                          controller: widget.controller,
                          text: 'Belum ada riwayat penginputan',
                          onPressed: () {
                            widget.controller.refreshInputtan();
                          },
                        );
                      }
                    }
                  }),
                  Obx(() {
                    if (widget.controller.isMySubmissionProcessing.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (widget.controller.listMySubmission.isNotEmpty) {
                        return Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/home/reviewer_completed.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
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
                                    controller: widget.controller,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return EmptyHistoryAndSubmission(
                          controller: widget.controller,
                          text: 'Belum ada riwayat pengajuan',
                          onPressed: () {
                            widget.controller.refreshPengajuan();
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
            ? AvatarGlow(
                endRadius: 50,
                child: FloatingActionButton(
                  backgroundColor: primaryColor,
                  elevation: 10,
                  onPressed: () {
                    Get.toNamed(Routes.LIST_DEBITUR);
                  },
                  child: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
