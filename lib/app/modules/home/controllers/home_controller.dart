// 🐦 Flutter imports:

// 📦 Package imports:
import 'dart:async';
import 'dart:io';

import 'package:akm/app/common/style.dart';
import 'package:akm/app/utils/capitalize.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nekos/nekos.dart';

// ignore_for_file: unnecessary_overrides

class HomeController extends GetxController {
  @override
  void onInit() async {
    // _getThemeStatus();
    super.onInit();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      productName.value = androidInfo.product.toString().toUpperCase();
      brandName.value = androidInfo.brand.toString().toCapitalized();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      productName.value = iosInfo.name.toString().toUpperCase();
      brandName.value = iosInfo.utsname.machine.toString().toCapitalized();
    } else if (GetPlatform.isWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      productName.value = webBrowserInfo.userAgent.toString();
    } else {
      productName.value = 'Unknown Device';
      brandName.value = '';
    }
    getLocation();
  }

  void onClosed() {
    streamSubscription.cancel();
  }

  var productName = ''.obs;
  var brandName = ''.obs;

  var latitude = 'Getting latitude'.obs;
  var longtitude = 'Getting longtitude'.obs;
  var address = 'Getting address'.obs;
  late StreamSubscription<Position> streamSubscription;

  void getLocation() async {
    /// Determine the current position of the device.
    ///
    /// When the location services are not enabled or permissions
    /// are denied the `Future` will return an error.
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      // Open android location settings
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        dialogBackgroundColor: primaryColor,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        titleTextStyle: GoogleFonts.poppins(
          color: secondaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        descTextStyle: GoogleFonts.poppins(
          color: secondaryColor,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        animType: AnimType.bottomSlide,
        title: 'GPS Disabled',
        desc: 'Please enable location services to continue',
        btnOkIcon: Icons.location_on,
        btnOkOnPress: () {
          Geolocator.openLocationSettings();
        },
      ).show();
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Request permission to use location
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Permission denied',
          desc: 'Please allow location permission to continue',
          btnOkIcon: Icons.location_on,
          btnOkOnPress: () {
            Geolocator.requestPermission();
          },
        ).show();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'Latitude: ${position.latitude}';
      longtitude.value = 'Longtitude: ${position.longitude}';
      getAddressFromLatlang(position);
    });
  }

  Future<void> getAddressFromLatlang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}, ${place.administrativeArea}';
  }

  // void deviceInfo() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  //   if (GetPlatform.isAndroid) {
  //     deviceName = deviceInfo.androidInfo.toString();
  //   } else if (GetPlatform.isIOS) {
  //     deviceName = deviceInfo.iosInfo.toString();
  //   } else if (GetPlatform.isWeb) {
  //     deviceName = deviceInfo.webBrowserInfo.toString();
  //   }
  // }

  Future<String> img = Nekos().avatar();

  final faker = Faker.instance;

  RxBool isDarkModeEnabled = false.obs;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 10) {
      return 'Pagi';
    }
    if (hour < 14) {
      return 'Siang';
    }
    if (hour < 18) {
      return 'Sore';
    }
    return 'Malam';
  }

  String dateNow() {
    var date = DateTime.now();
    // Format date to indonesia format with days, month and year
    var format = DateFormat('EEEE, dd MMMM yyyy');
    return format.format(date);
  }

  // final Future<SharedPreferences> initPref = SharedPreferences.getInstance();

  // saveThemeStatus() async {
  //   SharedPreferences pref = await initPref;
  //   pref.setBool('theme', isDarkModeEnabled.value);
  // }

  // _getThemeStatus() async {
  //   var isLight = initPref.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') ?? true;
  //   }).obs;
  //   isDarkModeEnabled.value = (await isLight.value);
  //   Get.changeThemeMode(
  //       isDarkModeEnabled.value ? ThemeMode.dark : ThemeMode.light);
  // }
}
