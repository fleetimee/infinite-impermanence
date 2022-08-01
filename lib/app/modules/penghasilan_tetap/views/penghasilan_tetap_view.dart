import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penghasilan_tetap_controller.dart';

class PenghasilanTetapView extends GetView<PenghasilanTetapController> {
  const PenghasilanTetapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: const Text('Form Penghasilan Tetap'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Image.asset(
            'assets/images/fixed_nonfixed/fixed_nonfixed.png',
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
              height: 700,
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Stepper(
                    currentStep: controller.currentStep.value,
                    steps: controller.getSteps(),
                    type: StepperType.horizontal,
                    physics: const ClampingScrollPhysics(),
                    onStepTapped: (step) {
                      controller.currentStep.value = step;
                    },
                    onStepCancel: () {
                      if (controller.currentStep > 0) {
                        controller.currentStep.value -= 1;
                      } else {
                        controller.currentStep.value = 0;
                      }
                    },
                    onStepContinue: () {
                      if (controller.currentStep <
                          controller.getSteps().length - 1) {
                        controller.currentStep.value += 1;
                      } else {
                        controller.currentStep.value =
                            controller.getSteps().length - 1;
                      }
                    },
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      // make last step variable to confirm button
                      final isLastStep = details.currentStep ==
                          controller.getSteps().length - 1;

                      return Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: details.onStepContinue,
                                child: Text(isLastStep ? 'Confirm' : 'Next'),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            if (controller.currentStep.value != 0)
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: details.onStepCancel,
                                  child: const Text('Cancel'),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
              )),
        ],
      ),
    );
  }
}
