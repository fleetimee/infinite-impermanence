// 🐦 Flutter imports:
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/modules/list_debitur/widget/components/list_debitur_the_list/the_list_itself.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:
import '../controllers/list_debitur_controller.dart';

class ListDebiturListView extends StatelessWidget {
  final ListDebiturController controller;

  const ListDebiturListView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isDataProcessing.value) {
          return const Center(
            child: BpdDiyLoader(),
          );
        } else {
          if (controller.listDebitur.isNotEmpty) {
            return Column(
              children: [
                BootstrapAlert(
                  visible: true,
                  status: AlertStatus.success,
                  text:
                      'Ini merupakan list debitur yang telah diinputkan oleh semua analis, anda hanya dapat melihat data debitur yang anda inputkan',
                  leadingIcon: Icons.people_outline,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  onDismissed: () {},
                  isDismissible: true,
                ),
                Expanded(
                  child: ListAllDebitur(
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
                        'assets/images/home/404.zip',
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
                    const Center(
                      child: Text(
                        'Data tidak dapat ditemukan di database atau list debitur masih kosong',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
