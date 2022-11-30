import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

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
                  'Sedang Mengupload',
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
                  'assets/images/home/process-upload.zip',
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
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
