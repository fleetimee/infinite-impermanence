import 'package:akm/app/data/provider/youtube-feeds/youtube-feeds.provider.dart';
import 'package:get/get.dart';
import 'package:webfeed/webfeed.dart';

class YoutubeFeedController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getVideos();
  }

  var videos = List<RssItem>.empty(growable: true).obs;
  var isDataLoading = true.obs;

  void getVideos() async {
    try {
      isDataLoading(true);
      VideoProvider().fetchVideo().then(
        (resp) {
          isDataLoading(false);
          // as rss item add to list
          videos.addAll(resp.items ?? []);
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
