// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:about/about.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
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

  final List<String> imageList = [
    "assets/images/home/image1.jpg",
    "assets/images/home/image2.jpg",
    "assets/images/home/image3.jpg",
    "assets/images/home/image4.jpg",
    "assets/images/home/image5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
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
        child: CustomScrollView(
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
                        onTap: () => showAboutPage(
                          applicationName: 'Analisis Kredit Mikro',
                          context: context,
                          values: {
                            'version': '0.5.5',
                            'year': DateTime.now().year.toString(),
                          },
                          applicationLegalese:
                              'Copyright © Novian Andika, {{ year }}',
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
                              image: AssetImage(
                                  'assets/images/splash_screen/splash_icon.png'),
                            ),
                          ),
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
      ),
    );
  }
}
