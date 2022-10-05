// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../../../routes/app_pages.dart';

class DebiturOnboardingView extends StatelessWidget {
  const DebiturOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        colors: [
          blue200,
          blue300,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      appBar: AppBar(
        title: const Text('Debitur Panel'),
      ),
      body: SingleChildScrollView(
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
                      onTap: () => Get.toNamed(Routes.ADD_DEBITUR),
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
          ],
        ),
      ),
    );
  }
}
