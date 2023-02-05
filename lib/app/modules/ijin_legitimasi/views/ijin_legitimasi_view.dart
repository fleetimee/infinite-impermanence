// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/ijin_legitimasi_controller.dart';

class IjinLegitimasiView extends GetView<IjinLegitimasiController> {
  IjinLegitimasiView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ijin Legitimasi'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Animate(
                      child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        'assets/images/home/bannerr.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 200,
                      )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(delay: 300.ms, duration: 600.ms),
                    ),
                  ) // runs after the above w/new duration
                      // inherits the delay & duration from move,
                      ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    controller.jenisIjinKeterangan,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'jenisIjinLegitimasi',
                    validator: FormBuilderValidators.required(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidFileLines,
                      ),
                      labelText: 'Jenis Ijin',
                      border: OutlineInputBorder(),
                      hintText: 'Surat Keterangan Usaha',
                    ),
                    controller: controller.jenisIjinLegitimasi,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    controller.keteranganDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'keteranganIjinLegitimasi',
                    validator: FormBuilderValidators.required(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.keteranganIjinLegitimasi,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      labelText: 'Keterangan',
                      border: OutlineInputBorder(),
                      hintText: '107/UU/NGT/III/2022',
                    ),
                  ),
                ],
              ),
              GFButton(
                onPressed: () {
                  if (controller.formKey.currentState?.saveAndValidate() ??
                      false) {
                    controller.saveInputIjinLegitimasi(data.id);
                    Get.back();
                    debugPrint(
                        controller.formKey.currentState?.value.toString());
                  } else {
                    debugPrint(
                        controller.formKey.currentState?.value.toString());
                    debugPrint('validation failed');
                  }
                },
                text: 'Simpan',
                color: primaryColor,
                size: GFSize.LARGE,
                fullWidthButton: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
