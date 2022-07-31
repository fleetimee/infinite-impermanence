import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/common/style.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.white,
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        scaffoldBackgroundColor: secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
