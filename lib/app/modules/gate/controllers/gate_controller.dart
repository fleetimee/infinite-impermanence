import 'package:akm/app/common/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GateController extends GetxController {
  @override
  void onInit() {
    getCustomClaims();

    super.onInit();
  }

  var customClaims = [].obs;

  void getCustomClaims() async {
    final claims = await auth.currentUser!.getIdTokenResult();

    if (claims.claims!['analis'] == true) {
      customClaims.add('analis');
    }

    if (claims.claims!['admin'] == true) {
      customClaims.add('admin');
    }

    if (claims.claims!['reviewer'] == true) {
      customClaims.add('reviewer');
    }

    if (claims.claims!['pengutus'] == true) {
      customClaims.add('pengutus');
    }

    debugPrint(customClaims.toString());
  }
}
