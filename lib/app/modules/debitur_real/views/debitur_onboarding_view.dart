// 🐦 Flutter imports:
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/debitur_deploy/controllers/debitur_deploy_controller.dart';
import '../../../common/style.dart';
import '../../../routes/app_pages.dart';

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
                    Row(
                      children: AnimateList(
                        interval: 100.ms,
                        effects: [
                          const FadeEffect(),
                          const ScaleEffect(),
                        ],
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => Get.toNamed(Routes.DEBITUR_DEPLOY),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add text and icon inside stack
                                  const Positioned(
                                    bottom: 40,
                                    right: 77,
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                        fontSize: 45,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 100,
                                    right: 70,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: secondaryColor,
                                      size: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => Get.toNamed(Routes.LIST_DEBITUR),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add text and icon inside stack
                                  const Positioned(
                                    bottom: 40,
                                    right: 40,
                                    child: Text(
                                      'Search',
                                      style: TextStyle(
                                        fontSize: 45,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 100,
                                    right: 70,
                                    child: Icon(
                                      FontAwesomeIcons.userAstronaut,
                                      color: secondaryColor,
                                      size: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
