// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class DeviceInfo extends StatelessWidget {
  DeviceInfo({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Device Info',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Model',
                          subTitleText: controller.modelName.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Product',
                          subTitleText: controller.productName.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Brand',
                          subTitleText: controller.brandName.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Manufacturer',
                          subTitleText: controller.manufacturer.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Android Version',
                          subTitleText: controller.androidVersion.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Bootloader',
                          subTitleText: controller.bootloader.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Board',
                          subTitleText: controller.board.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Device',
                          subTitleText: controller.device.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Hardware',
                          subTitleText: controller.hardware.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Display',
                          subTitleText: controller.display.value,
                        ),
                        GFListTile(
                          color: Colors.white,
                          titleText: 'Physical Device',
                          subTitleText:
                              controller.isPhysicalDevice.value ? 'Yes' : 'No',
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
