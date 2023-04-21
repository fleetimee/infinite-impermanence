import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../controllers/reviewer_pending_list_controller.dart';

class EmptyPendingList extends StatelessWidget {
  const EmptyPendingList({
    super.key,
    required this.controller,
  });

  final ReviewerPendingListController controller;

  @override
  Widget build(BuildContext context) {
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
                'Currently Empty',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Lottie.asset(
                'assets/images/home/empty.json',
                frameRate: FrameRate.max,
                fit: BoxFit.contain,
                height: 350,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Belum ada pengajuan yang perlu direview',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.2,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Future<void>.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          controller.getMyPendingReview();
                        },
                      );
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
