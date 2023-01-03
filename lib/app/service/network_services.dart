// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/widget/error_internet.dart';

class NetworkStatusService extends GetxService {
  NetworkStatusService() {
    DataConnectionChecker().onStatusChange.listen(
      (status) async {
        _getNetworkStatus(status);
      },
    );
  }

  void _getNetworkStatus(DataConnectionStatus status) {
    if (status == DataConnectionStatus.connected) {
      _validateSession(); //after internet connected it will redirect to home page
    } else {
      Get.dialog(
        const NetworkErrorItem(),
        useSafeArea: false,
        barrierDismissible: false,
        transitionCurve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 300),
      ); // If internet loss then it will show the NetworkErrorItem widget
    }
  }

  void _validateSession() {
    // Get.offNamedUntil(
    //     Routes.HOME, (_) => false); //Here redirecting to home page
    Get.back();
    // if context is null then it will throw an error

    if (Get.context != null) {
      Get.snackbar(
        'Internet Connected',
        'You are connected to internet',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.wifi,
          color: Colors.white,
        ),
      );
    }
  }
}
