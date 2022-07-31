import 'package:get/get.dart';

// ignore_for_file: unnecessary_overrides

class HomeController extends GetxController {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
}
