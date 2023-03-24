// 🐦 Flutter imports:

import 'package:akm/app/common/style.dart';
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
                Obx(
                  () => controller.address.value == 'Getting address'
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
                        ),
                ),
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
                Obx(() => controller.mainBranch.value == '...' &&
                        controller.helperBranch.value == '...'
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        FontAwesomeIcons.building,
                        color: GFColors.INFO,
                      )),
                const SizedBox(
                  width: 8,
                ),
                Obx(() => controller.mainBranch.value == '...' &&
                        controller.helperBranch.value == '...'
                    ? SizedBox(
                        child: Row(
                          children: const [
                            Text(
                              '...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: 400,
                        child: Text(
                          '${controller.mainBranch} / ${controller.helperBranch}',
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
