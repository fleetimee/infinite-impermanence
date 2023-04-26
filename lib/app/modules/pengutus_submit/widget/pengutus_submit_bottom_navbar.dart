// 🐦 Flutter imports:
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_alert.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';

class PengutusSubmitBottomNavBar extends StatelessWidget {
  const PengutusSubmitBottomNavBar({
    super.key,
    required this.showButton,
    required this.controller,
    required this.listPoints,
  });

  final PengutusSubmitController controller;
  final RxBool showButton;
  final RxList<dynamic> listPoints;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => showButton.value
          ? BottomNavBarButtonPink(
              text: 'Kirim',
              icon: Icons.send,
              onPressed: () {
                if (controller.formKey.currentState!.saveAndValidate()) {
                  if (listPoints.isEmpty) {
                    ErrorDialogPink(
                      context: context,
                      title: 'Perhatian',
                      desc: 'Pastikan tanggapan sudah diisi',
                      btnOkOnPress: () {},
                    ).show();
                  } else {
                    Get.dialog(
                      NativePromptAlertPink(
                        title: 'Submit',
                        content:
                            'Tolong double check data yang telah diinputkan, apakah sudah benar ?',
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
                                element.key == 'tglPutusan' ||
                                element.key == 'inputan' ||
                                element.key == 'keuangan' ||
                                element.key == 'karakter' ||
                                element.key == 'bisnis' ||
                                element.key == 'usaha' ||
                                element.key == 'agunan' ||
                                element.key == 'berkas' ||
                                element.key == 'putusan',
                          );

                          // debugPrint('list2: $list2');

                          // Transform list2 to list of string
                          var list3 = list2.map((e) => e.value).toList();

                          // list3.removeWhere((element) => element.k)

                          // transform list3 to string
                          list3 = list3.map((e) => e.toString()).toList();

                          controller.bahasanPemutus = list3;

                          var listFinal = controller.bahasanPemutus;

                          debugPrint(listFinal.toString());

                          Navigator.pop(context);

                          controller.savePutusan();
                        },
                        controller: controller,
                        index: 0,
                        textDanger: 'TIDAK',
                        textSuccess: 'YA',
                      ),
                    );
                  }
                } else {
                  ErrorDialogPink(
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
