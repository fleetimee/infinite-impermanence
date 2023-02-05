// 🐦 Flutter imports:
// ignore_for_file: must_be_immutable, prefer_is_empty

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:about/about.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/views/components/device_info/device_info.dart';
import 'package:akm/app/modules/home/views/components/password/password.dart';
import 'package:akm/app/modules/home/views/components/profile/profile.dart';
import 'package:akm/app/modules/home/views/components/refresh_token/refresh_token.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import '../../../common/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'components/home_menu.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final Uri _url =
      Uri.parse('https://fleetimee.github.io/infinite-impermanence/#/guide');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  final List<String> imageList = [
    "assets/images/home/image1.jpg",
    "assets/images/home/image2.jpg",
    "assets/images/home/image3.jpg",
    "assets/images/home/image4.jpg",
    "assets/images/home/image5.jpg",
  ];

  SettingsThemeData dark = SettingsThemeData(
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
    var selectedIndex = 0.obs;

    return ScaffoldGradientBackground(
      resizeToAvoidBottomInset: false,
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      // drawer: SideMenu(),
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
          onPageChanged: (value) => selectedIndex.value = value,
          controller: controller.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: (ModalRoute.of(context)?.canPop ?? false)
                      ? const BackButton()
                      : null,
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: GFCarousel(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 7),
                      hasPagination: true,
                      activeIndicator: Colors.white,
                      passiveIndicator: Colors.white54,
                      enlargeMainPage: true,
                      pagerSize: 10,

                      viewportFraction: 0.9,
                      items: imageList.map(
                        (url) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Image.asset(
                                url,
                                fit: BoxFit.cover,
                                width: 1000.0,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      // onPageChanged: (index) {
                      //   controller.pageChanged(index);

                      // },
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: HomeMenu(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(
                              Routes.DEBITUR_REAL,
                            ),
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          // Gradient color
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.blue,
                                              primaryColor,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 50,
                                        child: Text(
                                          'Debitur',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -170,
                                        right: -15,
                                        // child: Image.asset(
                                        //   'assets/images/home/robot.png',
                                        //   fit: BoxFit.cover,
                                        //   height: 380,
                                        // ),
                                        child: SvgPicture.asset(
                                          'assets/images/home/robot.svg',
                                          fit: BoxFit.cover,
                                          height: 380,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => _launchUrl(),
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          // Gradient color
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.blue,
                                              primaryColor,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 95,
                                        child: Text(
                                          'User',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 55,
                                        right: 20,
                                        child: Text(
                                          'Guide   ',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        right: 5,
                                        // child: Image.asset(
                                        //   'assets/images/home/money.png',
                                        //   fit: BoxFit.cover,
                                        //   height: 250,
                                        // ),
                                        child: SvgPicture.asset(
                                          'assets/images/home/help.svg',
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(
                              Routes.SIMULASI_TETAP,
                            ),
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          // Gradient color
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.blue,
                                              primaryColor,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 35,
                                        child: Text(
                                          'Simulasi',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 55,
                                        right: 20,
                                        child: Text(
                                          'Tetap   ',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        right: -45,
                                        // child: Image.asset(
                                        //   'assets/images/home/money.png',
                                        //   fit: BoxFit.cover,
                                        //   height: 250,
                                        // ),
                                        child: SvgPicture.asset(
                                          'assets/images/home/tetap.svg',
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(
                              Routes.PORSEKOT_TABLE,
                            ),
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          // Gradient color
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.blue,
                                              primaryColor,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 35,
                                        child: Text(
                                          'Simulasi',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 55,
                                        right: 35,
                                        child: Text(
                                          'Porsekot',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -50,
                                        right: -15,
                                        // child: Image.asset(
                                        //   'assets/images/home/money.png',
                                        //   fit: BoxFit.cover,
                                        //   height: 250,
                                        // ),
                                        child: SvgPicture.asset(
                                          'assets/images/home/money.svg',
                                          fit: BoxFit.cover,
                                          height: 250,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => showAboutPag(context),
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          // Gradient color
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.blue,
                                              primaryColor,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 70,
                                        child: Text(
                                          'About',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -50,
                                        right: -15,
                                        // child: Image.asset(
                                        //   'assets/images/home/money.png',
                                        //   fit: BoxFit.cover,
                                        //   height: 250,
                                        // ),
                                        child: SvgPicture.asset(
                                          'assets/images/home/about.svg',
                                          fit: BoxFit.cover,
                                          height: 250,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => AwesomeDialog(
                              context: Get.context!,
                              dialogType: DialogType.infoReverse,
                              animType: AnimType.bottomSlide,
                              title: 'Keluar ?',
                              desc: 'Apakah anda yakin ingin keluar ?',
                              dialogBackgroundColor: primaryColor,
                              titleTextStyle: GoogleFonts.poppins(
                                color: secondaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                              descTextStyle: GoogleFonts.poppins(
                                color: secondaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                              btnOkOnPress: () {
                                SystemNavigator.pop();
                              },
                              btnCancelText: 'Tidak',
                              btnOkText: 'Ya',
                              btnCancelOnPress: () => Get.back(),
                            ).show(),
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          // Gradient color
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.blue,
                                              primaryColor,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 70,
                                        child: Text(
                                          'Keluar',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -15,
                                        right: -75,
                                        // child: Image.asset(
                                        //   'assets/images/home/money.png',
                                        //   fit: BoxFit.cover,
                                        //   height: 250,
                                        // ),
                                        child: SvgPicture.asset(
                                          'assets/images/home/exit.svg',
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SafeArea(
              child: FormBuilder(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: Colors.black.withOpacity(0.5),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Quick Search',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Lottie.asset(
                                'assets/images/home/search-nik.zip',
                                height: 200,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: FormBuilderTextField(
                                  name: 'nik',
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    // add custom google font
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                  ),
                                  onEditingComplete: () {
                                    controller.searchNik(controller.nik.text);
                                  },
                                  controller: controller.nik,
                                  cursorColor: Colors.black,
                                  cursorHeight: 20,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    prefixIcon: const Icon(
                                      Icons.numbers_outlined,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller
                                            .searchNik(controller.nik.text);
                                      },
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 25,
                                    ),
                                    focusColor: Colors.red,
                                    fillColor: Colors.grey.shade300,
                                    hoverColor: Colors.red,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: 'Masukkan NIK',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      // add custom google font
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                    ),
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(child: Obx(
                            () {
                              if (controller.isSearchNikProcessing.value) {
                                return const Center(
                                  child: BpdDiyLoader(),
                                );
                              } else {
                                if (controller.listSearchNik.isEmpty) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'No Data',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          // add custom google font
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: controller.listSearchNik.length,
                                    itemBuilder: (context, index) {
                                      return GFListTile(
                                        color: Colors.black.withOpacity(0.5),
                                        title: Text(
                                          controller
                                              .listSearchNik[index].peminjam1!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            // add custom google font
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                          ),
                                        ),
                                        subTitle: Text(
                                          controller.listSearchNik[index]
                                              .bidangUsaha!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            // add custom google font
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                          ),
                                        ),
                                        icon: GFButton(
                                          onPressed: () {
                                            // controller
                                            //     .getDetailNik(controller
                                            //         .listSearchNik[index]
                                            //         .nik!)
                                            //     .then((value) {
                                            //   Get.toNamed(
                                            //       '/detailNik/${controller.listSearchNik[index].nik}');
                                            // });
                                            controller.listSearchNik[index]
                                                        .userId ==
                                                    auth.currentUser?.uid
                                                ? Get.toNamed(
                                                    Routes.INSIGHT_DEBITUR,
                                                    arguments: controller
                                                        .listSearchNik[index]
                                                        .id)
                                                : AwesomeDialog(
                                                        context: context,
                                                        dialogType:
                                                            DialogType.error,
                                                        animType: AnimType
                                                            .bottomSlide,
                                                        title: 'Error',
                                                        desc:
                                                            'Anda tidak memiliki akses untuk melihat detail debitur ini',
                                                        btnOkOnPress: () {},
                                                        btnOkIcon: Icons.cancel,
                                                        btnOkColor: Colors.red)
                                                    .show();
                                          },
                                          text: 'Detail',
                                          color: Colors.white,
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            // add custom google font
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      physics: NeverScrollableScrollPhysics(),
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: 'History',
                          icon: Icon(Icons.history),
                        ),
                        Tab(
                          icon: Icon(Icons.subject_outlined),
                          text: 'Submissions',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Obx(() {
                            if (controller.isMyInputProcessing.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (controller.listMyInput.isNotEmpty) {
                                return RefreshIndicator(
                                  onRefresh: () {
                                    return controller.refreshInputtan();
                                  },
                                  child: ListView.builder(
                                    controller: controller.scrollController,
                                    itemCount: controller.listMyInput.length,
                                    itemBuilder: (context, index) {
                                      bool isSameDate = true;
                                      final dateString = controller
                                          .listMyInput[index].tglSekarang;

                                      if (index == 0) {
                                        isSameDate = false;
                                      } else {
                                        final prevDateString = controller
                                            .listMyInput[index - 1].tglSekarang
                                            ?.toIso8601String();
                                        final DateTime prevDate =
                                            DateTime.parse(prevDateString!);
                                        isSameDate = dateString!
                                            .isAtSameMomentAs(prevDate);
                                      }
                                      if (index == 0 || !(isSameDate)) {
                                        return Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              DateFormat('EEEE, dd MMMM yyyy')
                                                  .format(dateString!),
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GFCard(
                                              border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              elevation: 5,
                                              titlePosition: GFPosition.start,
                                              title: GFListTile(
                                                avatar: const Icon(
                                                    FontAwesomeIcons
                                                        .bookBookmark),
                                                title: Text(
                                                  controller.listMyInput[index]
                                                      .peminjam1!,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.black87,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subTitle: Text(
                                                  controller.listMyInput[index]
                                                      .bidangUsaha!,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                icon: GFButton(
                                                  onPressed: (() {
                                                    Get.toNamed(
                                                        Routes.INSIGHT_DEBITUR,
                                                        arguments: controller
                                                            .listMyInput[index]
                                                            .id);
                                                  }),
                                                  text: 'Detail',
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      } else {
                                        return GFCard(
                                          border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.white.withOpacity(0.9),
                                          elevation: 5,
                                          titlePosition: GFPosition.start,
                                          title: GFListTile(
                                            avatar: const Icon(
                                                FontAwesomeIcons.bookBookmark),
                                            title: Text(
                                              controller.listMyInput[index]
                                                  .peminjam1!,
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black87,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            subTitle: Text(
                                              controller.listMyInput[index]
                                                  .bidangUsaha!,
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            icon: GFButton(
                                              onPressed: (() {
                                                Get.toNamed(
                                                    Routes.INSIGHT_DEBITUR,
                                                    arguments: controller
                                                        .listMyInput[index].id);
                                              }),
                                              text: 'Detail',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.all(32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child: Text(
                                            'Data Tidak Ditemukan',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Lottie.asset(
                                            'assets/images/home/empty.json',
                                            frameRate: FrameRate.max,
                                            fit: BoxFit.cover,
                                            repeat: true,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Text(
                                                'Gagal memuat animasi',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Belum ada riwayat input debitur',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.normal,
                                                  letterSpacing: 1.2,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 20),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blueAccent,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30,
                                                      vertical: 15),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  controller.refreshInputtan();
                                                },
                                                child: const Text(
                                                  'Refresh',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }
                          }),
                          Obx(() {
                            if (controller.isMySubmissionProcessing.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (controller.listMySubmission.isNotEmpty) {
                                return RefreshIndicator(
                                  onRefresh: () {
                                    return controller.refreshPengajuan();
                                  },
                                  child: ListView.builder(
                                    itemCount:
                                        controller.listMySubmission.length,
                                    itemBuilder: (context, index) {
                                      bool isSameDate = true;
                                      final dateString = controller
                                          .listMySubmission[index].tglSubmit;

                                      if (index == 0) {
                                        isSameDate = false;
                                      } else {
                                        final prevDateString = controller
                                            .listMySubmission[index - 1]
                                            .tglSubmit
                                            ?.toIso8601String();
                                        final DateTime prevDate =
                                            DateTime.parse(prevDateString!);
                                        isSameDate = dateString! == prevDate;
                                      }

                                      if (index == 0 || !(isSameDate)) {
                                        return Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              DateFormat('EEEE, dd MMMM yyyy')
                                                  .format(dateString!),
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GFCard(
                                              border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              elevation: 5,
                                              titlePosition: GFPosition.start,
                                              title: GFListTile(
                                                avatar: const Icon(
                                                    FontAwesomeIcons
                                                        .bookBookmark),
                                                title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .listMySubmission[
                                                              index]
                                                          .debitur
                                                          .peminjam1!,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color: Colors.black87,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '#',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          ': ${controller.listMySubmission[index].id}',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                                subTitle: controller
                                                            .listMySubmission[
                                                                index]
                                                            .status ==
                                                        'PENDING'
                                                    ? const Text(
                                                        'Status : Pending',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    : controller
                                                                .listMySubmission[
                                                                    index]
                                                                .status ==
                                                            'REVIEWED'
                                                        ? const Text(
                                                            'Status : Sedang Direview',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.orange,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )
                                                        : controller
                                                                    .listMySubmission[
                                                                        index]
                                                                    .status ==
                                                                'DONE'
                                                            ? const Text(
                                                                'Status : Diterima',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            : const Text(
                                                                'Status : Ditolak 🤣',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .pink,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                icon: GFButton(
                                                  onPressed: (() {
                                                    Get.toNamed(
                                                        Routes.PENGAJUAN_DETAIL,
                                                        arguments: controller
                                                            .listMySubmission[
                                                                index]
                                                            .id);
                                                  }),
                                                  text: 'Detail',
                                                  color: Colors.blue,
                                                  textStyle:
                                                      GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      } else {
                                        return GFCard(
                                          border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.white.withOpacity(0.9),
                                          elevation: 5,
                                          titlePosition: GFPosition.start,
                                          title: GFListTile(
                                            avatar: const Icon(
                                                FontAwesomeIcons.bookBookmark),
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .listMySubmission[index]
                                                      .debitur
                                                      .peminjam1!,
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.black87,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '#',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      ': ${controller.listMySubmission[index].id}',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color: Colors.black87,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                            subTitle: controller
                                                        .listMySubmission[index]
                                                        .status ==
                                                    'PENDING'
                                                ? const Text(
                                                    'Status : Pending',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : controller
                                                            .listMySubmission[
                                                                index]
                                                            .status ==
                                                        'REVIEWED'
                                                    ? const Text(
                                                        'Status : Sedang Direview',
                                                        style: TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    : controller
                                                                .listMySubmission[
                                                                    index]
                                                                .status ==
                                                            'DONE'
                                                        ? const Text(
                                                            'Status : Diterima',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )
                                                        : const Text(
                                                            'Status : Ditolak 🤣',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.pink,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                            icon: GFButton(
                                              onPressed: (() {
                                                Get.toNamed(
                                                    Routes.PENGAJUAN_DETAIL,
                                                    arguments: controller
                                                        .listMySubmission[index]
                                                        .id);
                                              }),
                                              text: 'Detail',
                                              color: Colors.blue,
                                              textStyle: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.all(32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child: Text(
                                            'Data Tidak Ditemukan',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Lottie.asset(
                                            'assets/images/home/empty.json',
                                            frameRate: FrameRate.max,
                                            fit: BoxFit.cover,
                                            repeat: true,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Text(
                                                'Gagal memuat animasi',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Belum ada riwayat pengajuan',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.normal,
                                                  letterSpacing: 1.2,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 20),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blueAccent,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30,
                                                      vertical: 15),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  controller.refreshPengajuan();
                                                },
                                                child: const Text(
                                                  'Refresh',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FormFirebase(auth: auth, controller: controller),
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
                          // Check if user has multiple customClaims
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
      bottomNavigationBar: BottomBarDoubleBullet(
        backgroundColor: primaryColor,
        color: Colors.white,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.notifications),
          BottomBarItem(iconData: Icons.person),
          BottomBarItem(iconData: Icons.settings),
        ],
        onSelect: (index) {
          // selected index pageview
          controller.controller.animateToPage(
            index,
            // no duration
            duration: const Duration(milliseconds: 300),

            // duration: const Duration(milliseconds: 300),
            // no curve
            curve: Curves.easeOutQuad,
          );
        },
      ),
    );
  }

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
}
