import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/reviewer_pending_list/controllers/reviewer_pending_list_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

class ListPendingPengajuanReviewer extends StatelessWidget {
  final ReviewerPendingListController controller;

  const ListPendingPengajuanReviewer({super.key, required this.controller});

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
            controller.getMyPendingReview();
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
          itemCount: controller.listMyPendingReview.length,
          itemBuilder: (context, index) {
            Widget buildChip(int index) {
              Color chipColor;
              String chipText;

              String status = controller.listMyPendingReview[index].status;

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
                Get.dialog(
                  NormalAlert(
                    controller: controller,
                    index: index,
                  ),
                );
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
                  color: Colors.blue[900]?.withOpacity(0.8),
                  child: ListTile(
                    splashColor: Colors.blueAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    enableFeedback: true,
                    leading: RandomAvatar(
                      '${controller.listMyPendingReview[index].debitur.peminjam1}',
                      height: 50,
                      width: 50,
                    ),
                    title: TitlePendingList(
                      buildChip: buildChip,
                      controller: controller,
                      index: index,
                      subtitleStyle: subtitleStyle,
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

class NormalAlert extends StatelessWidget {
  final int index;

  const NormalAlert({
    super.key,
    required this.controller,
    required this.index,
  });

  final ReviewerPendingListController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      title: Text(
        'Detail ${controller.listMyPendingReview[index].debitur.peminjam1}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: primaryColor,
      content: const Text(
        'Pilih aksi yang ingin dilakukan',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      actions: [
        GFButton(
          color: GFColors.DANGER,
          size: GFSize.LARGE,
          shape: GFButtonShape.pills,
          onPressed: () {
            Navigator.pop(context);

            Get.toNamed(Routes.REVIEWER_SUBMIT,
                arguments: controller.listMyPendingReview[index]);
            // pop dialog
          },
          text: 'Review',
        ),
        GFButton(
          size: GFSize.LARGE,
          shape: GFButtonShape.pills,
          onPressed: () {
            Navigator.pop(context);
            Get.toNamed(Routes.PENGAJUAN_DETAIL,
                arguments: controller.listMyPendingReview[index].id!);
          },
          text: 'Lihat Progress',
        )
      ],
    );
  }
}

class TitlePendingList extends StatelessWidget {
  final int index;
  final TextStyle subtitleStyle;
  final Widget Function(int) buildChip;

  const TitlePendingList({
    super.key,
    required this.controller,
    required this.index,
    required this.subtitleStyle,
    required this.buildChip,
  });

  final ReviewerPendingListController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Text(
          '${controller.listMyPendingReview[index].debitur.peminjam1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
                  'No Pengajuan',
                  style: subtitleStyle,
                ),
                Text(
                  ':',
                  style: subtitleStyle,
                ),
                Text(
                  '${controller.listMyPendingReview[index].id}',
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
                      .format(controller.listMyPendingReview[index].tglSubmit),
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
                  '${controller.listMyPendingReview[index].user.first.displayName}',
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
        )
      ],
    );
  }
}
