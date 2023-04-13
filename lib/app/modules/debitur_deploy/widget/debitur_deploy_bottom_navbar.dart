import 'package:akm/app/modules/debitur_deploy/controllers/debitur_deploy_controller.dart';
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebiturDeployBottomNavbar extends StatelessWidget {
  final DebiturDeployController controller;

  /// This is a bottom navigation bar for adding debitur
  /// It takes [controller] and [data] as required parameters
  const DebiturDeployBottomNavbar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavBarButton(
      text: 'Simpan',
      icon: Icons.save,
      onPressed: () {
        if (controller.formKey.currentState?.saveAndValidate() ?? false) {
          controller.saveDebtor();
          Get.back();
        } else {
          debugPrint(controller.formKey.currentState?.value.toString());
          debugPrint('validation failed');

          ErrorDialog(
            context: context,
            title: 'Warning',
            desc: 'Form masih ada yang kosong',
            btnCancelText: 'OK',
            btnCancelOnPress: () {},
          ).show();
        }
      },
    );
  }
}
