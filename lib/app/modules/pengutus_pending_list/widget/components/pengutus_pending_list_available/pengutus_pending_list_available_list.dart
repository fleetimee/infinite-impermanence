import 'package:akm/app/modules/pengutus_pending_list/controllers/pengutus_pending_list_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/simple_alert.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

class ListPendingPemutusanPengutus extends StatelessWidget {
  const ListPendingPemutusanPengutus({
    super.key,
    required this.controller,
  });

  final PengutusPendingListController controller;

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
            controller.getMyPendingPemutusan();
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
          reverse: true,
          itemCount: controller.listMyPendingPemutusan.length,
          itemBuilder: (context, index) {
            Widget buildChip(int index) {
              Color chipColor;
              String chipText;

              String status = controller.listMyPendingPemutusan[index].status;

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
                  NativePromptAlertPink(
                    controller: controller,
                    index: index,
                    title:
                        'Detail ${controller.listMyPendingPemutusan[index].debitur.peminjam1}',
                    content: 'Pilih aksi yang ingin dilakukan',
                    textDanger: 'REVIEW',
                    textSuccess: 'LIHAT PROGRESS',
                    onPressedDanger: () {
                      Navigator.pop(context);

                      Get.toNamed(Routes.PENGUTUS_SUBMIT,
                          arguments: controller.listMyPendingPemutusan[index]);
                    },
                    onPressedSuccess: () {
                      Get.toNamed(Routes.PENGAJUAN_DETAIL,
                          arguments:
                              controller.listMyPendingPemutusan[index].id!);
                    },
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
                  color: Colors.pink[900]?.withOpacity(0.7),
                  child: ListTile(
                    splashColor: Colors.pinkAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    enableFeedback: true,
                    leading: RandomAvatar(
                      '${controller.listMyPendingPemutusan[index].debitur.peminjam1}',
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

            // return Container(
            //   padding: const EdgeInsets.all(12.0),
            //   child: InkWell(
            //     onTap: () {
            //       Get.dialog(
            //         AlertDialog(
            //           title: Text(
            //             'Detail ${controller.listMyPendingPemutusan[index].debitur.peminjam1}',
            //             style: const TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           content: const Text(
            //             'Pilih aksi yang ingin dilakukan',
            //             style: TextStyle(
            //               fontSize: 15,
            //             ),
            //           ),
            //           actions: [
            //             GFButton(
            //               color: GFColors.SUCCESS,
            //               size: GFSize.LARGE,
            //               onPressed: () {
            //                 Navigator.pop(context);

            //                 Get.toNamed(Routes.PENGUTUS_SUBMIT,
            //                     arguments:
            //                         controller.listMyPendingPemutusan[index]);
            //                 // pop dialog
            //               },
            //               text: 'Review',
            //             ),
            //             GFButton(
            //               size: GFSize.LARGE,
            //               onPressed: () {
            //                 Navigator.pop(context);
            //                 Get.toNamed(Routes.PENGAJUAN_DETAIL,
            //                     arguments:
            //                         controller.listMyPendingPemutusan[index].id!);
            //               },
            //               text: 'Lihat Progress',
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //     child: Card(
            //       clipBehavior: Clip.antiAlias,
            //       child: SizedBox(
            //         width: MediaQuery.of(context).size.width,
            //         child: Row(
            //           children: [
            //             SizedBox(
            //               width: 80.0,
            //               height: 80.0,
            //               child: CachedNetworkImage(
            //                 imageUrl:
            //                     "https://user-images.githubusercontent.com/45744788/216530827-23eebaae-1f61-4c86-93e6-4c982d185234.png",
            //                 imageBuilder: (context, imageProvider) => Container(
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: imageProvider,
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //                 placeholder: (context, url) =>
            //                     const CircularProgressIndicator(),
            //                 errorWidget: (context, url, error) =>
            //                     const Icon(Icons.error),
            //               ),
            //             ),
            //             Expanded(
            //               child: Container(
            //                 padding: const EdgeInsets.all(12.0),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         SizedBox(
            //                           width: 130,
            //                           child: GFBadge(
            //                             size: GFSize.LARGE,
            //                             text: pending
            //                                 ? 'BELUM DIREVIEW'
            //                                 : reviewed
            //                                     ? 'BELUM DIPUTUS'
            //                                     : done
            //                                         ? 'DITERIMA'
            //                                         : rejected
            //                                             ? 'DITOLAK 🤣'
            //                                             : '',
            //                             color: reviewed
            //                                 ? Colors.orange
            //                                 : done
            //                                     ? Colors.green
            //                                     : rejected
            //                                         ? Colors.red
            //                                         : Colors.grey,
            //                           ),
            //                         ),
            //                         const Spacer(),
            //                         Text(
            //                           DateFormat('EEEE dd MMM yyyy').format(
            //                               DateTime.parse(controller
            //                                   .listMyPendingPemutusan[index]
            //                                   .tglReview
            //                                   .toString())),
            //                           style: const TextStyle(
            //                             fontSize: 10.0,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     const SizedBox(
            //                       height: 6.0,
            //                     ),
            //                     Row(
            //                       children: [
            //                         Text(
            //                           controller.listMyPendingPemutusan[index]
            //                               .debitur.peminjam1,
            //                           maxLines: 2,
            //                           overflow: TextOverflow.ellipsis,
            //                           style: const TextStyle(
            //                             fontSize: 15.0,
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                         const Spacer(),
            //                         Text(
            //                           controller.listMyPendingPemutusan[index].id,
            //                           style: const TextStyle(
            //                             fontSize: 10.0,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // );
          },
        ),
      ),
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

  final PengutusPendingListController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Text(
          '${controller.listMyPendingPemutusan[index].debitur.peminjam1}',
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
                  '${controller.listMyPendingPemutusan[index].id}',
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
                      controller.listMyPendingPemutusan[index].tglSubmit),
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
                  '${controller.listMyPendingPemutusan[index].user.first.displayName}',
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
