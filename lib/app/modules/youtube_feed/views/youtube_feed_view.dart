import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/youtube_feed_controller.dart';

class YoutubeFeedView extends GetView<YoutubeFeedController> {
  const YoutubeFeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YoutubeFeedView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'YoutubeFeedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
