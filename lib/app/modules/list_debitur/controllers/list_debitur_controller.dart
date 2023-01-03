// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/data/provider/debitur/list_debitur.provider.dart';
import '../../../models/debitur_model/list_debitur.model.dart';

class ListDebiturController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllDebitur(page.toString(), sort);
    paginateDebitur();
  }

  final formKey = GlobalKey<FormBuilderState>();
  final filterKey = GlobalKey<FormBuilderState>();

  var filterUmurInput = TextEditingController();
  var filterDomisiliInput = TextEditingController();
  var filterRangeTanggalInput = TextEditingController();
  var filterPlafondInput = TextEditingController();
  var filterJenisUsaha = TextEditingController();

  // Some helper variable
  final isSortIdDesc = false.obs;
  final isSortNameDesc = false.obs;
  final isSortTanggalDesc = false.obs;
  final isSortUmurDesc = false.obs;
  final isSearchPressed = false.obs;
  final isSortPlafondDesc = false.obs;
  final isSortProgressDesc = false.obs;

  RxBool isFilterUmurPressed = false.obs;
  RxBool isFilterAsalPressed = false.obs;
  RxBool isFilterTanggalPressed = false.obs;
  RxBool isFilterPlafondPressed = false.obs;
  RxBool isFilterJenisUsahaPressed = false.obs;

  // Initialize empty list with page
  var listDebitur = List<Datum>.empty(growable: true).obs;
  var page = 1;
  var sort = 'id,ASC';
  var query = '';
  var umur = '';
  var asal = '';

  // Trigger reload with data change with Observable
  var isDataProcessing = false.obs;

  // Check if uid is same with current user
  var isSameUser = false.obs;
  void checkSameUser(String uid) {
    if (uid == auth.currentUser?.uid) {
      isSameUser(true);
    } else {
      isSameUser(false);
    }
  }

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

  void restartPaginate() {
    page = 1;
    isMoreDataAvailable(true);
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
        restartPaginate();
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

  void searchDebitur(String page, String sort, String query) {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      ListDebiturProvider().searchDebiturs(page, sort, query).then((resp) {
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
        restartPaginate();
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
        restartPaginate();
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
        restartPaginate();
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
        restartPaginate();
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
        restartPaginate();
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
        restartPaginate();
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
        restartPaginate();
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

  void sortByPlafonDesc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortPlafondDesc(true);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        restartPaginate();
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

  void sortByPlafonAsc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortPlafondDesc(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        restartPaginate();
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

  void sortByProgressDesc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortProgressDesc(true);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        restartPaginate();
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

  void sortByProgressAsc(String page, String sort) {
    try {
      isMoreDataAvailable(false);
      isSortProgressDesc(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page, sort).then((resp) {
        restartPaginate();
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

  void filter(String page, String sort, String umur, String asal,
      String tanggal, String plafond, String jenisUsaha) {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      ListDebiturProvider()
          .filterDebiturs(page, sort, umur, asal, tanggal, plafond, jenisUsaha)
          .then((resp) {
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

  void transformSearchIntoForm() {
    isSearchPressed(true);
  }
}

final jenisUsahaList = [
  'Pertanian',
  'Perikanan',
  'Pertambangan',
  'Perindustrian',
  'Listrik',
  'Gas',
  'Air',
  'Kontruksi',
  'Perdagangan',
  'Pengangkutan',
  'Komunikasi',
  'Jasa Dunia Usaha',
  'Jasa Sosial',
  'Lain - Lain',
];
