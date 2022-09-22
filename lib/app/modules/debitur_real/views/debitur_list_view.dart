// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// 🌎 Project imports:
 import '../../../common/style.dart';
 import '../../../models/debtor.dart';
 import '../controllers/debitur_real_controller.dart';
import 'components/detail_debitur.dart';

// ignore_for_file: unnecessary_const




class DebiturListView extends GetView<DebiturRealController> {
  const DebiturListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            builder: (_) {
                              return FutureBuilder<List<Debtor>>(
                                  future: controller.listDebtor.value,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Obx(
                                        () {
                                          return ListView.separated(
                                            itemCount: controller
                                                .selectedDebtor.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Divider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                            itemBuilder: (_, index) {
                                              final debtor = controller
                                                  .selectedDebtor[index];
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 32),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Card(
                                                      child: ListTile(
                                                        leading: CircleAvatar(
                                                          backgroundColor:
                                                              calmBlue,
                                                          child: Text(
                                                            debtor.peminjam1!
                                                                .substring(
                                                                    0, 1),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  secondaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                        title: Text(
                                                            debtor.peminjam1
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        primaryColor)),
                                                        subtitle: Text(debtor
                                                            .bidangUsaha
                                                            .toString()),
                                                        trailing: const Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                    DetailDebitur(
                                                        debtor: debtor),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  });
                            }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
