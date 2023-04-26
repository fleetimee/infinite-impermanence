import 'package:akm/app/modules/pengutus_pending_list/widget/components/pengutus_pending_list_available/pengutus_pending_list_available_list.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

import '../controllers/pengutus_pending_list_controller.dart';

class PengutusPendingList extends StatelessWidget {
  const PengutusPendingList({
    super.key,
    required this.controller,
  });

  final PengutusPendingListController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/home/list_pending.png",
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            BootstrapAlert(
              visible: true,
              status: AlertStatus.danger,
              text:
                  'Ini adalah daftar pengajuan yang belum diputuskan oleh kamu, silahkan putus secepatnya',
              isDismissible: true,
              leadingIcon: Icons.people_outline,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              onDismissed: () {},
            ),
            Expanded(
              child: ListPendingPemutusanPengutus(
                controller: controller,
              ),
            )
          ],
        )
      ],
    );
  }
}
