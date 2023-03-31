// 🐦 Flutter imports:
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/list_debitur_controller.dart';

class ListDebiturListView extends StatelessWidget {
  final ListDebiturController controller;

  const ListDebiturListView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isDataProcessing.value) {
          return const Center(
            child: BpdDiyLoader(),
          );
        } else {
          if (controller.listDebitur.isNotEmpty) {
            return Column(
              children: [
                Animate(
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Lottie.asset(
                    'assets/images/home/search_user.zip',
                    fit: BoxFit.cover,
                    repeat: true,
                    height: 350,
                    frameRate: FrameRate.max,
                  ),
                )
                        .animate()
                        .fadeIn() // uses `Animate.defaultDuration`
                        .scale() // inherits duration from fadeIn
                        .move(
                            delay: 300.ms,
                            duration:
                                600.ms) // runs after the above w/new duration
                    // inherits the delay & duration from move,
                    ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.listDebitur.length,
                      itemBuilder: (context, index) {
                        if (index == controller.listDebitur.length - 1 &&
                            controller.isMoreDataAvailable.value == true) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                GFListTile(
                                  avatar: GFAvatar(
                                    shape: GFAvatarShape.standard,
                                    backgroundColor: primaryColor,
                                    radius: 40,
                                    child: Text(
                                      controller.listDebitur[index].peminjam1
                                              ?.substring(0, 1)
                                              .toUpperCase() ??
                                          '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  color: secondaryColor,
                                  description: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.calendarCheck,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            DateFormat('dd MMMM yyyy').format(
                                              DateTime.parse(
                                                controller.listDebitur[index]
                                                    .tglSekarang!
                                                    .toString(),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .listDebitur[index].peminjam1!,
                                        style: const TextStyle(
                                            color: primaryColor,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // aligns the text to the left
                                          children: [
                                            Row(
                                              children: [
                                                GFButtonBadge(
                                                  size: 1,
                                                  onPressed: null,
                                                  text:
                                                      '${((double.parse(controller.listDebitur[index].progress.toString())) * 100).toStringAsFixed(0)}%',
                                                  color: GFColors.SUCCESS,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                GFButtonBadge(
                                                  size: 1,
                                                  onPressed: null,
                                                  text: controller
                                                              .listDebitur[
                                                                  index]
                                                              .inputKeuangan ==
                                                          null
                                                      ? 'Belum Input'
                                                      : '${controller.listDebitur[index].inputKeuangan!.digunakanUntuk}',
                                                  color: GFColors.WARNING,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const GFButtonBadge(
                                                  size: 1,
                                                  onPressed: null,
                                                  text: 'UMKM',
                                                  color: GFColors.INFO,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                GFButtonBadge(
                                                  size: 1,
                                                  onPressed: null,
                                                  text:
                                                      '${controller.listDebitur[index].jenisUsaha}',
                                                  color: GFColors.DANGER,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  focusColor: primaryColor,
                                  subTitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Usaha',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: 160,
                                            child: Text(
                                              ': ${controller.listDebitur[index].bidangUsaha!}',
                                              style: const TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Umur',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(width: 15),
                                          Text(
                                            ': ${controller.listDebitur[index].umur!}',
                                            style: const TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Asal',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(width: 25),
                                          Text(
                                            ': ${controller.listDebitur[index].ktp1!}',
                                            style: const TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Plafon',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            ': ${controller.listDebitur[index].inputKeuangan == null ? 'Belum Input' : MoneyMaskedTextController(
                                                decimalSeparator: '',
                                                thousandSeparator: '.',
                                                leftSymbol: 'Rp ',
                                                precision: 0,
                                                initialValue: double.parse(
                                                    controller
                                                        .listDebitur[index]
                                                        .inputKeuangan!
                                                        .kreditDiusulkan
                                                        .toString()),
                                              ).text}',
                                            style: const TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  icon: controller.listDebitur[index].userId !=
                                          auth.currentUser?.uid
                                      ? Container()
                                      : GFButton(
                                          onPressed: () {
                                            controller.listDebitur[index]
                                                        .userId ==
                                                    auth.currentUser?.uid
                                                ? Get.toNamed(
                                                    Routes.INSIGHT_DEBITUR,
                                                    arguments: controller
                                                        .listDebitur[index].id)
                                                : null;
                                          },
                                          disabledColor: Colors.grey,
                                          disabledTextColor: Colors.white,
                                          disabledElevation: 0,
                                          text: 'Details',
                                          color: GFColors.INFO,
                                          shape: GFButtonShape.pills,
                                          size: GFSize.LARGE,
                                        ),
                                ),
                              ].animate(
                                interval: 100.ms,
                                effects: [
                                  const FadeEffect(),
                                  const ScaleEffect(),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Data Tidak Ditemukan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Lottie.asset(
                        'assets/images/home/404.zip',
                        frameRate: FrameRate.max,
                        fit: BoxFit.cover,
                        repeat: true,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text(
                            'Gagal memuat animasi',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Data tidak dapat ditemukan di database atau list debitur masih kosong',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
