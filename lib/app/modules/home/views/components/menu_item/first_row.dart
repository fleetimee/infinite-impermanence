import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            onTap: () => print('clicked'),
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
                  right: 30,
                  bottom: 40,
                  child: Icon(
                    Icons.home,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 15,
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
            onTap: () => Get.toNamed(Routes.CREATE_DEBITUR),
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
                  right: 30,
                  bottom: 40,
                  child: Icon(
                    Icons.group,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 15,
                  right: 15,
                  child: Text(
                    'Debitur',
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
            onTap: () => print('clicked'),
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
                  right: 30,
                  bottom: 40,
                  child: Icon(
                    Icons.home,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 15,
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
      ],
    );
  }
}
