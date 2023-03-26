// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/modules/debitur_real/widget/debitur_real_edit_form.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

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
      bottomNavigationBar: SizedBox(
        height: 60,
        child: GFButton(
          onPressed: () {
            if (controller.formKey.currentState?.saveAndValidate() ?? false) {
              controller.editDebitur(data.id.toString());

              Get.back();
            } else {
              debugPrint(controller.formKey.currentState?.value.toString());
              debugPrint('validation failed');
              AwesomeDialog(
                context: context,
                animType: AnimType.bottomSlide,
                dialogType: DialogType.warning,
                dialogBackgroundColor: primaryColor,
                titleTextStyle: GoogleFonts.poppins(
                  color: secondaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                descTextStyle: GoogleFonts.poppins(
                  color: secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                title: 'Warning',
                desc: 'Form masih ada yang kosong',
                btnOkText: 'Sunting Kembali',
                btnOkIcon: Icons.edit,
                btnOkOnPress: () {},
                btnOkColor: blue300,
              ).show();
            }
          },
          text: 'Update',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          icon: const Icon(
            Icons.save,
            color: Colors.white,
          ),
          size: GFSize.LARGE,
          color: primaryColor,
        ),
      ),
    );
  }
}
