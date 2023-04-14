import 'package:akm/app/modules/reviewer_pending_list/widget/components/reviewer_pending_list_available/list_pending.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

import '../controllers/reviewer_pending_list_controller.dart';

class ReviewerPendingList extends StatelessWidget {
  final ReviewerPendingListController controller;

  const ReviewerPendingList({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/home/list_pending.png",
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            BootstrapAlert(
              visible: true,
              status: AlertStatus.danger,
              text:
                  'Ini adalah daftar pengajuan yang belum direview oleh kamu, silahkan review secepatnya',
              isDismissible: true,
              leadingIcon: Icons.people_outline,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              onDismissed: () {},
            ),
            Expanded(
              child: ListPendingPengajuanReviewer(
                controller: controller,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
