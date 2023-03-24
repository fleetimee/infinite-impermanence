import 'package:about/about.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuGrid {
  final String menuName;
  final String menuIcon;
  // onTap function
  final Function onTap;

  MenuGrid({
    required this.menuName,
    required this.menuIcon,
    required this.onTap,
  });
}

final Uri _url =
    Uri.parse('https://fleetimee.github.io/infinite-impermanence/#/guide');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

final List<MenuGrid> menuGridList = [
  MenuGrid(
    menuName: 'Debitur',
    menuIcon: 'assets/images/menu_grid/debitur_menu.svg',
    onTap: () {
      Get.toNamed(Routes.DEBITUR_REAL);
    },
  ),
  MenuGrid(
    menuName: 'User Guide',
    menuIcon: 'assets/images/menu_grid/user_guide.svg',
    onTap: () {
      _launchUrl();
    },
  ),
  MenuGrid(
    menuName: 'Tetap',
    menuIcon: 'assets/images/menu_grid/simulasi_tetap.svg',
    onTap: () {
      Get.toNamed(Routes.SIMULASI_TETAP);
    },
  ),
  MenuGrid(
    menuName: 'Porsekot',
    menuIcon: 'assets/images/menu_grid/simulasi_porsekot.svg',
    onTap: () {
      Get.toNamed(Routes.PORSEKOT_TABLE);
    },
  ),
  MenuGrid(
    menuName: 'About',
    menuIcon: 'assets/images/menu_grid/about_menu.svg',
    onTap: () {
      showAboutPag(Get.context!);
    },
  ),
  MenuGrid(
    menuName: 'Logout',
    menuIcon: 'assets/images/menu_grid/keluar_menu.svg',
    onTap: () {
      AwesomeDialog(
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
      ).show();
    },
  )
];

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
