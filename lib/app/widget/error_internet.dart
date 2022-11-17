import 'package:akm/app/common/style.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: EmptyWidget(
            image: 'assets/images/home/satania-crying.png',
            title: 'Koneksi internet terputus',
            titleTextStyle: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: secondaryColor,
            ),
            subtitleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: secondaryColor,
            ),
            hideBackgroundAnimation: true,
            subTitle:
                'Aplikasi Analisis Kredit Mikro membutuhkan koneksi internet untuk menjalankannya, reconnect dengan data / wifi dan coba lagi',
          ),
        ),
      ),
    );
  }
}
