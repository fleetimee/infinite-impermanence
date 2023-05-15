// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

class ListRiwayatPengajuan extends StatelessWidget {
  const ListRiwayatPengajuan({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(
      fontSize: 15,
      color: Colors.white,
    );

    return RefreshIndicator(
      onRefresh: () {
        return controller.refreshPengajuan();
      },
      child: Scrollbar(
        child: ListView.builder(
          itemCount: controller.listMySubmission.length,
          itemBuilder: (context, index) {
            Widget buildChip(int index) {
              Color chipColor;
              String chipText;

              String status = controller.listMySubmission[index].status;

              switch (status) {
                case 'PENDING':
                  chipColor = Colors.blue;
                  chipText = 'PENDING';
                  break;
                case 'REVIEWED':
                  chipColor = Colors.yellow;
                  chipText = 'REVIEWED';
                  break;
                case 'DONE':
                  chipColor = Colors.green;
                  chipText = 'DONE';
                  break;
                default:
                  chipColor = Colors.red;
                  chipText = 'DITOLAK';
                  break;
              }

              return Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  backgroundColor: chipColor,
                  label: Text(
                    chipText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                elevation: 6,
                color: Colors.blue[900]?.withOpacity(0.9),
                child: ListTile(
                  splashColor: Colors.blueAccent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  enableFeedback: true,
                  title: TitlePengajuan(
                    controller: controller,
                    subtitleStyle: subtitleStyle,
                    index: index,
                    buildChip: buildChip,
                  ),
                  trailing: const Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  leading: RandomAvatar(
                    '${controller.listMySubmission[index].debitur.peminjam1}',
                    height: 50,
                    width: 50,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.PENGAJUAN_DETAIL,
                        arguments: controller.listMySubmission[index].id);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitlePengajuan extends StatelessWidget {
  const TitlePengajuan({
    super.key,
    required this.controller,
    required this.subtitleStyle,
    required this.index,
    required this.buildChip,
  });

  final HomeController controller;
  final TextStyle subtitleStyle;
  final int index;
  final Widget Function(int) buildChip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          '${controller.listMySubmission[index].debitur.peminjam1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
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
                  'No Pengajuan',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listMySubmission[index].id}',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Tgl Pengajuan',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                      .format(controller.listMySubmission[index].tglSubmit),
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Status',
                  style: subtitleStyle,
                ),
                Text(
                  '',
                  style: subtitleStyle,
                ),
                buildChip(index),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
