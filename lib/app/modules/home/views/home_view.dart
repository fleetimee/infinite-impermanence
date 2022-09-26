// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../common/style.dart';
 import '../../../routes/app_pages.dart';
import '../../../widget/drawer.dart';
import '../controllers/home_controller.dart';
import 'components/home_menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
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
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: secondaryColor,
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
                background: Obx(
                  () => Image.asset(
                    controller.isDarkModeEnabled.value
                        ? 'assets/images/home/appbar_light.jpg'
                        : 'assets/images/home/appbar_dark.jpg',
                    fit: BoxFit.cover,
                  ),
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
