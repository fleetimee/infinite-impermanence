// 🐦 Flutter imports:

import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';

// 🌎 Project imports:
import '../../controllers/home_controller.dart';
import 'menu_item/greeting.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Greeting(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.check,
                  color: GFColors.SUCCESS,
                ),
                const SizedBox(
                  width: 8,
                ),
                Obx(() => SizedBox(
                      width: 400,
                      child: Text(
                        'Running on ${controller.brandName} ${controller.productName} ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Obx(() => controller.address.value == 'Getting address'
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        FontAwesomeIcons.locationDot,
                        color: GFColors.DANGER,
                      )),
                const SizedBox(
                  width: 8,
                ),
                Obx(() => controller.address.value == 'Getting address'
                    ? SizedBox(
                        child: Row(
                          children: const [
                            Text(
                              'Getting address',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // IconButton(
                            //   onPressed: () {
                            //     controller.getLocation();
                            //   },
                            //   icon: const Icon(
                            //     FontAwesomeIcons.sync,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: 400,
                        child: Text(
                          'You are at ${controller.address}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          LayoutBuilder(
            builder: (context, constraint) {
              List items = [
                {
                  'id': 1,
                  'category_name': 'Berita Terbaru',
                  'route': Routes.RSS_FEED
                },
                {
                  'id': 2,
                  'category_name': 'Kurs Hari Ini',
                  'route': Routes.KURS
                },
                {
                  'id': 3,
                  'category_name': 'Video BPD DIY',
                  'route': Routes.YOUTUBE_FEED
                },
                {
                  'id': 4,
                  'category_name': 'Panduan Penggunaan',
                  'route': 'Routes.ADD_DEBITUR'
                },
                {
                  'id': 5,
                  'category_name': 'Instagram BPD DIY',
                  'route': Routes.INSTAGRAM_FEED
                },
                {
                  'id': 6,
                  'category_name': 'Crypto',
                  'route': Routes.CRYPTO,
                }
              ];
              return Wrap(
                children: List.generate(
                  items.length,
                  (index) {
                    var item = items[index];
                    return InkWell(
                      onTap: () {
                        // navigate to route
                        Get.toNamed(item["route"]);
                      },
                      child: SizedBox(
                        height: 50,
                        child: Card(
                          color: primaryColor,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item["category_name"],
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: primaryColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Terinput",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    children: [
                                      Obx(() => controller
                                              .isMyInputProcessing.value
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              controller.listMyInput.length
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                                color: secondaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.people,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Card(
                      color: primaryColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Diajukan",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    children: [
                                      Obx(() => controller
                                              .isMySubmissionProcessing.value
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              controller.listMySubmission.length
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                                color: secondaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.send,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
