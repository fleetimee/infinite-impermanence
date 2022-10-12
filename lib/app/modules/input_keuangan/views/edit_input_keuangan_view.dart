// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:stepper_page_view/stepper_page_view.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/input_keuangan/views/components/edit/edit_asumsi_keuangan.dart';
import 'package:akm/app/modules/input_keuangan/views/components/edit/edit_data_keuangan.dart';
import 'package:akm/app/modules/input_keuangan/views/components/edit/edit_interest.dart';
import '../controllers/input_keuangan_controller.dart';

class EditInputKeuanganView extends GetView<InputKeuanganController> {
  EditInputKeuanganView({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 0);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Keuangan : ${data.peminjam1}'),
      ),
      body: FormBuilder(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StepperPageView(
            physics: const BouncingScrollPhysics(),
            pageController: pageController,
            pageSteps: [
              PageStep(
                subtitle: const Text('Subtitle 1'),
                title: const Text('Step 1'),
                content: EditDataKeuanganInput(),
              ),
              PageStep(
                title: const Text('Step 2'),
                content: EditAsumsiKeuanganInput(),
              ),
              PageStep(
                title: const Text('Step 3'),
                content: EditInterest(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
