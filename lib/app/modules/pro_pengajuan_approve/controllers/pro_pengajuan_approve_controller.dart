// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:get/get.dart';

class ProPengajuanApproveController extends GetxController {
  late AssetImage image;

  @override
  void onInit() {
    super.onInit();
    image = const AssetImage(
      'assets/images/approve/approve_header.gif',
    );
  }

  @override
  void dispose() {
    image.evict();
    super.dispose();
  }
}
