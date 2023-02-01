import 'package:akm/app/data/provider/kurs/kurs.provider.dart';
import 'package:akm/app/models/kurs/kurs.model.dart';
import 'package:get/get.dart';

class KursController extends GetxController {
  //TODO: Implement KursController

  @override
  void onInit() {
    super.onInit();
    getKurs();
  }

  var kursList = List<Kurs>.empty(growable: true).obs;
  var isDataLoading = true.obs;

  void getKurs() async {
    try {
      isDataLoading(true);
      KursProvider().fetchKurs().then(
        (resp) {
          isDataLoading(false);
          // as rss item add to list
          kursList.clear();
          kursList.addAll(resp);
        },
        onError: (err) {
          isDataLoading(false);
          Get.snackbar('Error', err.toString());
        },
      );
    } catch (e) {
      isDataLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
