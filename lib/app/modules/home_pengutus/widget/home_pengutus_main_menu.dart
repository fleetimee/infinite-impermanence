// 🐦 Flutter imports:
import 'package:akm/app/modules/home_pengutus/widget/components/home_pengutus_main_menu/home_pengutus_main_menu_button.dart';
import 'package:akm/app/modules/home_pengutus/widget/components/home_pengutus_main_menu/home_pengutus_main_menu_device_information.dart';
import 'package:akm/app/modules/home_pengutus/widget/components/home_pengutus_main_menu/home_pengutus_main_menu_grettings.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import '../controllers/home_pengutus_controller.dart';

class PengutusMainMenu extends StatelessWidget {
  const PengutusMainMenu({
    super.key,
    required this.homeCtrl,
    required this.account,
    required this.controller,
  });

  final HomeController homeCtrl;
  final String account;
  final HomePengutusController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const GFTypography(
                text: 'Pemutus Dashboard',
                fontWeight: FontWeight.bold,
                type: GFTypographyType.typo1,
                textColor: secondaryColor,
                dividerColor: secondaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              PengutusGreeting(
                homeCtrl: homeCtrl,
                account: account,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PengutusDeviceInformation(
                    homeCtrl: homeCtrl,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PemutusButton(
                    controller: controller,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
