// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:lottie/lottie.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class NetworkErrorItem extends StatelessWidget {
  const NetworkErrorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'No Internet Connection',
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
                  'assets/images/home/no_internet.zip',
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
                  'Aplikasi ini membutuhkan konektifitas internet untuk dapat berjalan secara optimal \n\n Reconnect data/wifi anda kemudian tunggu sampai aplikasi ini bisa terhubung kembali ke internet',
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
      ),
    );
  }
}
