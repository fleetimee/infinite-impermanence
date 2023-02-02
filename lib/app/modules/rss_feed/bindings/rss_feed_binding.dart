import 'package:get/get.dart';

import '../controllers/rss_feed_controller.dart';

class RssFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RssFeedController>(
      () => RssFeedController(),
    );
  }
}
