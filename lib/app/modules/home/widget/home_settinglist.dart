// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/models/menu_grid.dart';
import 'package:akm/app/modules/home/views/components/change_office/change_office.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/views/components/device_info/device_info.dart';
import 'package:akm/app/modules/home/views/components/password/password.dart';
import 'package:akm/app/modules/home/views/components/refresh_token/refresh_token.dart';

class HomeSettingList extends StatelessWidget {
  final HomeController controller;

  HomeSettingList({
    required this.controller,
    super.key,
  });

  final SettingsThemeData dark = SettingsThemeData(
    settingsListBackground: Colors.blue.shade900,
    leadingIconsColor: Colors.white,
    settingsSectionBackground: Colors.blue.shade900,
    titleTextColor: secondaryColor,
    dividerColor: Colors.lightBlue,
    settingsTileTextColor: secondaryColor,
    inactiveSubtitleColor: Colors.green,
    tileHighlightColor: Colors.black54,
    tileDescriptionTextColor: Colors.grey,
    trailingTextColor: Colors.purple,
    inactiveTitleColor: Colors.teal,
  );

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      lightTheme: dark,
      sections: [
        SettingsSection(
          title: const Text('Account'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.email_rounded),
              title: const Text('Email'),
              description: const Text('Verify your email address'),
              onPressed: ((context) {
                // Check if email already verified
                if (auth.currentUser!.emailVerified) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.infoReverse,
                    animType: AnimType.scale,
                    title: 'Huh ?',
                    desc: 'Email already verified',
                    btnOkOnPress: () {},
                  ).show();
                } else {
                  // Send verification email
                  controller.verifyEmail();
                }
              }),
            ),
            SettingsTile.navigation(
              title: const Text('Password'),
              description: const Text('Change / set your password'),
              onPressed: ((context) {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => SetPassword(),
                );
              }),
              leading: const Icon(Icons.lock_outline_rounded),
            ),
            SettingsTile.navigation(
              // logoute
              leading: const Icon(Icons.refresh_outlined),
              title: const Text('Refresh Token'),
              description: const Text('Reauthenticate your account'),
              onPressed: (((context) async {
                showMaterialModalBottomSheet(
                  backgroundColor: secondaryColor,
                  context: context,
                  builder: (context) => RefreshToken(),
                );
              })),
            )
          ],
        ),
        SettingsSection(
          title: const Text('Hardware'),
          tiles: [
            SettingsTile.navigation(
              title: const Text('Device Info'),
              leading: const Icon(Icons.phonelink_setup_outlined),
              description: const Text('Show info for this devices'),
              onPressed: (context) {
                showMaterialModalBottomSheet(
                    context: context, builder: (context) => DeviceInfo());
              },
            )
          ],
        ),
        SettingsSection(
          title: const Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              title: const Text('Change Office'),
              leading: const Icon(Icons.location_city),
              description: const Text('Change your office for printing'),
              onPressed: (context) {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => ChangeOffice(),
                );
              },
            ),
            SettingsTile.navigation(
              title: const Text('Tutorial'),
              description: const Text('Show tutorial'),
              onPressed: ((context) {
                // showTutorial(context);
              }),
              leading: const Icon(Icons.book),
            ),
            SettingsTile.navigation(
              title: const Text('Change Role'),
              description: const Text('Switch to another role'),
              onPressed: ((context) async {
                // Check if user has multiple customClaims
                final customClaims = await auth.currentUser!.getIdTokenResult();

                final filteredMap = customClaims.claims!.entries
                    .where((element) => element.key != 'email_verified')
                    .toList();

                // get total boolean value from map customClaims
                final values = filteredMap
                    .map((e) => e.value)
                    .where((element) => element == true)
                    .toList();

                // check if user has multiple customClaims
                if (values.length >= 2) {
                  // Get value from shared preferences
                  final prefs = await SharedPreferences.getInstance();

                  // delete value from shared preferences
                  await prefs.remove('role');

                  Get.offAllNamed(Routes.GATE);
                } else {
                  // ignore: use_build_context_synchronously
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.infoReverse,
                    animType: AnimType.scale,
                    title: 'Huh ?',
                    desc: 'You only have one role',
                    btnOkOnPress: () {},
                  ).show();
                }
              }),
              leading: const Icon(Icons.switch_account_outlined),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              description: const Text('Show information about this app'),
              onPressed: ((context) {
                showAboutPag(context);
              }),
            ),
            SettingsTile.navigation(
              // logoute
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              description: const Text('Log out of your account'),
              onPressed: (((context) async {
                controller.logout();
              })),
            )
          ],
        ),
      ],
    );
  }
}
