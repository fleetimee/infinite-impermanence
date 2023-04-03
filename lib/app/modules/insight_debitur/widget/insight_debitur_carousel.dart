// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/widget/components/insight_debitur_carousel/container_carousel.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturCarousel extends StatelessWidget {
  final InsightDebiturController controller;

  const InsightDebiturCarousel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GFItemsCarousel(
      rowCount: 3,
      children: [
        ContainerCarousel(
          imagePath: 'assets/images/home/keuangan_slider.png',
          description: 'Keuangan',
          child: Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : controller.insightDebitur.value.analisaKeuangan == null
                    ? const Text(
                        'N/A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        controller.insightDebitur.value.analisaKeuangan!
                            .totalCrrKeuangan
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
        ContainerCarousel(
          imagePath: 'assets/images/home/karakter_slider.png',
          description: 'Karakter',
          child: Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : controller.insightDebitur.value.analisaKarakter == null
                    ? const Text(
                        'N/A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        controller.insightDebitur.value.analisaKarakter!
                            .totalCrrKarakter
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
        ContainerCarousel(
          imagePath: 'assets/images/home/bisnis_slider.png',
          description: 'Bisnis',
          child: Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : controller.insightDebitur.value.analisaBisnis == null
                    ? const Text(
                        'N/A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        double.parse(controller.insightDebitur.value
                                .analisaBisnis!.hasilCrrBisnis
                                .toString())
                            .toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
        ContainerCarousel(
          imagePath: 'assets/images/home/usaha_slider.png',
          description: 'Jenis Usaha',
          child: Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : controller.insightDebitur.value.analisaJenisUsaha == null
                    ? const Text(
                        'N/A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        double.parse(controller.insightDebitur.value
                                .analisaJenisUsaha!.totalCrrUsaha
                                .toString())
                            .toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
        ContainerCarousel(
          imagePath: 'assets/images/home/agunan_slider.png',
          description: 'Agunan',
          child: Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : controller.insightDebitur.value.analisaAgunan == null
                    ? const Text(
                        'N/A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        double.parse(controller.insightDebitur.value
                                .analisaAgunan!.totalCrrAgunan
                                .toString())
                            .toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        )
      ],
    );
  }
}
