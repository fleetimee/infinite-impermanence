import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/gate_controller.dart';

class GateView extends GetView<GateController> {
  const GateView({Key? key}) : super(key: key);

  // Get list of customClaims
  // Get list of roles

  // Generate list of roles
  List<Widget> _roles() {
    return controller.customClaims
        .map<Widget>(
          (e) => Container(
            margin: const EdgeInsets.all(5),
            child: Chip(
              label: Text(e),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Roles and Claims'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    const Text(
                      'Sepertinya anda memiliki beberapa role',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Silahkan pilih salah satu role untuk melanjutkan',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Role yang anda miliki:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _roles(),
                        )),
                  ],
                ),
                Expanded(
                  child: Obx(() => ListView(
                        children: [
                          controller.customClaims.contains('analis')
                              ? GFListTile(
                                  avatar: Lottie.asset(
                                    'assets/images/home/writing.zip',
                                    height: 80,
                                  ),
                                  titleText: 'Analis',
                                  onTap: () async {
                                    // Initialize the shared preferences
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setString('role', 'analis');

                                    Get.offAllNamed(Routes.HOME);
                                  },
                                )
                              : Container(),
                          controller.customClaims.contains('reviewer')
                              ? GFListTile(
                                  avatar: Lottie.asset(
                                    'assets/images/home/pengajuan_create.zip',
                                    height: 80,
                                  ),
                                  titleText: 'Reviewer',
                                  onTap: () async {
                                    // Initialize the shared preferences
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setString('role', 'reviewer');

                                    Get.offAllNamed(Routes.HOME_REVIEWER);
                                  },
                                )
                              : Container(),
                          controller.customClaims.contains('pengutus')
                              ? GFListTile(
                                  avatar: Lottie.asset(
                                    'assets/images/home/pengajuan_create.zip',
                                    height: 80,
                                  ),
                                  titleText: 'Pengutus',
                                  onTap: () {},
                                )
                              : Container(),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
