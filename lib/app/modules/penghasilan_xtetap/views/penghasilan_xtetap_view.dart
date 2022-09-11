// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/widget/drawer.dart';
import '../controllers/penghasilan_xtetap_controller.dart';

class PenghasilanXtetapView extends GetView<PenghasilanXtetapController> {
  const PenghasilanXtetapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Form Penghasilan Tidak Tetap'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          GifView.asset(
            'assets/images/fixed_nonfixed/nonfixed.gif',
            frameRate: 30,
            fit: BoxFit.cover,
            loop: false,
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
                      final isLastStep = controller.currentStep.value ==
                          controller.getSteps().length - 1;

                      if (isLastStep) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          dialogBackgroundColor: primaryColor,
                          titleTextStyle: const TextStyle(
                            color: secondaryColor,
                            fontSize: 20,
                          ),
                          animType: AnimType.bottomSlide,
                          title: 'Berhasil Disetujui',
                          btnOkOnPress: () {},
                          autoHide: const Duration(seconds: 3),
                        ).show();
                      }

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
