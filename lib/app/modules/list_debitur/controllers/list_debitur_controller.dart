import 'package:akm/app/data/provider/debitur/list_debitur.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/debitur_model/list_debitur.model.dart';

class ListDebiturController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllDebitur(page.toString());

    paginateDebitur();
  }

  // Initialize empty list with page
  var listDebitur = List<Datum>.empty(growable: true).obs;
  var page = 1;

  // Trigger reload with data change with Observable
  var isDataProcessing = false.obs;

  // Pagination variable
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // Fetching data from API to get list of debitur
  void getAllDebitur(String page) {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      ListDebiturProvider().fetchDebiturs(page).then((resp) {
        isDataProcessing(false);
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
      ListDebiturProvider().fetchDebiturs(page).then((resp) {
        if (resp.isNotEmpty) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          Get.snackbar(
            'Gagal',
            'Tidak ada data lagi',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
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
    getAllDebitur(page.toString());
  }
}
