import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agunan_form_onboarding_controller.dart';

class AgunanFormOnboardingView extends GetView<AgunanFormOnboardingController> {
  const AgunanFormOnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgunanFormOnboardingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AgunanFormOnboardingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
