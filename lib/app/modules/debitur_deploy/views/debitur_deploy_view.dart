// 🐦 Flutter imports:
import 'package:akm/app/modules/debitur_deploy/widget/debitur_deploy_bottom_navbar.dart';
import 'package:akm/app/modules/debitur_deploy/widget/debitur_deploy_create_form.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/debitur_deploy/controllers/debitur_deploy_controller.dart';

class DebiturDeployView extends GetView<DebiturDeployController> {
  const DebiturDeployView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    RxBool showButton = false.obs;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // User reached the bottom of the page
        showButton.value = true;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Debitur'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: DebiturDeployCreateForm(
              controller: controller,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => showButton.value
            ? DebiturDeployBottomNavbar(
                controller: controller,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
