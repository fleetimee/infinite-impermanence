// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/create_debitur/views/components/review_page.dart';
import 'package:akm/app/widget/drawer.dart';
import '../controllers/create_debitur_controller.dart';

class CreateDebiturView extends GetView<CreateDebiturController> {
  const CreateDebiturView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Input Debitur'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          GifView.asset(
            'assets/images/add_debitur_section/hero_motion.gif',
            frameRate: 30,
            fit: BoxFit.cover,
            loop: false,
            height: 200,
          ),
          const Divider(
            color: Colors.black,
          ),
          SingleChildScrollView(
            child: Obx(
              () => Stepper(
                currentStep: controller.currentStep.value,
                physics: const ClampingScrollPhysics(),
                onStepTapped: (step) {
                  controller.currentStep.value = step;
                },
                type: StepperType.vertical,
                // onStepContinue: () {
                //   final isLastStep = controller.currentStep.value ==
                //       controller.getSteps().length - 1;

                //   // Validate form
                //   if (controller
                //       .formKeys[controller.currentStep.value].currentState!
                //       .validate()) {
                //     if (isLastStep) {
                //       // Validate all form before submit
                //       if (!controller.formKeys
                //           .every((key) => key.currentState!.validate())) {
                //         // show error snackbar
                //         Get.snackbar(
                //           'Error',
                //           'Please fill all form',
                //           snackPosition: SnackPosition.BOTTOM,
                //           backgroundColor: Colors.red,
                //           colorText: Colors.white,
                //           icon: const Icon(
                //             Icons.error,
                //             color: Colors.white,
                //           ),
                //         );
                //       } else {
                //         showBarModalBottomSheet(
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.vertical(
                //                 top: Radius.circular(25.0),
                //               ),
                //             ),
                //             backgroundColor: secondaryColor,
                //             bounce: true,
                //             elevation: 10.0,
                //             context: context,
                //             builder: (context) {
                //               return ReviewPage();
                //             });
                //       }
                //     } else {
                //       if (controller.currentStep < 5) {
                //         controller.currentStep.value += 1;
                //       } else {
                //         controller.currentStep.value = 0;
                //       }
                //     }
                //   }
                // },
                onStepContinue: () {
                  final isLastStep = controller.currentStep.value ==
                      controller.getSteps().length - 1;

                  // Validate form
                  if (isLastStep) {
                    showBarModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        backgroundColor: secondaryColor,
                        bounce: true,
                        elevation: 10.0,
                        context: context,
                        builder: (context) {
                          return ReviewPage();
                        });
                  } else {
                    if (controller.currentStep < 5) {
                      controller.currentStep.value += 1;
                    } else {
                      controller.currentStep.value = 0;
                    }
                  }
                },

                onStepCancel: () {
                  if (controller.currentStep > 0) {
                    controller.currentStep.value -= 1;
                  } else {
                    controller.currentStep.value = 0;
                  }
                },
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  // make last step variable to confirm button
                  final isLastStep =
                      details.currentStep == controller.getSteps().length - 1;

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
                },
                steps: controller.getSteps(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
