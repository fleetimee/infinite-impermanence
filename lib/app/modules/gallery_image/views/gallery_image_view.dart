import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gallery_image_controller.dart';

class GalleryImageView extends GetView<GalleryImageController> {
  const GalleryImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GalleryImageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GalleryImageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
