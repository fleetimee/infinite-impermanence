import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_kendaraan/list_tile_kendaraan_form.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_tanah/list_tile_tanah_form.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_tanah_bangunan/list_tile_tanah_bangunan_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';

import '../controllers/agunan_form_onboarding_controller.dart';

class AgunanFormOnboardingView extends GetView<AgunanFormOnboardingController> {
  AgunanFormOnboardingView({Key? key}) : super(key: key);

  final selectedAgunanController = Get.put(AgunanPilihController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgunanFormOnboardingView'),
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
              'assets/images/home/printing.jpg',
            ),
            colorFilter: ColorFilter.mode(
              Color.fromARGB(221, 8, 8, 8),
              BlendMode.darken,
            ),
            title: GFListTile(
              title: Text(
                'Tambah Agunan',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 47,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Text(
              "Kumpulan form agunan yang ditujukan untuk penginputan sesuai dengan jenis agunan yang dipilih.",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
