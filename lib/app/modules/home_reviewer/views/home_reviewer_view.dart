// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:about/about.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/common/waves.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/views/components/device_info/device_info.dart';
import 'package:akm/app/modules/home/views/components/password/password.dart';
import 'package:akm/app/modules/home/views/components/refresh_token/refresh_token.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/home_reviewer_controller.dart';

// ignore: must_be_immutable
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

  final homeCtrl = Get.put(HomeController());

  final account = FirebaseAuth.instance.currentUser?.displayName ?? 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
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
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const GFTypography(
                        text: 'Reviewer Dashboard',
                        fontWeight: FontWeight.bold,
                        type: GFTypographyType.typo1,
                        textColor: primaryColor,
                        dividerColor: primaryColor,
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
                              size:
                                  const Size(double.infinity, double.infinity),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 15,
                            ),
                            child: Row(
                              children: [
                                Obx(() => CircleAvatar(
                                      radius: 30,
                                      child: CachedNetworkImage(
                                        imageUrl: homeCtrl.profileImage.value ==
                                                ''
                                            ? 'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'
                                            : '${homeCtrl.profileImage}',
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.check,
                                  color: GFColors.SUCCESS,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Obx(() => SizedBox(
                                      width: 400,
                                      child: Text(
                                        'Running on ${homeCtrl.brandName} ${homeCtrl.productName} ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Obx(() =>
                                    homeCtrl.address.value == 'Getting address'
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                            ),
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.locationDot,
                                            color: GFColors.DANGER,
                                          )),
                                const SizedBox(
                                  width: 8,
                                ),
                                Obx(() =>
                                    homeCtrl.address.value == 'Getting address'
                                        ? SizedBox(
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'Getting address',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                // IconButton(
                                                //   onPressed: () {
                                                //     homeCtrl.getLocation();
                                                //   },
                                                //   icon: const Icon(
                                                //     FontAwesomeIcons.sync,
                                                //     color: Colors.white,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            width: 400,
                                            child: Text(
                                              'You are at ${homeCtrl.address}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                          )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LayoutBuilder(
                            builder: (context, constraint) {
                              List items = [
                                {
                                  'id': 1,
                                  'category_name': 'Berita Terbaru',
                                  'route': Routes.RSS_FEED
                                },
                                {
                                  'id': 2,
                                  'category_name': 'Kurs Hari Ini',
                                  'route': Routes.KURS
                                },
                                {
                                  'id': 3,
                                  'category_name': 'Video BPD DIY',
                                  'route': Routes.YOUTUBE_FEED
                                },
                                {
                                  'id': 4,
                                  'category_name': 'Panduan Penggunaan',
                                  'route': 'Routes.ADD_DEBITUR'
                                },
                                {
                                  'id': 5,
                                  'category_name': 'Instagram BPD DIY',
                                  'route': Routes.INSTAGRAM_FEED
                                },
                                {
                                  'id': 6,
                                  'category_name': 'Crypto',
                                  'route': Routes.CRYPTO,
                                }
                              ];
                              return Wrap(
                                children: List.generate(
                                  items.length,
                                  (index) {
                                    var item = items[index];
                                    return InkWell(
                                      onTap: () {
                                        // navigate to route
                                        Get.toNamed(item["route"]);
                                      },
                                      child: SizedBox(
                                        height: 50,
                                        child: Card(
                                          color: primaryColor,
                                          elevation: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0,
                                              vertical: 4.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  item["category_name"],
                                                  style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: secondaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.REVIEWER_PENDING_LIST,
                                  arguments: controller.uid);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                            "https://user-images.githubusercontent.com/45744788/216493054-ff62cc81-a6f5-4360-a468-f70f6b81272d.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        color: Colors.blue[400],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Pengajuan Pending",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Difficulty",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              const Icon(
                                                Icons.circle,
                                                size: 4.0,
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange[400],
                                                size: 16.0,
                                              ),
                                              const Text(
                                                "Easy",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          const Text(
                                            "Nilai pengajuan yang dikirimkan oleh Analis",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.REVIEWER_COMPLETED_LIST,
                                  arguments: controller.uid);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                            "https://user-images.githubusercontent.com/45744788/216493335-b2e6e08d-fd1e-4426-88e3-775d642bcef4.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        color: Colors.blue[400],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Sudah Direview",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Difficulty",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              const Icon(
                                                Icons.circle,
                                                size: 4.0,
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange[400],
                                                size: 16.0,
                                              ),
                                              const Text(
                                                "Easy",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          const Text(
                                            "Pengajuan yang sudah di review",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.REVIEWER_STATS);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                            "https://user-images.githubusercontent.com/45744788/216333023-cf90e721-d1f7-42dd-b084-cfb2b3e96fdf.png",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        color: Colors.blue[400],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Statistik & Data",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Difficulty",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              const Icon(
                                                Icons.circle,
                                                size: 4.0,
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange[400],
                                                size: 16.0,
                                              ),
                                              const Text(
                                                "Easy",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          const Text(
                                            "Statistik dan data mengenai akunmu",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
        backgroundColor: primaryColor,
        color: secondaryColor,
        items: [
          BottomBarItem(iconData: Icons.home_filled),
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
