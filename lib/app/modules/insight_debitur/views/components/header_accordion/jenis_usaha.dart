// ignore_for_file: prefer_is_empty

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/modules/usaha_analisis/controllers/usaha_analisis_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';

class HeaderJenisUsaha extends StatelessWidget {
  HeaderJenisUsaha({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TabBar(
        controller: controller.tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: primaryColor,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.battleNet,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Jenis Usaha',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuAnalisaJenisUsaha extends StatelessWidget {
  MenuAnalisaJenisUsaha({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaJenisUsahaController = Get.put(UsahaAnalisisController());

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
                'Analisa Jenis Usaha',
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
                  if (analisaJenisUsahaController
                      .isAnalisaUsahaProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaJenisUsaha ==
                        null) {
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
              Obx(
                () {
                  if (analisaJenisUsahaController
                      .isAnalisaUsahaProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.analisaJenisUsaha ==
                                null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.USAHA_ANALISIS,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  child: const Text(
                                    "Input",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          Get.toNamed(
                                              Routes.LIHAT_USAHA_ANALISIS,
                                              arguments: controller
                                                  .insightDebitur.value);
                                        },
                                        child: const Text(
                                          "Lihat",
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          Get.toNamed(
                                              Routes.EDIT_USAHA_ANALISIS,
                                              arguments: controller
                                                  .insightDebitur.value);
                                        },
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}
