// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);

  final isCollapsed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: primaryColor,
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
                image: const AssetImage(
                  'assets/images/splash_side/splash_sidebar.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: const Text(
              'Analisis Kredit Mikro',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                      offset: Offset(5, 5),
                    ),
                  ],
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home',
                style: TextStyle(
                  fontSize: 20,
                )),
            onTap: () {
              Get.offNamed(Routes.HOME);
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Menu Utama',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.hail_rounded),
            title: const Text(
              'Debitur',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Input Debitur'),
                onTap: () {
                  Get.offNamed(Routes.CREATE_DEBITUR);
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Search NIK'),
                onTap: () {
                  Get.offNamed(Routes.SEARCH_NIK);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text(
              'Analisis',
              style: TextStyle(fontSize: 20),
            ),
            children: <Widget>[
              ListTile(
                title: const Text('Penghasilan Tetap'),
                onTap: () {
                  Get.offNamed(Routes.PENGHASILAN_TETAP);
                  Get.back();
                },
                leading: const Icon(Icons.attach_money_outlined),
              ),
              ListTile(
                title: const Text('Penghasilan Tidak Tetap'),
                onTap: () {
                  Get.offNamed(Routes.PENGHASILAN_XTETAP);
                  Get.back();
                },
                leading: const Icon(Icons.attach_money_outlined),
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.file_copy_sharp),
            title: const Text(
              'Berkas',
              style: TextStyle(fontSize: 20),
            ),
            children: <Widget>[
              ListTile(
                title: const Text('Agunan'),
                onTap: () {
                  Get.offNamed(Routes.AGUNAN);
                  Get.back();
                },
                leading: const Icon(Icons.car_rental_outlined),
              ),
              ListTile(
                title: const Text('Upload Berkas'),
                onTap: () {
                  Get.offNamed(Routes.UPLOADS);
                  Get.back();
                },
                leading: const Icon(Icons.cloud_upload),
              ),
              ListTile(
                title: const Text('Bisnis Analisis'),
                onTap: () {
                  Get.offNamed(Routes.BISNIS_ANALISIS);
                  Get.back();
                },
                leading: const Icon(Icons.business_center),
              ),
              ListTile(
                title: const Text('Karakter Analisis'),
                onTap: () {
                  Get.offNamed(Routes.KARAKTER_ANALISIS);
                  Get.back();
                },
                leading: const Icon(Icons.analytics_outlined),
              ),
              ListTile(
                title: const Text('Keuangan Analisis'),
                onTap: () {
                  Get.offNamed(Routes.KEUANGAN_ANALISIS);
                  Get.back();
                },
                leading: const Icon(Icons.credit_card_outlined),
              ),
              ListTile(
                title: const Text('Printing'),
                onTap: () {
                  Get.offNamed(Routes.PRINTING);
                  Get.back();
                },
                leading: const Icon(Icons.print),
              ),
              ListTile(
                title: const Text('Printing'),
                onTap: () {
                  Get.offNamed(Routes.DEBITUR_REAL);
                  Get.back();
                },
                leading: const Icon(Icons.print),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Good stuff',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ListTile(
            // Setting
            leading: Icon(Icons.settings),
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Get.offNamed(Routes.HOME);
            },
          ),
          const SizedBox(
            height: 300,
          ),
          Align(
            alignment: FractionalOffset.bottomRight,
            child: Column(
              children: const <Widget>[
                Divider(),
                Center(
                  child: ListTile(
                    title: Text(
                      'Developed by fleetime',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerControllerGetX extends GetxController {
  final isCollapsed = false.obs;
}
