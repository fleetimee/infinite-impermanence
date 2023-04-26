import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

import '../controllers/pengutus_completed_list_controller.dart';
import 'pengutus_completed_list_available/pengutus_complete_list_view.dart';

class PengutusCompletedList extends StatelessWidget {
  const PengutusCompletedList({super.key, required this.controller});

  final PengutusCompletedListController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/home/reviewer_completed.png",
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            BootstrapAlert(
              visible: true,
              status: AlertStatus.success,
              text:
                  'Ini adalah daftar pengajuan yang sudah di putuskan olehmu, silahkan cek kembali apakah sudah benar atau belum',
              isDismissible: true,
              leadingIcon: Icons.people_outline,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              onDismissed: () {},
            ),
            Expanded(
              child: ListCompletedPemutusanPengutus(
                controller: controller,
              ),
            )
          ],
        )
      ],
    );
  }
}
