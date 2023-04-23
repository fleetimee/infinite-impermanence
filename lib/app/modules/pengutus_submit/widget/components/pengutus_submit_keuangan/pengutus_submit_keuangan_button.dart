// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';

class PengutusSubmitKeuanganButton extends StatelessWidget {
  const PengutusSubmitKeuanganButton({
    super.key,
    required this.controller,
  });

  final PengutusSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GFButton(
          onPressed: () {
            Get.toNamed(Routes.RUGILABA_PRINT,
                arguments: controller.insightDebitur.value);
          },
          color: Colors.pink,
          shape: GFButtonShape.pills,
          text: 'Lihat Laporan Keuangan',
          icon: const Icon(
            Icons.summarize,
            size: 18,
            color: secondaryColor,
          ),
          fullWidthButton: true,
          size: GFSize.LARGE,
        ),
        const SizedBox(height: 10),
        GFButton(
          onPressed: () {
            Get.toNamed(Routes.NERACA_PRINT,
                arguments: controller.insightDebitur.value);
          },
          color: Colors.pink,
          shape: GFButtonShape.pills,
          text: 'Lihat Keterangan Neraca',
          icon: const Icon(
            Icons.summarize,
            size: 18,
            color: secondaryColor,
          ),
          fullWidthButton: true,
          size: GFSize.LARGE,
        ),
        const SizedBox(height: 10),
        GFButton(
          onPressed: () {
            Get.toNamed(Routes.KEUANGAN_PRINT,
                arguments: controller.insightDebitur.value);
          },
          color: Colors.pink,
          shape: GFButtonShape.pills,
          text: 'Lihat Analisa Keuangan',
          icon: const Icon(
            Icons.summarize,
            size: 18,
            color: secondaryColor,
          ),
          fullWidthButton: true,
          size: GFSize.LARGE,
        ),
        const SizedBox(height: 10),
        Center(
          child: FormBuilderRadioGroup(
            name: 'keuangan',
            wrapAlignment: WrapAlignment.center,
            onChanged: (value) {
              // if clicked then change isPressed to true
              controller.isKeuanganPressed.value = true;
            },
            decoration: InputDecoration(
              labelText: 'Apakah keuangan debitur ini layak?',
              floatingLabelAlignment: FloatingLabelAlignment.center,
              labelStyle: Theme.of(context).textTheme.bodySmall!.merge(
                    const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              border: InputBorder.none,
              alignLabelWithHint: true,
            ),
            options: const [
              FormBuilderFieldOption(
                value: true,
                child: Text('👍 Ya'),
              ),
              FormBuilderFieldOption(
                value: false,
                child: Text('👎 Tidak'),
              ),
            ],
            validator: FormBuilderValidators.required(),
          ),
        ),
      ],
    );
  }
}
