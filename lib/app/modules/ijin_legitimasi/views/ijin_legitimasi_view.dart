import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

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
                      child: const GFCard(
                    boxFit: BoxFit.cover,
                    titlePosition: GFPosition.start,
                    showOverlayImage: true,
                    imageOverlay: NetworkImage(
                      'https://i0.wp.com/www.animegeek.com/wp-content/uploads/2022/08/Lycoris-Recoil-Season-2-release-date-Anime.jpg?resize=1024%2C576&ssl=1',
                    ),
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(136, 0, 0, 0),
                      BlendMode.darken,
                    ),
                    title: GFListTile(
                      title: Text(
                        'Ijin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Text(
                      'Legitimasi',
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
                      decoration: const InputDecoration(
                        labelText: 'Jenis Ijin',
                        border: OutlineInputBorder(),
                        hintText: 'Surat Keterangan Usaha',
                      ),
                      controller: controller.jenisIjinLegitimasi),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'keteranganIjinLegitimasi',
                    controller: controller.keteranganIjinLegitimasi,
                    decoration: const InputDecoration(
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
