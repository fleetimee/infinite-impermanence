import 'package:akm/app/modules/reviewer_completed_list/controllers/reviewer_completed_list_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

class ListCompletedPengajuanReviewer extends StatelessWidget {
  final ReviewerCompletedListController controller;

  const ListCompletedPengajuanReviewer({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(
      fontSize: 15,
      color: Colors.white,
    );

    return RefreshIndicator(
      onRefresh: () async {
        Future<void>.delayed(
          const Duration(milliseconds: 500),
          () {
            controller.getMyCompletedReview();
            Get.snackbar(
              'Refreshed',
              'Data berhasil di refresh',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
            );
          },
        );
      },
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listMyCompletedReview.length,
          itemBuilder: (context, index) {
            Widget buildChip(int index) {
              Color chipColor;
              String chipText;

              String status = controller.listMyCompletedReview[index].status;

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

            return InkWell(
              onTap: () {
                Get.toNamed(Routes.PENGAJUAN_DETAIL,
                    arguments: controller.listMyCompletedReview[index].id!);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  elevation: 6,
                  color: Colors.blue[900]?.withOpacity(0.7),
                  child: ListTile(
                    splashColor: Colors.blueAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    enableFeedback: true,
                    leading: RandomAvatar(
                      '${controller.listMyCompletedReview[index].debitur.peminjam1}',
                      height: 50,
                      width: 50,
                    ),
                    title: TitleCompletedList(
                      buildChip: buildChip,
                      subtitleStyle: subtitleStyle,
                      controller: controller,
                      index: index,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitleCompletedList extends StatelessWidget {
  final int index;
  final TextStyle subtitleStyle;
  final Widget Function(int) buildChip;

  const TitleCompletedList({
    super.key,
    required this.controller,
    required this.index,
    required this.subtitleStyle,
    required this.buildChip,
  });

  final ReviewerCompletedListController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Text(
          '${controller.listMyCompletedReview[index].debitur.peminjam1}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                  'No. Pengajuan',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listMyCompletedReview[index].id}',
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
                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(
                      controller.listMyCompletedReview[index].tglSubmit),
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
                  '${controller.listMyCompletedReview[index].user.first.displayName}',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '',
                  style: subtitleStyle,
                ),
                Text(
                  '',
                  style: subtitleStyle,
                ),
                Text(
                  '',
                  style: subtitleStyle,
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Tgl Review',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(
                      controller.listMyCompletedReview[index].tglReview),
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
