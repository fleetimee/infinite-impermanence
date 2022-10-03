import 'package:akm/app/data/provider/debitur/detail_debitur.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:get/get.dart';
import 'package:nekos/nekos.dart';

class InsightDebiturController extends GetxController {
  // Initialize on Init and get debiturs details
  @override
  void onInit() {
    super.onInit();
    fetchOneDebitur(debiturId);
  }

  // For nekos api
  Future<String> img = Nekos().smug();

  // Get debitur id from previous page
  final int debiturId = Get.arguments;

  // Initialize map for insight debitur
  var insightDebitur = DebiturInsight().obs;

  // Variable for loading
  var isDataLoading = false.obs;

  // Fetch Debitur by id
  void fetchOneDebitur(int id) async {
    try {
      isDataLoading(true);
      InsightDebiturProvider().fetchDebiturById(debiturId).then((resp) {
        isDataLoading(false);
        insightDebitur(resp);
      }, onError: (err) {
        isDataLoading(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
