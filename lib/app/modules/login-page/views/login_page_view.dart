// 🐦 Flutter imports:

import 'dart:ui';

import 'package:akm/app/modules/login-page/widget/login_page_login_form.dart';
import 'package:akm/app/modules/login-page/widget/login_page_waves_login.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rive/rive.dart' as animation;
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  static const _backgroundColor = Colors.transparent;

  static const _colors = [
    Color(0xFF00C6FF),
    primaryColor,
  ];

  static const _durations = [
    5000,
    4000,
  ];

  static const _heightPercentages = [
    0.46,
    0.47,
  ];

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            blue200,
            blue400,
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset("assets/images/home/Spline.png"),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              ),
            ),
            const animation.RiveAnimation.asset(
              'assets/images/home/shapes.riv',
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const WavesLogin(
                          colors: _colors,
                          durations: _durations,
                          heightPercentages: _heightPercentages,
                          backgroundColor: _backgroundColor,
                        ),
                        LoginForm(
                          controller: controller,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
