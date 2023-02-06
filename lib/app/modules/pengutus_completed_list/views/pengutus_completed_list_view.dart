import 'package:akm/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../controllers/pengutus_completed_list_controller.dart';

class PengutusCompletedListView
    extends GetView<PengutusCompletedListController> {
  const PengutusCompletedListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudah Diputuskan'),
        backgroundColor: Colors.pink,
      ),
      body: Obx(
        () => controller.isMyCompletedPemutusanProcessing.value
            ? const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : // check if listMyCompletedReview is empty
            controller.listMyCompletedPemutusan.isEmpty
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'Currently Empty',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Lottie.asset(
                              'assets/images/home/empty.json',
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
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Belum ada pengajuan yang selesai diputus',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    Future<void>.delayed(
                                      const Duration(milliseconds: 500),
                                      () {
                                        controller.getMyCompletedPutusan();
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Refresh',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      Future<void>.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          controller.getMyCompletedPutusan();
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listMyCompletedPemutusan.length,
                      itemBuilder: (context, index) {
                        var reviewed =
                            controller.listMyCompletedPemutusan[index].status ==
                                'REVIEWED';
                        var done =
                            controller.listMyCompletedPemutusan[index].status ==
                                'DONE';
                        var rejected =
                            controller.listMyCompletedPemutusan[index].status ==
                                'REJECTED';

                        return Container(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.PENGAJUAN_DETAIL,
                                  arguments: controller
                                      .listMyCompletedPemutusan[index].id!);
                            },
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 80.0,
                                      height: 80.0,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://user-images.githubusercontent.com/45744788/216513919-c19cd833-556b-4aa3-8120-90a86843d487.png",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  child: GFBadge(
                                                    size: GFSize.LARGE,
                                                    text: reviewed
                                                        ? 'DIREVIEW'
                                                        : done
                                                            ? 'DITERIMA'
                                                            : rejected
                                                                ? 'DITOLAK 🤣'
                                                                : '',
                                                    color: reviewed
                                                        ? Colors.orange
                                                        : done
                                                            ? Colors.green
                                                            : rejected
                                                                ? Colors.red
                                                                : Colors.grey,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  DateFormat('EEEE dd MMM yyyy')
                                                      .format(DateTime.parse(
                                                          controller
                                                              .listMyCompletedPemutusan[
                                                                  index]
                                                              .tglPemutusan
                                                              .toString())),
                                                  style: const TextStyle(
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller
                                                      .listMyCompletedPemutusan[
                                                          index]
                                                      .debitur
                                                      .peminjam1,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller
                                                      .listMyCompletedPemutusan[
                                                          index]
                                                      .id,
                                                  style: const TextStyle(
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
