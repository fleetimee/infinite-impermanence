import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/views/components/menu_item/first_row.dart';
import 'package:akm/app/modules/home/views/components/menu_item/greeting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Greeting(),
        const SizedBox(
          height: 20,
        ),
        const FirstRow(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
