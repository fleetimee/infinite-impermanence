// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/search/search.provider.dart';
import 'package:akm/app/data/provider/user/inputted_debitur.provider.dart';
import 'package:akm/app/data/provider/user/pengajuan_debitur.provider.dart';
import 'package:akm/app/models/debitur_model/list_debitur.model.dart';
import 'package:akm/app/models/search/search.model.dart' as search;
import 'package:akm/app/utils/capitalize.dart';

// ignore_for_file: unnecessary_overrides

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    getPhotoUrl();

    // Check if already linked to google account
    checkIfLinked();

    // Get hardware info
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      manufacturer.value = androidInfo.manufacturer.toString();
      androidVersion.value = androidInfo.version.release.toString();
      bootloader.value = androidInfo.bootloader.toString();
      board.value = androidInfo.board.toString();
      modelName.value = androidInfo.model.toString();
      display.value = androidInfo.display.toString();
      device.value = androidInfo.device.toString();
      board.value = androidInfo.hardware.toString();
      hardware.value = androidInfo.board.toString();
      isPhysicalDevice.value = androidInfo.isPhysicalDevice;
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

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get the current user
      getMyDebiturInput(sort);
      getMySubmission();
    });
    super.onReady();
  }

  Future<void> refreshInputtan() async {
    getMyDebiturInput(sort);
  }

  Future<void> refreshPengajuan() async {
    getMySubmission();
  }

  // Initialize firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  // When the controller is closed, cancel the subscription
  // void onClosed() {
  //   streamSubscription.cancel();
  // }

  // Get value from shared preferences
  void getPhotoUrl() async {
    // Check if signed in with google
    if (await GoogleSignIn().isSignedIn()) {
      if (auth.currentUser!.photoURL == null) {
        for (final UserInfo info in auth.currentUser!.providerData) {
          if (info.providerId == 'google.com') {
            profileImage.value = info.photoURL!;
          }
        }
        idUntukFetchInput.value = auth.currentUser!.uid;
      }
    } else {
      SharedPreferences.getInstance().then((prefs) {
        profileImage.value = prefs.getString('photo')!;
        idUntukFetchInput.value = prefs.getString('id')!;
      });
    }
  }

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
        final prefs = await SharedPreferences.getInstance();

        await prefs.setBool('pernahLogin', true);

        // clear shared preferences id
        await prefs.remove('id');
        await prefs.remove('photo');
        await prefs.remove('role');

        await FirebaseAuth.instance.signOut();

        // check if user is currently signed in with google
        if (await GoogleSignIn().isSignedIn()) {
          await GoogleSignIn().disconnect();
        }
      },
    ).show();
  }

  // for my input
  var page = 1;
  var sort = 'id,ASC';
  var isMyInputProcessing = false.obs;
  var isMoreMyInputDataAvailable = true.obs;
  var listMyInput = List<Datum>.empty(growable: true).obs;
  ScrollController scrollController = ScrollController();

  // for my submission
  var isMySubmissionProcessing = false.obs;
  List listMySubmission = <Pengajuan>[].obs;

  // Controller for pageview
  final PageController controller = PageController();

  // Controller for formKey
  final formKey = GlobalKey<FormBuilderState>();

  // Bunch of controllers for textfield
  var uid = TextEditingController();
  var setPassword = TextEditingController();
  var email = TextEditingController();
  var refreshEmail = TextEditingController();
  var refreshPassword = TextEditingController();
  var password = TextEditingController();
  var displayName = TextEditingController();
  var phoneNumber = TextEditingController();
  var isEmailVerified = false.obs;
  var profileImage = ''.obs;
  var idUntukFetchInput = ''.obs;

  // Search NIK
  var nik = TextEditingController();
  final isSearchNikProcessing = false.obs;
  var listSearchNik = List<search.Datum>.empty(growable: true).obs;

  // Variables for device info
  var androidVersion = ''.obs;
  var bootloader = ''.obs;
  var manufacturer = ''.obs;
  var productName = ''.obs;
  var brandName = ''.obs;
  var modelName = ''.obs;
  var device = ''.obs;
  var board = ''.obs;
  var hardware = ''.obs;
  var display = ''.obs;
  var isPhysicalDevice = false.obs;

  // Variables for location
  var latitude = 'Getting latitude'.obs;
  var longtitude = 'Getting longtitude'.obs;
  var address = 'Getting address'.obs;
  var fullAddress = '...'.obs;

  // StreamSubscriptioon for location
  late StreamSubscription<Position> streamSubscription;

  // Variables for boolean
  var isDisplayNameReadOnly = true.obs;
  var isEmailReadOnly = true.obs;
  var isPhoneReadOnly = true.obs;
  var isLinked = false.obs;
  var isReauthProcessing = false.obs;
  var isPasswordProcessing = false.obs;

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
    fullAddress.value =
        '${place.street}, ${place.thoroughfare}, ${place.name}, ${place.locality}, ${place.subLocality} ${place.administrativeArea}, ${place.subAdministrativeArea} ${place.country}';
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

  // Reauthenticate user
  void reauthenticate() async {
    // Get current credentials
    isReauthProcessing(true);
    var credential = EmailAuthProvider.credential(
      email: refreshEmail.value.text,
      password: refreshPassword.value.text,
    );

    try {
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential)
          .then((value) {
        isReauthProcessing(false);
        clearReauth();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Reauthenticate successfully',
          btnOkOnPress: () {},
        ).show();
      }, onError: (error) {
        isReauthProcessing(false);
        clearReauth();

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
      isReauthProcessing(false);
      clearReauth();
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

  // Set Password
  void setPasswordFun() async {
    isPasswordProcessing(true);
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(setPassword.value.text)
          .then((value) {
        isPasswordProcessing(false);
        clearSetPassword();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Password updated successfully',
          btnOkOnPress: () {},
        ).show();
      }, onError: (error) {
        isPasswordProcessing(false);
        clearSetPassword();
        FirebaseAuthException exception = error as FirebaseAuthException;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error',
          desc: exception.message.toString(),
          btnOkOnPress: () async {
            await FirebaseAuth.instance.signOut();
            // Check if user sign in with Google Sign In
            if (await GoogleSignIn().isSignedIn()) {
              await GoogleSignIn().signOut();
            }
          },
          btnOkText: 'Sign Out',
        ).show();
      });
    } catch (e) {
      FirebaseAuthException exception = e as FirebaseAuthException;
      isPasswordProcessing(false);
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

  // Verify email
  void verifyEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification().then(
          (value) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Verification email sent successfully',
          btnOkOnPress: () {},
        ).show();
      }, onError: (error) {
        FirebaseAuthException exception = error as FirebaseAuthException;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error',
          desc: exception.message.toString(),
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

  void searchNik(String query) {
    try {
      isSearchNikProcessing(true);
      SearchNikProvider().searchNik(query).then((resp) {
        isSearchNikProcessing(false);

        if (resp.isEmpty) {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.info,
            animType: AnimType.scale,
            title: 'Info',
            desc: 'Tidak ada debitur dengan NIK $query',
            btnOkOnPress: () {},
          ).show();
        }

        listSearchNik.clear();
        listSearchNik.addAll(resp);
      }, onError: (error) {
        isSearchNikProcessing(false);
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
      isSearchNikProcessing(false);
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error',
        desc: e.toString(),
        btnOkOnPress: () {},
      ).show();
    }
  }

  // Change Profile Picture
  // void changeAvatarUrl() async {
  //   try {
  //     await FirebaseAuth.instance.currentUser!
  //         .updatePhotoURL(avatarUrl.value.text)
  //         .then((value) {
  //       AwesomeDialog(
  //         context: Get.context!,
  //         dialogType: DialogType.success,
  //         animType: AnimType.scale,
  //         title: 'Success',
  //         desc: 'Profile picture updated successfully',
  //         btnOkOnPress: () {},
  //       ).show();
  //     }, onError: (error) {
  //       FirebaseAuthException exception = error as FirebaseAuthException;
  //       AwesomeDialog(
  //         context: Get.context!,
  //         dialogType: DialogType.error,
  //         animType: AnimType.scale,
  //         title: 'Error',
  //         desc: exception.message.toString(),
  //         btnOkOnPress: () {},
  //       ).show();
  //     });
  //   } catch (e) {
  //     FirebaseAuthException exception = e as FirebaseAuthException;
  //     AwesomeDialog(
  //       context: Get.context!,
  //       dialogType: DialogType.error,
  //       animType: AnimType.scale,
  //       title: e.toString(),
  //       desc: exception.message.toString(),
  //       btnOkOnPress: () {},
  //     ).show();
  //   }
  // }

  // Verify phone number
  void verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+62${phoneNumber.value.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: e.toString(),
          desc: e.message.toString(),
          btnOkOnPress: () {},
        ).show();
      },
      codeSent: (String verificationId, int? resendToken) async {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.info,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Verification code sent successfully',
          btnOkOnPress: () {},
        ).show();
        // Get.toNamed(Routes.VERIFY_PHONE, arguments: {
        //   'verificationId': verificationId,
        //   'phoneNumber': '+62' + phoneNumber.value.text,
        // });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // Get inputted debitur
  void getMyDebiturInput(String sort) async {
    try {
      isMoreMyInputDataAvailable(false);
      isMyInputProcessing(true);
      DebiturInputtedByProvider()
          .fetchMyInputtedDebitur(page, sort, idUntukFetchInput.value)
          .then((resp) {
        isMyInputProcessing(false);
        listMyInput.clear();
        listMyInput.addAll(resp);
      }, onError: (error) {
        isMyInputProcessing(false);
        Get.snackbar('Error', error.toString());
      });
    } catch (e) {
      isMyInputProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void getMoreMyDebiturInput(String sort) {
    try {
      DebiturInputtedByProvider()
          .fetchMyInputtedDebitur(page, sort, idUntukFetchInput.value)
          .then((resp) {
        if (resp.isNotEmpty) {
          isMoreMyInputDataAvailable(true);
        } else {
          isMoreMyInputDataAvailable(false);
          debugPrint('No more data');
        }
        listMyInput.addAll(resp);
      }, onError: (error) {
        Get.snackbar('Error', error.toString());
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void paginateMyInput(String sort) {
    scrollController.addListener(() {
      // Scroll listener
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getMoreMyDebiturInput(sort);
      }
    });
  }

  // Get inputted submission
  void getMySubmission() async {
    try {
      isMySubmissionProcessing(true);
      MySubmissionProvider().fetchMyPengajuan(idUntukFetchInput.value).then(
          (resp) {
        isMySubmissionProcessing(false);
        final finalList = resp.pengajuan?.toList();

        listMySubmission.clear();

        listMySubmission = finalList ?? [];
      }, onError: (error) {
        isMySubmissionProcessing(false);
        Get.snackbar('Error', error.toString());
      });
    } catch (e) {
      isMySubmissionProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

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

  void clearReauth() {
    formKey.currentState?.fields['refresh-password']?.reset();
    refreshPassword.clear();
  }

  void clearSetPassword() {
    formKey.currentState?.fields['set-password']?.reset();
    setPassword.clear();
  }
}
