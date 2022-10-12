// ignore_for_file: prefer_is_empty

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class MenuMasukFormAgunan extends StatelessWidget {
  MenuMasukFormAgunan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final selectedAgunanController = Get.put(AgunanPilihController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GFAccordion(
          titleChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Isian Form Agunan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Obx(
                () {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.agunan?.length == 0) {
                      return Row(
                        children: const [
                          Text(
                            'Belum di-input',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.red,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sudah di-input',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Obx(() {
                if (selectedAgunanController.isAgunanInputProcessing.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        // ! HERE
                        child: FormMultipleButton(controller: controller),
                      ),
                    ],
                  );
                }
              })
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}

class FormMultipleButton extends StatelessWidget {
  FormMultipleButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InsightDebiturController controller;
  final selectedAgunanController = Get.put(AgunanPilihController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {
              // showBarModalBottomSheet(
              //   bounce: true,
              //   backgroundColor: secondaryColor,
              //   context: context,
              //   builder: (context) => SizedBox(
              //     height: 650,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const GFCard(
              //           boxFit: BoxFit.cover,
              //           titlePosition: GFPosition.start,
              //           showOverlayImage: true,
              //           imageOverlay: AssetImage(
              //             'assets/images/home/printing.jpg',
              //           ),
              //           colorFilter: ColorFilter.mode(
              //             Color.fromARGB(221, 8, 8, 8),
              //             BlendMode.darken,
              //           ),
              //           title: GFListTile(
              //             title: Text(
              //               'Tambah Agunan',
              //               style: TextStyle(
              //                 color: secondaryColor,
              //                 fontSize: 47,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //           content: Text(
              //             "Kumpulan form agunan yang ditujukan untuk penginputan sesuai dengan jenis agunan yang dipilih.",
              //             style: TextStyle(
              //               color: secondaryColor,
              //               fontSize: 28,
              //               fontWeight: FontWeight.w400,
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           child: ListView(
              //             children: [
              //               Obx(() {
              //                 if (selectedAgunanController
              //                     .isAgunanInputProcessing.value) {
              //                   return const Center(
              //                     child: CircularProgressIndicator(),
              //                   );
              //                 } else {
              //                   return TanahForm(controller: controller);
              //                 }
              //               }),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // );
              Get.toNamed(Routes.AGUNAN_FORM_ONBOARDING,
                  arguments: controller.insightDebitur.value);
            },
            child: const Text(
              "Ke Form",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
