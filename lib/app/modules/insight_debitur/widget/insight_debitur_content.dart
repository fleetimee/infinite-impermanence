// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/analisa_agunan/menu_analisa_agunan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/form_agunan/agunan_form_dashboard.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/header_agunan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/agunan/select_agunan/menu_pilih_agunan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/bisnis.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/jenis_usaha.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/karakter.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/keuangan.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/syarat_lainnya.dart';
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturContent extends StatelessWidget {
  const InsightDebiturContent({
    super.key,
    required this.controller,
  });

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: HeaderKeuangan(),
            ),
            MenuNeraca(),
            MenuRugiLaba(),
            MenuInputKeuangan(),
            MenuAnalisaKeuangan(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: HeaderKarakter(),
            ),
            MenuAnalisaKarakter(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: HeaderBisnis(),
            ),
            MenuAnalisaBisnis(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: HeaderJenisUsaha(),
            ),
            MenuAnalisaJenisUsaha(),
          ],
        ),
        // This is for dynamic widget
        Obx(() {
          if (controller.isAgunanLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: HeaderAgunan(),
                ),
                MenuPilihAgunan(),
                MenuMasukFormAgunan(),
                MenuAnalisaAgunan()
              ],
            );
          }
        }),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: HeaderSyarat(),
            ),
            MenuInputanSyarat(),
            MenuInputIjin(),
            MenuAsuransi(),
          ],
        ),
      ],
    );
  }
}
