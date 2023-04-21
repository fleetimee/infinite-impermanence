// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitBottomNavbar extends StatelessWidget {
  const ReviewerSubmitBottomNavbar({super.key, required this.controller});

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavBarButton(
      text: 'Kirim',
      icon: Icons.send,
      onPressed: () {
        if (controller.formKey.currentState!.saveAndValidate()) {
          // controller.submit();
          debugPrint(controller.formKey.currentState!.value.toString());
          Get.dialog(
            AlertDialog(
              title: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                'Dengan menekan tombol Ya, data diatas akan dikirim ke pemutus yang dipilih, dan status pengajuan berubah menjadi REVIEWED. Apakah anda yakin?',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              actions: [
                GFButton(
                  color: GFColors.DANGER,
                  size: GFSize.LARGE,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tidak'),
                ),
                GFButton(
                  color: GFColors.SUCCESS,
                  size: GFSize.LARGE,
                  onPressed: () {
                    var list = controller.formKey.currentState!.value;

                    // Transform map to list
                    var list2 = list.entries.toList();

                    // // remove MapEntry and key
                    list2.removeWhere(
                      (element) =>
                          element.key == 'pemutus' ||
                          element.key == 'tglReview' ||
                          element.key == 'inputan' ||
                          element.key == 'keuangan' ||
                          element.key == 'karakter' ||
                          element.key == 'bisnis' ||
                          element.key == 'usaha' ||
                          element.key == 'agunan' ||
                          element.key == 'berkas',
                    );

                    // debugPrint('list2: $list2');

                    // Transform list2 to list of string
                    var list3 = list2.map((e) => e.value).toList();

                    // list3.removeWhere((element) => element.k)

                    // transform list3 to string
                    list3 = list3.map((e) => e.toString()).toList();

                    controller.bahasanReviewer = list3;

                    var listFinal = controller.bahasanReviewer;

                    debugPrint(listFinal.toString());

                    Navigator.pop(context);
                    controller.saveReview();
                  },
                  child: const Text('Ya'),
                ),
              ],
            ),
          );
        } else {
          debugPrint('validation failed');
        }
      },
    );
  }
}
