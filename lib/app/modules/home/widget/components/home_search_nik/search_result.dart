// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

class NikSearchResult extends StatelessWidget {
  const NikSearchResult({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(
      color: Colors.white,
    );

    return Expanded(
      child: Obx(
        () {
          if (controller.isSearchNikProcessing.value) {
            return const Center(
              child: BpdDiyLoader(),
            );
          } else {
            if (controller.listSearchNik.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      // add custom google font
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: controller.listSearchNik.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      color: Colors.blue.withOpacity(0.4),
                      elevation: 6,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          controller.listSearchNik[index].userId ==
                                  auth.currentUser?.uid
                              ? Get.toNamed(Routes.INSIGHT_DEBITUR,
                                  arguments: controller.listSearchNik[index].id)
                              : ErrorDialog(
                                  title: 'Error',
                                  desc: 'Anda tidak memiliki akses ke data ini',
                                  btnOkOnPress: () {
                                    Get.back();
                                  },
                                  context: context,
                                );
                        },
                        leading: RandomAvatar(
                          controller.listSearchNik[index].peminjam1!,
                          height: 50,
                          width: 50,
                        ),
                        title: Text(
                          controller.listSearchNik[index].peminjam1!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            // add custom google font
                          ),
                        ),
                        subtitle: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(0.40),
                            1: FlexColumnWidth(0.03),
                            2: FlexColumnWidth(0.57),
                          },
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  'NIK',
                                  style: subtitleStyle,
                                ),
                                Text(
                                  ':',
                                  style: subtitleStyle,
                                ),
                                Text(
                                  controller.listSearchNik[index].noKtp1!,
                                  style: subtitleStyle,
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  'Jenis Usaha',
                                  style: subtitleStyle,
                                ),
                                Text(
                                  ':',
                                  style: subtitleStyle,
                                ),
                                Text(
                                  controller.listSearchNik[index].jenisUsaha!,
                                  style: subtitleStyle,
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  'Tgl Input',
                                  style: subtitleStyle,
                                ),
                                Text(
                                  ':',
                                  style: subtitleStyle,
                                ),
                                Text(
                                  DateFormat('dd MMMM yyyy', 'id_ID').format(
                                      controller
                                          .listSearchNik[index].tglSekarang!),
                                  style: subtitleStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                        trailing: Column(
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
