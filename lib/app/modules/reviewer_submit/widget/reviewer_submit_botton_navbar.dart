// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_alert.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitBottomNavbar extends StatelessWidget {
  const ReviewerSubmitBottomNavbar(
      {super.key,
      required this.controller,
      required this.showButton,
      required this.listPoints});

  final ReviewerSubmitController controller;
  final RxBool showButton;
  final RxList<dynamic> listPoints;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => showButton.value
          ? BottomNavBarButton(
              text: 'Kirim',
              icon: Icons.send,
              onPressed: () {
                if (controller.formKey.currentState!.saveAndValidate()) {
                  debugPrint(controller.formKey.currentState!.value.toString());

                  if (listPoints.isEmpty) {
                    ErrorDialog(
                      context: context,
                      title: 'Perhatian',
                      desc: 'Pastikan tanggapan sudah diisi',
                      btnOkOnPress: () {},
                    ).show();
                  } else {
                    Get.dialog(
                      NativePromptAlert(
                        controller: controller,
                        index: 0,
                        title: 'Submit',
                        content:
                            'Dengan menekan tombol Ya, data diatas akan dikirim ke pemutus yang dipilih, dan status pengajuan berubah menjadi REVIEWED. Apakah anda yakin?',
                        onPressedDanger: () {
                          Navigator.pop(context);
                        },
                        onPressedSuccess: () {
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
                        textDanger: 'TIDAK',
                        textSuccess: 'YA',
                      ),
                    );
                  }
                } else {
                  ErrorDialog(
                    context: context,
                    title: 'Perhatian',
                    desc: 'Pastikan semua analisa sudah diperiksa',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
