import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
              image: DecorationImage(
                image:
                    AssetImage('assets/images/splash_side/splash_sidebar.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text('.'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.offAllNamed(Routes.HOME);
              Get.back();
            },
            leading: const Icon(Icons.home),
          ),
          ListTile(
            title: const Text('Search'),
            onTap: () {
              Get.offAllNamed(Routes.SEARCH_NIK);
              Get.back();
            },
            leading: const Icon(Icons.search),
          ),
          ListTile(
            title: const Text('Add'),
            onTap: () {
              Get.offAllNamed(Routes.CREATE_DEBITUR);
              Get.back();
            },
            leading: const Icon(Icons.add),
          ),
          ListTile(
            title: const Text('Penghasilan Tetap'),
            onTap: () {
              Get.offAllNamed(Routes.PENGHASILAN_TETAP);
              Get.back();
            },
            leading: const Icon(Icons.attach_money_outlined),
          ),
          ListTile(
            title: const Text('Penghasilan Tidak Tetap'),
            onTap: () {
              Get.offAllNamed(Routes.PENGHASILAN_XTETAP);
              Get.back();
            },
            leading: const Icon(Icons.attach_money_outlined),
          ),
          ListTile(
            title: const Text('Upload'),
            onTap: () {
              Get.offAllNamed(Routes.UPLOADS);
              Get.back();
            },
            leading: const Icon(Icons.cloud_upload),
          ),
        ],
      ),
    );
  }
}
