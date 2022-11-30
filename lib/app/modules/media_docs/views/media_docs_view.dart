import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/media_docs_controller.dart';

class MediaDocsView extends GetView<MediaDocsController> {
  const MediaDocsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaDocsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MediaDocsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
