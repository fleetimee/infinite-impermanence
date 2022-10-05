import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../controllers/list_debitur_controller.dart';

class ListDebiturView extends GetView<ListDebiturController> {
  const ListDebiturView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          blue200,
          blue300,
        ],
      ),
      appBar: AppBar(
        title: const Text('Debitur Yang Terdaftar'),
      ),
      body: Obx(
        () {
          if (controller.isDataProcessing.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.listDebitur.isNotEmpty) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      showOverlayImage: true,
                      imageOverlay: const NetworkImage(
                        'https://i.4cdn.org/a/1664910182761153.jpg',
                      ),
                      colorFilter: const ColorFilter.mode(
                        Color.fromARGB(136, 0, 0, 0),
                        BlendMode.darken,
                      ),
                      title: GFListTile(
                        // color: // White with opactity
                        //     Colors.white.withOpacity(0.5),
                        title: Text(
                          'Ada ${controller.listDebitur.length} debitur yang terdaftar',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: const Text(
                        'Klik tombol details untuk mulai menginputkan data analisa debitur',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.listDebitur.length,
                      itemBuilder: (context, index) {
                        if (index == controller.listDebitur.length - 1 &&
                            controller.isMoreDataAvailable.value == true) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                GFListTile(
                                  avatar: const GFAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                  ),
                                  color: secondaryColor,
                                  titleText:
                                      controller.listDebitur[index].peminjam1!,
                                  subTitleText: controller
                                      .listDebitur[index].bidangUsaha!,
                                  icon: GFButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.INSIGHT_DEBITUR,
                                          arguments:
                                              controller.listDebitur[index].id);
                                    },
                                    text: 'Details',
                                    color: primaryColor,
                                    type: GFButtonType.outline,
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
                ],
              );
            } else {
              return const Center(
                child: Text('No Data'),
              );
            }
          }
        },
      ),
    );
  }
}
