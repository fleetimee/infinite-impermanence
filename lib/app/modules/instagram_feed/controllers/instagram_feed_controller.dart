import 'package:akm/app/data/provider/instagram-feed/instagram-feed.provider.dart';
import 'package:get/get.dart';
import 'package:webfeed/webfeed.dart';

class InstagramFeedController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getInstagram();
  }

  var instagram = List<RssItem>.empty(growable: true).obs;
  var isDataLoading = true.obs;

  void getInstagram() async {
    try {
      isDataLoading(true);
      InstagramProvider().fetchInstagram().then(
        (resp) {
          isDataLoading(false);
          // as rss item add to list
          instagram.addAll(resp.items ?? []);
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
