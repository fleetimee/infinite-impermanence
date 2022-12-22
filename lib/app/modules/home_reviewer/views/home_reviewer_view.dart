import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_reviewer_controller.dart';

class HomeReviewerView extends GetView<HomeReviewerController> {
  const HomeReviewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeReviewerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeReviewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
