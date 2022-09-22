// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

// 🌎 Project imports:
 import '../../controllers/home_controller.dart';
import 'menu_item/first_row.dart';
import 'menu_item/greeting.dart';
import 'menu_item/second_row.dart';
import 'menu_item/third_row.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Greeting(),
        const SizedBox(
          height: 40,
        ),
        Obx(
          () => DigitalClock(
            digitAnimationStyle: Curves.elasticOut,
            is24HourTimeFormat: true,
            areaDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            hourMinuteDigitTextStyle: TextStyle(
              color: controller.isDarkModeEnabled.value
                  ? Colors.white
                  : Colors.black,
              fontSize: 50,
            ),
            amPmDigitTextStyle: TextStyle(
              color: controller.isDarkModeEnabled.value
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const FirstRow(),
        const SizedBox(
          height: 20,
        ),
        const SecondRow(),
        const SizedBox(
          height: 20,
        ),
        const ThirdRow(),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => Center(
            // child: Text(
            //   '${controller.isDarkModeEnabled.value ? 'Dark' : 'Light'} Mode',
            // ),
            child: Column(
              children: [
                Text(
                  controller.isDarkModeEnabled.value
                      ? 'Dark Mode (Beta)'
                      : 'Light Mode',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: controller.isDarkModeEnabled.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  controller.isDarkModeEnabled.value
                      ? Icons.brightness_3
                      : Icons.brightness_7,
                  size: 30,
                  color: controller.isDarkModeEnabled.value
                      ? Colors.yellow
                      : Colors.black,
                ),
              ],
            ),
          ),
        ),
        ObxValue(
          (data) => Switch(
            value: controller.isDarkModeEnabled.value,
            onChanged: (val) {
              controller.isDarkModeEnabled.value = val;
              Get.changeThemeMode(
                controller.isDarkModeEnabled.value
                    ? ThemeMode.dark
                    : ThemeMode.light,
              );
              controller.saveThemeStatus();
            },
          ),
          false.obs,
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => Text(
            'Version 1.0.0',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: controller.isDarkModeEnabled.value
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ]),
    );
  }
}
