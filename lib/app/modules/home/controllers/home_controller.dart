// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:faker_dart/faker_dart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nekos/nekos.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: unnecessary_overrides

class HomeController extends GetxController {
  @override
  void onInit() async {
    _getThemeStatus();
    super.onInit();
  }

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

  final Future<SharedPreferences> initPref = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await initPref;
    pref.setBool('theme', isDarkModeEnabled.value);
  }

  _getThemeStatus() async {
    var isLight = initPref.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    isDarkModeEnabled.value = (await isLight.value);
    Get.changeThemeMode(
        isDarkModeEnabled.value ? ThemeMode.dark : ThemeMode.light);
  }
}
