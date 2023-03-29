import 'package:akm/app/common/style.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/types/gf_typography_type.dart';

import '../controllers/kurs_controller.dart';

class KursView extends GetView<KursController> {
  const KursView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurs Hari Ini'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabBar(
              physics: NeverScrollableScrollPhysics(),
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              tabs: [
                Tab(
                  text: 'e-Rate',
                  icon: Icon(Icons.subject_outlined),
                ),
                Tab(
                  icon: Icon(Icons.subject_outlined),
                  text: 'TT Counter',
                ),
                Tab(
                  icon: Icon(Icons.subject_outlined),
                  text: 'Bank Notes',
                ),
              ],
            ),
            Obx(() {
              return Container(
                margin: const EdgeInsets.all(10),
                child: GFTypography(
                  text: controller.isDataLoading.value
                      ? 'Loading'
                      : 'Update Terakhir: ${controller.kursList[0].lastUpdated} WIB',
                  type: GFTypographyType.typo3,
                  showDivider: false,
                ),
              );
            }),
            Expanded(
              child: TabBarView(
                children: [
                  // e-Rate
                  Obx(
                    () => controller.isDataLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount:
                                // ignore index 0
                                controller.kursList.length - 1,
                            itemBuilder: (context, index) {
                              // ignore index 0
                              index += 1;

                              var mataUangList =
                                  controller.kursList[index].mataUang;

                              // Make kurs table
                              return GFCard(
                                margin: const EdgeInsets.all(10),
                                elevation: 5,
                                content: GFListTile(
                                  title: Text(mataUangList ?? '',
                                      style: Get.textTheme.titleLarge),
                                  subTitle: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'Kurs Beli',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Kurs Jual',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.kursList[index].eRate
                                                    ?.eRateBeli ??
                                                '',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.kursList[index].eRate
                                                    ?.eRateJual ??
                                                '',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  // TT Counter
                  Obx(
                    () => controller.isDataLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount:
                                // ignore index 0
                                controller.kursList.length - 1,
                            itemBuilder: (context, index) {
                              // ignore index 0
                              index += 1;

                              var mataUangList =
                                  controller.kursList[index].mataUang;

                              // Make kurs table
                              return GFCard(
                                margin: const EdgeInsets.all(10),
                                elevation: 5,
                                content: GFListTile(
                                  title: Text(mataUangList ?? '',
                                      style: Get.textTheme.titleLarge),
                                  subTitle: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'Kurs Beli',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Kurs Jual',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.kursList[index].ttCounter
                                                    ?.ttCounterBeli ??
                                                '',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.kursList[index].ttCounter
                                                    ?.ttCounterJual ??
                                                '',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  // Bank Notes
                  Obx(
                    () => controller.isDataLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount:
                                // ignore index 0
                                controller.kursList.length - 1,
                            itemBuilder: (context, index) {
                              // ignore index 0
                              index += 1;

                              var mataUangList =
                                  controller.kursList[index].mataUang;

                              // Make kurs table
                              return GFCard(
                                margin: const EdgeInsets.all(10),
                                elevation: 5,
                                content: GFListTile(
                                  title: Text(mataUangList ?? '',
                                      style: Get.textTheme.titleLarge),
                                  subTitle: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'Kurs Beli',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Kurs Jual',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.kursList[index].bankNotes
                                                    ?.bankNotesBeli ??
                                                '',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.kursList[index].bankNotes
                                                    ?.bankNotesJual ??
                                                '',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
