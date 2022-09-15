// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/modules/debitur_real/views/components/detail_debitur.dart';

class DebiturListView extends GetView<DebiturRealController> {
  const DebiturListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Obx(
      //   () => controller.loadingFetch.value
      //       ? const SizedBox.shrink()
      //       : FloatingActionButton(
      //           onPressed: () => controller.filterDebtor(),
      //           child: const Icon(Icons.search),
      //         ),
      // ),
      appBar: AppBar(
        title: const Text('Cari Debitur'),
        centerTitle: true,
        actions: [
          Obx(
            () => controller.loadingFetch.value
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: () => controller.filterDebtor(),
                    icon: const Icon(Icons.search),
                  ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Search bar to filter list
            // Selected debtor name

            // If debtor selected show name

            Obx(
              () => Expanded(
                child: controller.loadingFetch.value
                    ? Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: primaryColor,
                          size: 50,
                        ),
                      )
                    : controller.selectedDebtor.isEmpty
                        ? Center(
                            child: EmptyWidget(
                              image: null,
                              packageImage: PackageImage.Image_3,
                              title: 'Tidak ada data',
                              hideBackgroundAnimation: true,
                              subTitle: 'Silahkan cari debitur terlebih dahulu',
                              titleTextStyle: const TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: const TextStyle(
                                fontSize: 20,
                                color: primaryColor,
                              ),
                            ),
                          )
                        : GetBuilder<DebiturRealController>(
                            init: controller,
                            builder: (_) => ListView.separated(
                              itemCount: controller.selectedDebtor.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              itemBuilder: (_, index) {
                                final debtor = controller.selectedDebtor[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 32),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: calmBlue,
                                            // Show first letter of name
                                            child: Text(
                                              debtor.peminjam1!.substring(0, 1),
                                              style: const TextStyle(
                                                color: secondaryColor,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                              debtor.peminjam1.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  color: primaryColor)),
                                          subtitle: Text(
                                              debtor.bidangUsaha.toString()),
                                          trailing: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                      DetailDebitur(debtor: debtor),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
