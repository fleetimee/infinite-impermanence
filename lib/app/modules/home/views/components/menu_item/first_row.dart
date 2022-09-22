// ignore_for_file: avoid_print

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../../../common/style.dart';
 import '../../../../../routes/app_pages.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
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
            onTap: () => Get.snackbar(
              'Whoops',
              'Anda berada di home',
              backgroundColor: primaryColor,
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              colorText: secondaryColor,
              duration: const Duration(seconds: 2),
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
                    Icons.home,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 15,
                  child: Text(
                    'Home',
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
            onTap: () => Get.offAllNamed(Routes.DEBITUR_REAL),
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
                    Icons.group,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Debitur',
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
            onTap: () => Get.toNamed(Routes.SEARCH_NIK),
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
                    Icons.search,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Search',
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
