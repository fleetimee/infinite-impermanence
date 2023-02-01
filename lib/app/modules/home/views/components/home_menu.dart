// 🐦 Flutter imports:
// ignore_for_file: unused_import

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/simulasi_tetap/views/simulasi_tetap_view.dart';
// ignore: unused_import
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
                  'route': 'Routes.ADD_DEBITUR'
                },
                {
                  'id': 6,
                  'category_name': 'Crypto',
                  'route': 'Routes.ADD_DEBITUR'
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
        ],
      ),
    );
  }
}
