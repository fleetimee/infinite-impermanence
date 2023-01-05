// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
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
        centerTitle: true,
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
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Obx(() => ListView(
                        children: [
                          controller.customClaims.contains('analis')
                              ? Card(
                                  color: blue200,
                                  elevation: 5,
                                  child: GFListTile(
                                    avatar: Lottie.asset(
                                      'assets/images/home/writing.zip',
                                      height: 80,
                                    ),
                                    title: const Text(
                                      'Analis',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    onTap: () async {
                                      // Initialize the shared preferences
                                      final prefs =
                                          await SharedPreferences.getInstance();

                                      await prefs.setString('role', 'analis');

                                      Get.offAllNamed(Routes.HOME);
                                    },
                                  ),
                                )
                              : Container(),
                          // Separate the list tile with divider

                          controller.customClaims.contains('reviewer')
                              ? Card(
                                  color: blue200,
                                  elevation: 5,
                                  child: GFListTile(
                                    avatar: Lottie.asset(
                                      'assets/images/home/pengajuan_create.zip',
                                      height: 80,
                                    ),
                                    title: const Text(
                                      'Reviewer',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    onTap: () async {
                                      // Initialize the shared preferences
                                      final prefs =
                                          await SharedPreferences.getInstance();

                                      await prefs.setString('role', 'reviewer');

                                      Get.offAllNamed(Routes.HOME_REVIEWER);
                                    },
                                  ),
                                )
                              : Container(),
                          controller.customClaims.contains('pengutus')
                              ? Card(
                                  color: blue200,
                                  elevation: 5,
                                  child: GFListTile(
                                    avatar: Lottie.asset(
                                      'assets/images/home/checked.zip',
                                      height: 80,
                                    ),
                                    title: const Text(
                                      'Pemutus',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    listItemTextColor: Colors.white,
                                    onTap: () async {
                                      // Initialize the shared preferences
                                      final prefs =
                                          await SharedPreferences.getInstance();

                                      await prefs.setString('role', 'pengutus');

                                      Get.offAllNamed(Routes.HOME_PENGUTUS);
                                    },
                                  ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.logout();
        },
        label: const Text(
          'Logout',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        isExtended: true,
        tooltip: 'Logout',
        elevation: 10,
        icon: const Icon(Icons.logout),
        backgroundColor: primaryColor,
      ),
    );
  }
}
