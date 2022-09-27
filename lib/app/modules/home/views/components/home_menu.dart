// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

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
            height: 40,
          ),
          Obx(
            () => DigitalClock(
              digitAnimationStyle: Curves.elasticOut,
              is24HourTimeFormat: true,
              areaDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitTextStyle: const TextStyle(
                color: secondaryColor,
                fontSize: 50,
              ),
              amPmDigitTextStyle: const TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Menu Utama',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ),
            ],
          ),
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
