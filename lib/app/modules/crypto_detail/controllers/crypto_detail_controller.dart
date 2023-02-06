import 'package:akm/app/data/provider/crypto/crypto_detail.provider.dart';
import 'package:akm/app/models/crypto/cryptodetail.model.dart';
import 'package:get/get.dart';

class CryptoDetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchOneTicker();
  }

  String id = Get.arguments;

  var crypto = CryptoDetail().obs;

  var isDataLoading = false.obs;

  // function to remove html tags from string
  String removeHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true,
    );
    return htmlText.replaceAll(exp, '');
  }

  // function to get usd from currentPrice map
  String getUsdFromCurrentPrice(Map<String, dynamic> currentPrice) {
    return currentPrice['usd'].toString();
  }

  // Fetch Crypto by ticker
  void fetchOneTicker() async {
    try {
      isDataLoading(true);
      CryptoDetailProvider().fetchDetailByTicker(id).then((resp) {
        isDataLoading(false);
        crypto(resp);
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
