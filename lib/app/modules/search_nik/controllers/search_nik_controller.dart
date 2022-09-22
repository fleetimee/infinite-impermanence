// ignore_for_file: avoid_print

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../models/debtor.dart';
 import '../../../service/search_service.dart';

class SearchNikController extends GetxController {
  final listDebtor = <Debtor>[].obs;
  Debtor debtor = Debtor();

  final isSearchLoading = false.obs;

  final nikController = TextEditingController();

  void callsearchNik() async {
    isSearchLoading.value = true;

    final api = SearchService();
    final nik = nikController.text;

    api.searchNik(nik).then((debtor) {
      listDebtor.value = [debtor];
      isSearchLoading.value = false;
    }, onError: (error) {
      // print(error);
      isSearchLoading.value = false;

      // listDebtor.value[0].noKtp1 = "Error: $error";
    });

    // final debtor = await api.searchNik(nik);

    // listDebtor.value = [debtor];

    // isSearchLoading.value = false;

    update();
  }
}
