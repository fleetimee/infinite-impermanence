// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:lottie/lottie.dart';

class EmptyHistoryAndSubmission extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const EmptyHistoryAndSubmission({
    super.key,
    required this.controller,
    required this.text,
    this.onPressed,
  });

  final HomeController controller;

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
                  Text(
                    text,
                    style: const TextStyle(
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
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: onPressed,
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
