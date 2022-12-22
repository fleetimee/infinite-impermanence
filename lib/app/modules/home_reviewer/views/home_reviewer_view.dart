import 'package:about/about.dart';
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/views/components/device_info/device_info.dart';
import 'package:akm/app/modules/home/views/components/password/password.dart';
import 'package:akm/app/modules/home/views/components/refresh_token/refresh_token.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_reviewer_controller.dart';

class HomeReviewerView extends GetView<HomeReviewerController> {
  HomeReviewerView({Key? key}) : super(key: key);

  SettingsThemeData dark = const SettingsThemeData(
    settingsListBackground: secondaryColor,
    leadingIconsColor: primaryColor,
    settingsSectionBackground: secondaryColor,
    titleTextColor: primaryColor,
    dividerColor: Colors.lightBlue,
    settingsTileTextColor: primaryColor,
    inactiveSubtitleColor: Colors.green,
    tileHighlightColor: Colors.black54,
    tileDescriptionTextColor: primaryColor,
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
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          content: const Text(
            'Press again to exit',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        child: PageView(
          controller: controller.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Center(
              child: Text(
                'HomeReviewerView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SafeArea(
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
                            // controller.verifyEmail();
                          }
                        }),
                      ),
                      SettingsTile.navigation(
                        title: const Text('Password'),
                        description: const Text('Change / set your password'),
                        onPressed: ((context) {
                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SetPassword());
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
                              context: context,
                              builder: (context) => DeviceInfo());
                        },
                      )
                    ],
                  ),
                  SettingsSection(
                    title: const Text('Common'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(Icons.info_outline),
                        title: const Text('About'),
                        description:
                            const Text('Show information about this app'),
                        onPressed: ((context) {
                          showAboutPag(context);
                        }),
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
                          final customClaims =
                              await auth.currentUser!.getIdTokenResult();

                          final filteredMap = customClaims.claims!.entries
                              .where(
                                  (element) => element.key != 'email_verified')
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
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO,
                              animType: AnimType.SCALE,
                              title: 'Huh ?',
                              desc: 'You only have one role',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        }),
                        leading: const Icon(Icons.switch_account_outlined),
                      ),
                      SettingsTile.navigation(
                        // logoute
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        description: const Text('Log out of your account'),
                        onPressed: (((context) async {
                          final prefs = await SharedPreferences.getInstance();

                          await prefs.setBool('pernahLogin', true);

                          // clear shared preferences id
                          await prefs.remove('id');
                          await prefs.remove('photo');
                          await prefs.remove('role');
                          controller.logout();
                        })),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarBubble(
        color: primaryColor,
        items: [
          BottomBarItem(iconData: Icons.file_copy_sharp),
          BottomBarItem(iconData: Icons.settings),
        ],
        onSelect: (index) {
          controller.controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
