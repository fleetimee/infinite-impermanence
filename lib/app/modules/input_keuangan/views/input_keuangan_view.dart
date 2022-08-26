// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:stepper_page_view/stepper_page_view.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/input_keuangan/views/components/asumsi_keuangan.dart';
import 'package:akm/app/modules/input_keuangan/views/components/data_keuangan.dart';
import 'package:akm/app/modules/input_keuangan/views/components/interest.dart';
import '../controllers/input_keuangan_controller.dart';

class InputKeuanganView extends GetView<InputKeuanganController> {
  InputKeuanganView({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Keuangan'),
        actions: [
          // Scroll page view

          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),

          // Scroll page view
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: controller.formKeyInputKeuangan,
          onChanged: () {
            controller.formKeyInputKeuangan.currentState!.save();
            debugPrint(
                controller.formKeyInputKeuangan.currentState!.value.toString());
          },
          autovalidateMode: AutovalidateMode.disabled,
          child: StepperPageView(
            physics: const NeverScrollableScrollPhysics(),
            pageController: pageController,
            pageSteps: [
              PageStep(
                subtitle: const Text('Subtitle 1'),
                title: const Text('Step 1'),
                content: DataKeuanganInput(),
              ),
              PageStep(
                title: const Text('Step 2'),
                content: AsumsiKeuanganInput(),
              ),
              PageStep(
                title: const Text('Step 3'),
                content: Interest(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
