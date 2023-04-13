import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebiturRealBottomNavBar extends StatelessWidget {
  final DebiturRealController controller;
  final dynamic data;

  /// This is a bottom navigation bar for editing debitur
  /// It takes [controller] and [data] as required parameters
  /// [controller] is the controller of the debitur module
  /// [data] is the data of the debitur that will be edited
  const DebiturRealBottomNavBar({
    super.key,
    required this.controller,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavBarButton(
      text: 'Sunting',
      onPressed: () {
        if (controller.formKey.currentState?.saveAndValidate() ?? false) {
          controller.editDebitur(data.id.toString());

          Get.back();
        } else {
          debugPrint(controller.formKey.currentState?.value.toString());
          debugPrint('validation failed');

          ErrorDialog(
            context: context,
            title: 'Warning',
            desc: 'Form masih ada yang kosong',
            btnOkText: 'Sunting Kembali',
            btnOkIcon: Icons.edit,
            btnOkOnPress: () {},
          ).show();
        }
      },
      icon: Icons.edit,
    );
  }
}
