// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_cash/list_tile_cash_form.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_kendaraan/list_tile_kendaraan_form.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_kios/list_tile_kios.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_lainnya/list_tile_lainnya.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_peralatan/list_tile_peralatan_form.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_tanah/list_tile_tanah_form.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_tanah_bangunan/list_tile_tanah_bangunan_form.dart';
import '../controllers/agunan_form_onboarding_controller.dart';

class AgunanFormOnboardingView extends GetView<AgunanFormOnboardingController> {
  AgunanFormOnboardingView({Key? key}) : super(key: key);

  final selectedAgunanController = Get.put(AgunanPilihController());
  final plafonKredit = Get.arguments;

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
      appBar: AppBar(
        title: const Text('Choose your path'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            imageOverlay: AssetImage(
              'assets/images/home/bi_fast.png',
            ),
            title: GFListTile(
              title: Text(
                '',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 47,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Text(
              "",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TanahForm();
                  }
                }),
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TanahBangunanForm();
                  }
                }),
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return KendaraanForm();
                  }
                }),
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return PeralatanForm();
                  }
                }),
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CashForm();
                  }
                }),
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return KiosForm();
                  }
                }),
                Obx(() {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return LainnyaForm();
                  }
                }),
              ]
                  .animate(interval: 300.ms)
                  .fadeIn(duration: 600.ms, delay: 900.ms)
                  .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
                  .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
            ),
          ),
        ],
      ),
    );
  }
}
