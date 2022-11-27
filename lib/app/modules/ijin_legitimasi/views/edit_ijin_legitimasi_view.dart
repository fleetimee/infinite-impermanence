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

class EditIjinLegitimasiView extends GetView<IjinLegitimasiController> {
  EditIjinLegitimasiView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Ijin Legitimasi'),
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
                      child: const GFCard(
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
                          color: Colors.white,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(
                              delay: 300.ms,
                              duration:
                                  600.ms) // runs after the above w/new duration
                      // inherits the delay & duration from move,
                      ),
                  FormBuilderTextField(
                    name: 'jenisIjinLegitimasi',
                    validator: FormBuilderValidators.required(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.jenisIjinLegitimasi =
                        TextEditingController(
                            text: data.ijinLegitimasi.jenisIjin),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidFileLines,
                      ),
                      labelText: 'Jenis Ijin',
                      border: OutlineInputBorder(),
                      hintText: 'Surat Keterangan Usaha',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'keteranganIjinLegitimasi',
                    validator: FormBuilderValidators.required(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.keteranganIjinLegitimasi =
                        TextEditingController(
                            text: data.ijinLegitimasi.keteranganIjin),
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
                    controller.editInputIjinLegitimasi(
                        data.id, data.ijinLegitimasi.id);
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
