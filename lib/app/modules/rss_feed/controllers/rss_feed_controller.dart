import 'package:akm/app/data/provider/rss-feed/rss.provider.dart';
import 'package:get/get.dart';
import 'package:webfeed/webfeed.dart';

class RssFeedController extends GetxController {
  //TODO: Implement RssFeedController

  @override
  void onInit() {
    super.onInit();
    getRss();
  }

  List rss = List<RssItem>.empty(growable: true).obs;
  var isDataLoading = true.obs;

  final count = 0.obs;

  void getRss() async {
    try {
      isDataLoading(true);
      RssProvider().fetchRss().then(
        (resp) {
          isDataLoading(false);
          // as rss item add to list
          rss.addAll(resp.items ?? []);
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
