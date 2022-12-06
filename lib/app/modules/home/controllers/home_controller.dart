// 🐦 Flutter imports:

// 📦 Package imports:
import 'dart:async';
import 'dart:io';

import 'package:akm/app/common/style.dart';
import 'package:akm/app/utils/capitalize.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: unnecessary_overrides

class HomeController extends GetxController {
  @override
  void onInit() async {
    // _getThemeStatus();
    super.onInit();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    // Check if already linked to google account
    checkIfLinked();

    // Get hardware info
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

  // Initialize firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  // When the controller is closed, cancel the subscription
  // void onClosed() {
  //   streamSubscription.cancel();
  // }

  // Check if user is already linked to google account
  void checkIfLinked() async {
    final User? user = auth.currentUser;
    final List<UserInfo> userInfo = user!.providerData;
    for (final UserInfo info in userInfo) {
      if (info.providerId == 'google.com') {
        isLinked.value = true;
      }
    }
  }

  // Logout firebase and google sign in
  void logout() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: 'Logout',
      desc: 'Are you sure want to logout?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await FirebaseAuth.instance.signOut();
        await GoogleSignIn().disconnect();
      },
    ).show();
  }

  // Controller for pageview
  final PageController controller = PageController();

  // Controller for formKey
  final formKey = GlobalKey<FormBuilderState>();

  // Bunch of controllers for textfield
  var uid = TextEditingController();
  var email = TextEditingController();
  var displayName = TextEditingController();
  var phoneNumber = TextEditingController();
  var isEmailVerified = false.obs;

  // Variables for device info
  var productName = ''.obs;
  var brandName = ''.obs;
  var profileImage = ''.obs;

  // Variables for location
  var latitude = 'Getting latitude'.obs;
  var longtitude = 'Getting longtitude'.obs;
  var address = 'Getting address'.obs;

  // StreamSubscriptioon for location
  late StreamSubscription<Position> streamSubscription;

  // Variables for boolean
  var isDisplayNameReadOnly = true.obs;
  var isEmailReadOnly = true.obs;
  var isPhoneReadOnly = true.obs;
  var isLinked = false.obs;

  void getImage() async {
    final prefs = await SharedPreferences.getInstance();

    final image = prefs.getString('photo');

    profileImage.value = image!;
  }

  // Get location
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

  // Get address from latlang
  Future<void> getAddressFromLatlang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}, ${place.administrativeArea}';
  }

  // Link google account
  void linkGoogleAccount() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.currentUser!
          .linkWithCredential(credential)
          .then((value) {
        isLinked.value = true;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Account linked successfully',
          btnOkOnPress: () {},
        ).show();
      }, onError: (error) {
        // Sign out from google
        GoogleSignIn().signOut();

        FirebaseAuthException exception = error as FirebaseAuthException;

        if (exception.code == 'credential-already-in-use') {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            title: 'Error',
            desc: 'The account already exists with a different credential.',
            btnOkOnPress: () {},
          ).show();
        }

        if (exception.code == 'email-already-in-use') {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            title: 'Error',
            desc: 'The email address is already in use by another account.',
            btnOkOnPress: () {},
          ).show();
        }

        if (exception.code == 'invalid-credential') {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            title: 'Error',
            desc: 'The supplied auth credential is malformed or has expired.',
            btnOkOnPress: () {},
          ).show();
        }

        // AwesomeDialog(
        //   context: Get.context!,
        //   dialogType: DialogType.error,
        //   animType: AnimType.scale,
        //   title: 'Error',
        //   desc: error.toString(),
        //   btnOkOnPress: () {},
        // ).show();
      });
    } catch (e) {
      FirebaseAuthException exception = e as FirebaseAuthException;

      // Sign out from google sign in
      await GoogleSignIn().signOut();

      if (exception.code == 'account-exists-with-different-credential') {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error',
          desc: 'The account already exists with a different credential.',
          btnOkOnPress: () {},
        ).show();
      } else if (exception.code == 'invalid-credential') {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error',
          desc: 'Error occurred while accessing credentials. Try again.',
          btnOkOnPress: () {},
        ).show();
      }

      // AwesomeDialog(
      //   context: Get.context!,
      //   dialogType: DialogType.error,
      //   animType: AnimType.scale,
      //   title: e.toString(),
      //   desc: exception.message.toString(),
      //   btnOkOnPress: () async {
      //     await GoogleSignIn().signOut();
      //   },
      // ).show();
    }
  }

  // Unlink google account
  void unlinkGoogleAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.unlink('google.com').then(
          (value) {
        isLinked.value = false;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Account unlinked successfully',
          btnOkOnPress: () {},
        ).show();
      }, onError: (error) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error',
          desc: error.toString(),
          btnOkOnPress: () {},
        ).show();
      });
    } catch (e) {
      FirebaseAuthException exception = e as FirebaseAuthException;

      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: e.toString(),
        desc: exception.message.toString(),
        btnOkOnPress: () {},
      ).show();
    }
  }

  // RxBool isDarkModeEnabled = false.obs;

  // Greeting
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
    var format = DateFormat('dd MMMM yyyy');
    return format.format(date);
  }

  // link with Google Account

  // void updatePhoneNumber() {
  //   try {
  //     FirebaseAuth.instance.currentUser!.set
  //     AwesomeDialog(
  //       context: Get.context!,
  //       dialogType: DialogType.SUCCES,
  //       animType: AnimType.BOTTOMSLIDE,
  //       title: 'Success',
  //       desc: 'Phone number has been updated',
  //       btnOkIcon: Icons.check_circle,
  //       btnOkOnPress: () {},
  //     ).show();
  //   } catch (e) {
  //     AwesomeDialog(
  //       context: Get.context!,
  //       dialogType: DialogType.ERROR,
  //       animType: AnimType.BOTTOMSLIDE,
  //       title: 'Error',
  //       desc: e.toString(),
  //       btnOkIcon: Icons.error,
  //       btnOkOnPress: () {},
  //     ).show();
  //   }
  // }

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
