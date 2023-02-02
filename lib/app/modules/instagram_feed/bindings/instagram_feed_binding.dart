import 'package:get/get.dart';

import '../controllers/instagram_feed_controller.dart';

class InstagramFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstagramFeedController>(
      () => InstagramFeedController(),
    );
  }
}
