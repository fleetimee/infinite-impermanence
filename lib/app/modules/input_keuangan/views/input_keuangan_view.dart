// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:stepper_page_view/stepper_page_view.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/input_keuangan/views/components/input/asumsi_keuangan.dart';
import 'package:akm/app/modules/input_keuangan/views/components/input/data_keuangan.dart';
import 'package:akm/app/modules/input_keuangan/views/components/input/interest.dart';
import '../controllers/input_keuangan_controller.dart';

// TODO: Remake Input Keuangan without PageStepper (this one is dogshit)

class InputKeuanganView extends GetView<InputKeuanganController> {
  InputKeuanganView({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 0);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Keuangan'),
        actions: [
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: controller.formKey,
          // onChanged: () {
          //   controller.formKey.currentState!.save();
          //   debugPrint(
          //       controller.formKey.currentState!.value.toString());
          // },
          autovalidateMode: AutovalidateMode.disabled,
          child: StepperPageView(
            physics: const BouncingScrollPhysics(),
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
