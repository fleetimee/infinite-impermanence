import 'package:get/get.dart';

import '../controllers/youtube_feed_controller.dart';

class YoutubeFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeFeedController>(
      () => YoutubeFeedController(),
    );
  }
}
