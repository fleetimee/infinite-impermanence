// 🐦 Flutter imports:
import 'package:akm/app/modules/home/views/components/change_office/change_office.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:about/about.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/views/components/device_info/device_info.dart';
import 'package:akm/app/modules/home/views/components/password/password.dart';
import 'package:akm/app/modules/home/views/components/refresh_token/refresh_token.dart';
import '../controllers/home_pengutus_controller.dart';

class PengutusSettingList extends StatelessWidget {
  PengutusSettingList({
    super.key,
    required this.controller,
  });

  final HomePengutusController controller;

  final SettingsThemeData dark = SettingsThemeData(
    settingsListBackground: Colors.pink[600],
    leadingIconsColor: secondaryColor,
    settingsSectionBackground: Colors.pink[600],
    titleTextColor: secondaryColor,
    dividerColor: Colors.lightBlue,
    settingsTileTextColor: secondaryColor,
    inactiveSubtitleColor: Colors.green,
    tileHighlightColor: Colors.black54,
    tileDescriptionTextColor: secondaryColor,
    trailingTextColor: Colors.purple,
    inactiveTitleColor: Colors.teal,
  );

  Future<void> showAboutPag(BuildContext context) {
    return showAboutPage(
      applicationName: 'Analisis Kredit Mikro',
      context: context,
      values: {
        'version': '0.5.5',
        'year': DateTime.now().year.toString(),
      },
      applicationLegalese: 'Copyright © Novian Andika, {{ year }}',
      applicationDescription: const Text(
          'Analisis Kredit Mikro bertujuan untuk memudahkan penginputan calon debitur serta aplikasi ini juga dapat langsung menganalisa diterima atau tidaknya debitur tersebut dengan berbagai parameter yang sudah dibuat.'),
      children: const <Widget>[
        MarkdownPageListTile(
          filename: 'ABOUT.md',
          title: Text('View Readme'),
          icon: Icon(Icons.all_inclusive),
        ),
        MarkdownPageListTile(
          icon: Icon(Icons.list),
          title: Text('Changelog'),
          filename: 'CHANGELOG.md',
        ),
        MarkdownPageListTile(
          filename: 'LICENSE.md',
          title: Text('View License'),
          icon: Icon(Icons.description),
        ),
        MarkdownPageListTile(
          filename: 'CONTRIBUTING.md',
          title: Text('Contributing'),
          icon: Icon(Icons.share),
        ),
        MarkdownPageListTile(
          filename: 'CODE_OF_CONDUCT.md',
          title: Text('Code of conduct'),
          icon: Icon(Icons.sentiment_satisfied),
        ),
        LicensesPageListTile(
          title: Text('Open source Licenses'),
          icon: Icon(Icons.favorite),
        ),
      ],
      applicationIcon: const SizedBox(
        width: 100,
        height: 100,
        child: Image(
          image: AssetImage('assets/images/splash_screen/splash_icon.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SettingsList(
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
                    InfoDialogPink(
                      context: context,
                      title: 'Huh ?',
                      desc: 'Email sudah diverifikasi',
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
                      context: context, builder: (context) => SetPassword());
                }),
                leading: const Icon(Icons.lock_outline_rounded),
              ),
              SettingsTile.navigation(
                // logoute
                leading: const Icon(Icons.refresh_outlined),
                title: const Text('Refresh Token'),
                description: const Text('Reauthenticate your account'),
                onPressed: (((context) async {
                  // final prefs = await SharedPreferences.getInstance();

                  // await prefs.clear();
                  // controller.logout();
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
      ),
    );
  }
}
