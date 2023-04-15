// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/pengajuan_detail_controller.dart';

class DetailPengajuanInfoHeader extends StatelessWidget {
  const DetailPengajuanInfoHeader({
    super.key,
    required this.controller,
  });

  final PengajuanDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Obx(() => GFButton(
                      icon: Icon(
                        controller.pengajuanDetail.value.status == 'PENDING'
                            ? Icons.pending_actions_outlined
                            : controller.pengajuanDetail.value.status ==
                                    'REVIEWED'
                                ? Icons.pentagon
                                : controller.pengajuanDetail.value.status ==
                                        'DONE'
                                    ? Icons.done_all_outlined
                                    : Icons.error_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      text: controller.isPenganjuanDetailLoading.value
                          ? 'Loading...'
                          : controller.pengajuanDetail.value.status!,
                      color:
                          controller.pengajuanDetail.value.status == 'PENDING'
                              ? GFColors.DARK
                              : controller.pengajuanDetail.value.status ==
                                      'REVIEWED'
                                  ? GFColors.WARNING
                                  : controller.pengajuanDetail.value.status ==
                                          'DONE'
                                      ? GFColors.SUCCESS
                                      : GFColors.DANGER,
                      size: GFSize.LARGE,
                      shape: GFButtonShape.pills,
                    ))
              ],
            ),
            // vertical divider
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'No. Pengajuan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Obx(
                  () => GFButton(
                    icon: const Icon(
                      Icons.numbers_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    text: controller.isPenganjuanDetailLoading.value
                        ? 'Loading...'
                        : controller.pengajuanDetail.value.id!,
                    color: GFColors.INFO,
                    size: GFSize.LARGE,
                    shape: GFButtonShape.pills,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
