// 🐦 Flutter imports:
import 'package:akm/app/modules/debitur_real/widget/debitur_real_menu_selector.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/debitur_deploy/controllers/debitur_deploy_controller.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import '../../../common/style.dart';

class DebiturOnboardingView extends StatelessWidget {
  DebiturOnboardingView({Key? key}) : super(key: key);

  final deployController = Get.put(DebiturDeployController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      appBar: AppBar(
        title: const Text('Debitur Panel'),
      ),
      body: Obx(
        () => deployController.isInputDebiturProcessing.value
            ? const Center(
                child: BpdDiyLoader(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        "What's happening ?",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    const DebiturMenuSelector(),
                    const SizedBox(
                      height: 150,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Lottie.asset(
                        'assets/images/home/confused_person.zip',
                        height: 400,
                        frameRate: FrameRate.max,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
