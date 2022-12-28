import 'package:about/about.dart';
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/common/waves.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/views/components/device_info/device_info.dart';
import 'package:akm/app/modules/home/views/components/password/password.dart';
import 'package:akm/app/modules/home/views/components/refresh_token/refresh_token.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../controllers/home_pengutus_controller.dart';

class HomePengutusView extends GetView<HomePengutusController> {
  HomePengutusView({Key? key}) : super(key: key);

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

  final homeCtrl = Get.put(HomeController());

  final account = FirebaseAuth.instance.currentUser?.displayName ?? 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[600],
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
            SafeArea(
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
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: WaveWidget(
                            config: CustomConfig(
                              colors: WavesSettings.waveColors,
                              heightPercentages:
                                  WavesSettings.waveHeightPercentages,
                              durations: WavesSettings.waveDurations,
                            ),
                            waveAmplitude: 10,
                            size: const Size(double.infinity, double.infinity),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          child: Row(
                            children: [
                              // FutureBuilder(
                              //   future: controller.img,
                              //   builder: (context, snapshot) {
                              //     if (snapshot.connectionState == ConnectionState.waiting) {
                              //       return const Shimmer(
                              //         gradient: LinearGradient(
                              //           colors: [
                              //             Colors.white,
                              //             Colors.grey,
                              //           ],
                              //         ),
                              //         child: CircleAvatar(
                              //           radius: 30,
                              //           backgroundColor: Colors.white,
                              //         ),
                              //       );
                              //     } else {
                              //       return CircleAvatar(
                              //         radius: 30,
                              //         backgroundImage: NetworkImage(
                              //           snapshot.data.toString(),
                              //         ),
                              //       );
                              //     }
                              //   },
                              // ),
                              Obx(() => CircleAvatar(
                                    radius: 30,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          homeCtrl.profileImage.toString(),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selamat ${homeCtrl.greeting()}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  Text(
                                    account,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  // Date text now
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 65,
                          right: 10,
                          child: Text(
                            homeCtrl.dateNow(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const GFTypography(
                      text: 'Pending',
                      icon: Icon(
                        Icons.pending,
                        color: GFColors.LIGHT,
                      ),
                      fontWeight: FontWeight.bold,
                      type: GFTypographyType.typo1,
                      textColor: secondaryColor,
                      dividerColor: primaryColor,
                      showDivider: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 350,
                      color: Colors.pink[200],
                      child: Card(
                          color: Colors.pink[100],
                          child: Obx(() {
                            if (controller
                                .isMyPendingPemutusanProcessing.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (controller
                                  .listMyPendingPemutusan.isNotEmpty) {
                                return RefreshIndicator(
                                  onRefresh: () {
                                    return controller.refreshPemutusan();
                                  },
                                  child: ListView.builder(
                                    itemCount: controller
                                        .listMyPendingPemutusan.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: const Icon(
                                          Icons.book,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          controller
                                              .listMyPendingPemutusan[index]
                                              .id!,
                                        ),
                                        trailing:
                                            const Icon(Icons.arrow_forward_ios),
                                        onTap: () {
                                          Get.dialog(AlertDialog(
                                            title: const Text(
                                              'Detail Review',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: const Text(
                                                'Apa yang ingin anda lakukan terhadap review ini?',
                                                style: TextStyle(fontSize: 15)),
                                            actions: [
                                              if (controller.uid.value ==
                                                  controller
                                                      .listMyPendingPemutusan[
                                                          index]
                                                      .user[0]
                                                      .id)
                                                GFButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    // Get.toNamed(
                                                    //     Routes.REVIEWER_SUBMIT,
                                                    //     arguments: controller
                                                    //             .listMyPendingReview[
                                                    //         index]
                                                    //         );
                                                  },
                                                  text: 'Review',
                                                ),
                                              GFButton(
                                                onPressed: () {
                                                  Get.back();
                                                  // Get.toNamed(
                                                  //     Routes.PENGAJUAN_DETAIL,
                                                  //     arguments: controller
                                                  //         .listMyPendingReview[
                                                  //             index]
                                                  //         .id!);
                                                },
                                                text: 'Lihat Progress',
                                              )
                                            ],
                                          ));
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    'Belum ada pemutusan yang pending',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                );
                              }
                            }
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const GFTypography(
                      text: 'Completed',
                      icon: Icon(
                        Icons.check_circle,
                        color: GFColors.LIGHT,
                      ),
                      fontWeight: FontWeight.bold,
                      type: GFTypographyType.typo1,
                      textColor: secondaryColor,
                      dividerColor: primaryColor,
                      showDivider: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.pink[200],
                        child: Card(
                          color: Colors.pink[100],
                          child: Obx(() {
                            if (controller
                                .isMyCompletedPemutusanProcessing.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (controller
                                  .listMyCompletedPemutusan.isNotEmpty) {
                                return ListView.builder(
                                  itemCount: controller
                                      .listMyCompletedPemutusan.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const Icon(
                                        Icons.book,
                                        color: Colors.green,
                                      ),
                                      title: Text(
                                        controller
                                            .listMyCompletedPemutusan[index]
                                            .id!,
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        Get.dialog(AlertDialog(
                                          title: const Text(
                                            'Detail Review',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: const Text(
                                              'Apa yang ingin anda lakukan terhadap review ini?',
                                              style: TextStyle(fontSize: 15)),
                                          actions: [
                                            GFButton(
                                              onPressed: () {
                                                Get.back();
                                                Get.toNamed(
                                                    Routes.PENGAJUAN_DETAIL,
                                                    arguments: controller
                                                        .listMyCompletedPemutusan[
                                                            index]
                                                        .id!);
                                              },
                                              text: 'Lihat Progress',
                                            )
                                          ],
                                        ));
                                      },
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    'Belum ada pemutusan yang selesai',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                );
                              }
                            }
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarBubble(
        color: secondaryColor,
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
