// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../../../common/style.dart';
 import '../../../../../routes/app_pages.dart';

class ThirdRow extends StatelessWidget {
  const ThirdRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          child: InkWell(
            onTap: () => Get.offAllNamed(Routes.PRO_PENGAJUAN_APPROVE),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                const Positioned(
                  right: 25,
                  bottom: 40,
                  child: Icon(
                    Icons.handshake,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Approval',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          child: InkWell(
            onTap: () => Get.offAllNamed(Routes.AGUNAN),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                const Positioned(
                  right: 25,
                  bottom: 40,
                  child: Icon(
                    Icons.car_rental_outlined,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Agunan',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          child: InkWell(
            onTap: () => Get.snackbar(
              // Add work in progress snackbar
              'Work in progress',
              'This feature is still under development',
              backgroundColor: primaryColor,
              colorText: secondaryColor,
              snackPosition: SnackPosition.top,
              duration: const Duration(seconds: 2),
              icon: const Icon(
                Icons.construction,
                color: Colors.white,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                const Positioned(
                  right: 25,
                  bottom: 40,
                  child: Icon(
                    Icons.settings,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
