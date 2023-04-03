// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/widget/insight_debitur_carousel.dart';
import 'package:akm/app/modules/insight_debitur/widget/insight_debitur_progress_bar.dart';
import 'package:akm/app/modules/insight_debitur/widget/insight_debitur_submission_button.dart';
import 'package:akm/app/modules/insight_debitur/widget/insight_debitur_top_section.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/modules/usaha_analisis/controllers/usaha_analisis_controller.dart';
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturView extends GetView<InsightDebiturController> {
  InsightDebiturView({Key? key}) : super(key: key);

  final neracaController = Get.put(InputNeracaController());
  final rugiLabaController = Get.put(RugiLabaController());
  final analisaKeuanganController = Get.put(KeuanganAnalisisController());
  final analisaBisnisController = Get.put(BisnisAnalisisController());
  final analisaKarakterController = Get.put(KarakterAnalisisController());
  final analisaJenisUsahaController = Get.put(UsahaAnalisisController());
  final selectAgunanController = Get.put(AgunanPilihController());
  final analisaAgunanController = Get.put(AgunanAnalisisController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          secondaryColor,
          Colors.white60,
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshInsightDebitur();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(
                color: primaryColor,
              ),
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(500),
                        topRight: Radius.circular(500),
                      ),
                      color: secondaryColor),
                  // padding: const EdgeInsets.only(bottom: 25, top: 5),
                  width: double.maxFinite,
                ),
              ),
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/home/copyright.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InsightDebiturTopSection(
                    controller: controller,
                    neracaController: neracaController,
                    rugiLabaController: rugiLabaController,
                    analisaKeuanganController: analisaKeuanganController,
                    analisaBisnisController: analisaBisnisController,
                    analisaKarakterController: analisaKarakterController,
                    analisaJenisUsahaController: analisaJenisUsahaController,
                    selectAgunanController: selectAgunanController,
                    analisaAgunanController: analisaAgunanController,
                  ),
                  InsightDebiturCarousel(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InsightDebiturProgressBar(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InsightDebiturSubmissionButton(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  // InsightDebiturContent(
                  //   controller: controller,
                  // ),
                  // InsighDebiturDetailDebitur(
                  //   controller: controller,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
