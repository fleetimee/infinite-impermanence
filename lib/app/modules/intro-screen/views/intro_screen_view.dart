import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/intro_screen_controller.dart';

class IntroScreenView extends GetView<IntroScreenController> {
  const IntroScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of first page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Lottie.asset('assets/images/home/intro1.json'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
            bodyTextStyle: TextStyle(fontSize: 19.0),
            pageColor: Colors.white,
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Title of first page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Lottie.asset('assets/images/home/intro.zip'),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
            bodyTextStyle: TextStyle(fontSize: 19.0),
            pageColor: Colors.white,
            imagePadding: EdgeInsets.zero,
          ),
        ),
      ],
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () {
        // On Done button pressed
      },
      onSkip: () {
        // On Skip button pressed
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
