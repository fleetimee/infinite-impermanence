import 'package:akm/app/data/provider/crypto/crypto.provider.dart';
import 'package:akm/app/models/crypto/crypto.model.dart';
import 'package:get/get.dart';

class CryptoController extends GetxController {
  @override
  void onInit() {
    getCrypto();
    super.onInit();
  }

  var crypto = List<Crypto>.empty(growable: true).obs;
  var isLoading = false.obs;

  void getCrypto() async {
    try {
      isLoading(true);
      CryptoProvider().fetchCrypto().then((resp) {
        isLoading(false);
        crypto.addAll(resp);
      }, onError: (e) {
        isLoading(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
