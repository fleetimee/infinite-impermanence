import 'package:akm/app/modules/reviewer_completed_list/widget/components/reviewer_completed_list_available/reviewer_completed_list_view.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

import '../controllers/reviewer_completed_list_controller.dart';

class ReviewerCompletedList extends StatelessWidget {
  final ReviewerCompletedListController controller;

  const ReviewerCompletedList({
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
            "assets/images/home/reviewer_completed.png",
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
              child: ListCompletedPengajuanReviewer(
                controller: controller,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
