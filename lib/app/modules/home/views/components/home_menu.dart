// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:getwidget/colors/gf_color.dart';
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
            height: 40,
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.min,
          //   children: const [
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8),
          //       child: Text(
          //         'Menu Utama',
          //         style: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.bold,
          //           color: secondaryColor,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Obx(
          //   () => Center(
          //     // child: Text(
          //     //   '${controller.isDarkModeEnabled.value ? 'Dark' : 'Light'} Mode',
          //     // ),
          //     child: Column(
          //       children: [
          //         Text(
          //           controller.isDarkModeEnabled.value
          //               ? 'Dark Mode (Beta)'
          //               : 'Light Mode',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             color: controller.isDarkModeEnabled.value
          //                 ? Colors.white
          //                 : Colors.black,
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         Icon(
          //           controller.isDarkModeEnabled.value
          //               ? Icons.brightness_3
          //               : Icons.brightness_7,
          //           size: 30,
          //           color: controller.isDarkModeEnabled.value
          //               ? Colors.yellow
          //               : Colors.black,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // ObxValue(
          //   (data) => Switch(
          //     value: controller.isDarkModeEnabled.value,
          //     onChanged: (val) {
          //       controller.isDarkModeEnabled.value = val;
          //       Get.changeThemeMode(
          //         controller.isDarkModeEnabled.value
          //             ? ThemeMode.dark
          //             : ThemeMode.light,
          //       );
          //       controller.saveThemeStatus();
          //     },
          //   ),
          //   false.obs,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }
}
