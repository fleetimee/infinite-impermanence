// 🐦 Flutter imports:
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/modules/debitur_real/widget/debitur_real_bottom_navbar.dart';
import 'package:akm/app/modules/debitur_real/widget/debitur_real_edit_form.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

class DebiturEditView extends GetView<DebiturRealController> {
  DebiturEditView({Key? key}) : super(key: key);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Debitur: ${data.peminjam1}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: DebiturEditForm(
            data: data,
            controller: controller,
          ),
        ),
      ),
      bottomNavigationBar: DebiturBottomNavBar(
        controller: controller,
        data: data,
      ),
    );
  }
}
