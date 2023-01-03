// 🐦 Flutter imports:
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
            height: 40,
          ),
        ],
      ),
    );
  }
}
