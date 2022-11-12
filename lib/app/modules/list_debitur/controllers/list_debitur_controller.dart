// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:nekos/nekos.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/debitur/list_debitur.provider.dart';
import '../../../models/debitur_model/list_debitur.model.dart';

class ListDebiturController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllDebitur(page.toString(), sort);
    paginateDebitur();
  }

  // Some helper variable
  final isSortIdDesc = false.obs;
  final isSortNameDesc = false.obs;
  final isSortTanggalDesc = false.obs;
  final isSortUmurDesc = false.obs;

  // For nekos api
  Future<String> img = Nekos().avatar();

  // Initialize empty list with page
  var listDebitur = List<Datum>.empty(growable: true).obs;
  var page = 1;
  var sort = 'id,ASC';

  // Trigger reload with data change with Observable
  var isDataProcessing = false.obs;

  // Pagination variable
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // Fetching data from API to get list of debitur
  void getAllDebitur(String page, String sort) async {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void getMoreDebitur(String page) {
    try {
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        if (resp.isNotEmpty) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          debugPrint('No more data');
        }
        listDebitur.addAll(resp);
      }, onError: (err) {
        isMoreDataAvailable(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMoreDataAvailable(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void paginateDebitur() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getMoreDebitur(page.toString());
      }
    });
  }

  void refreshList() async {
    page = 1;
    getAllDebitur(page.toString(), sort);
  }

  void sortByIdDesc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortIdDesc(true);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByIdAsc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortIdDesc(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByNamaDesc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortNameDesc(true);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByNamaAsc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortNameDesc(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByTanggalInputDesc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortTanggalDesc(true);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByTanggalInputAsc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortTanggalDesc(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByUmurDesc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortUmurDesc(true);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void sortByUmurAsc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortUmurDesc(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        isDataProcessing(false);
        // clear list
        listDebitur.clear();
        listDebitur.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
