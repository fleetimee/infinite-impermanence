// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/modules/list_debitur/controllers/list_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 📦 Package imports:
import 'package:random_avatar/random_avatar.dart';

// 🌎 Project imports:

class ListAllDebitur extends StatelessWidget {
  const ListAllDebitur({
    super.key,
    required this.controller,
  });

  final ListDebiturController controller;

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(
      fontSize: 15,
      color: Colors.white,
    );
    return Scrollbar(
      child: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.listDebitur.length,
        itemBuilder: (context, index) {
          if (index == controller.listDebitur.length - 1 &&
              controller.isMoreDataAvailable.value == true) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                color: controller.listDebitur[index].userId ==
                        auth.currentUser?.uid
                    ? Colors.blue[900]?.withOpacity(0.9)
                    : Colors.red[900]?.withOpacity(0.9),
                elevation: 6,
                child: ListTile(
                  leading: RandomAvatar(
                    '${controller.listDebitur[index].peminjam1}',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                  enableFeedback: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  title: Text(
                    '${controller.listDebitur[index].peminjam1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: TextSubtitle(
                    subtitleStyle: subtitleStyle,
                    controller: controller,
                    index: index,
                  ),
                  onTap: () {
                    controller.listDebitur[index].userId ==
                            auth.currentUser?.uid
                        ? Get.toNamed(Routes.INSIGHT_DEBITUR,
                            arguments: controller.listDebitur[index].id)
                        : ErrorDialog(
                            title: 'Error',
                            context: context,
                            desc: 'Anda tidak memiliki akses ke data ini',
                            btnOkOnPress: () {},
                          ).show();
                  },
                  splashColor: Colors.blue[900]?.withOpacity(0.4),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class TextSubtitle extends StatelessWidget {
  final int index;

  const TextSubtitle({
    super.key,
    required this.subtitleStyle,
    required this.controller,
    required this.index,
  });

  final TextStyle subtitleStyle;
  final ListDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(0.30),
            1: FlexColumnWidth(0.03),
            2: FlexColumnWidth(0.67),
          },
          children: [
            TableRow(
              children: [
                Text(
                  'Tanggal Input',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                      .format(controller.listDebitur[index].tglSekarang!),
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Domisili',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listDebitur[index].ktp1}',
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
                  '${controller.listDebitur[index].jenisUsaha}',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Bidang Usaha',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listDebitur[index].bidangUsaha}',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Usia Debitur',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listDebitur[index].umur} Tahun',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Analis',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listDebitur[index].user?.displayName!}',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Plafond Kredit',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  controller.listDebitur[index].inputKeuangan == null
                      ? 'Belum Input'
                      : MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp ',
                          precision: 0,
                          initialValue: double.parse(
                            controller.listDebitur[index].inputKeuangan!
                                .kreditDiusulkan
                                .toString(),
                          ),
                        ).text,
                  style: subtitleStyle,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Progress: ${(double.parse(controller.listDebitur[index].progress!) * 100).toStringAsFixed(0)} %',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: double.parse(controller.listDebitur[index].progress!),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                (double.parse(controller.listDebitur[index].progress!) >= 0.1 &&
                        double.parse(controller.listDebitur[index].progress!) <
                            0.6)
                    ? Colors.red
                    : (double.parse(controller.listDebitur[index].progress!) >=
                                0.6 &&
                            double.parse(
                                    controller.listDebitur[index].progress!) <
                                1.0)
                        ? Colors.yellow
                        : Colors.green,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
