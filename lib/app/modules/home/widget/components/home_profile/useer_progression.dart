// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class UserStatAndProgression extends StatelessWidget {
  const UserStatAndProgression({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            color: Colors.blue[900]?.withOpacity(0.9),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
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
                          "Total plafond yang disetujui",
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
                            Obx(() => controller.isMyInputProcessing.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    controller.totalPlafond.toString(),
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
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.redeem,
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
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            color: Colors.blue[900]?.withOpacity(0.9),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
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
                          "Total plafond yang ditolak",
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
                            Obx(() => controller.isMyInputProcessing.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    controller.totalPlafondRejected.toString(),
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
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.sell,
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
    );
  }
}
