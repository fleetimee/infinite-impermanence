import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../controllers/list_debitur_controller.dart';

class ListDebiturView extends GetView<ListDebiturController> {
  const ListDebiturView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
      ),
      appBar: AppBar(
        title: const Text('Debitur Yang Terdaftar'),
      ),
      body: Obx(
        () {
          if (controller.isDataProcessing.value) {
            return const Center(
              child: SataniaLoading(),
            );
          } else {
            if (controller.listDebitur.isNotEmpty) {
              return Column(
                children: [
                  Animate(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      showOverlayImage: true,
                      imageOverlay: const AssetImage(
                        'assets/images/home/pink-box.jpg',
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
                            fontSize: 47,
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
                                        'https://avatars.githubusercontent.com/u/68892527?v=4',
                                      ),
                                      shape: GFAvatarShape.circle,
                                    ),
                                    color: secondaryColor,
                                    description: Text(
                                      'Tanggal Input : ${DateFormat('dd / MM / yyyy').format(
                                        DateTime.parse(
                                          controller
                                              .listDebitur[index].tglSekarang!
                                              .toString(),
                                        ),
                                      )}',
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    title: Text(
                                      controller.listDebitur[index].peminjam1!,
                                      style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    focusColor: primaryColor,
                                    subTitle: Text(
                                      'Usaha : ${controller.listDebitur[index].bidangUsaha!}',
                                      style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    icon: GFButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.INSIGHT_DEBITUR,
                                            arguments: controller
                                                .listDebitur[index].id);
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

class SataniaLoading extends StatelessWidget {
  const SataniaLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GFLoader(
          type: GFLoaderType.custom,
          child: ClipOval(
              child: const Image(
            image: AssetImage(
              'assets/images/home/satania-gabriel.gif',
            ),
            height: 250,
          )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms, color: secondaryColor)
                  .animate() // this wraps the previous Animate in another Animate
                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                  .slide()),
        ),
        const Text(
          'Loading...',
          style: TextStyle(
            fontSize: 25,
            color: secondaryColor,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 1200.ms, color: const Color(0xFF80DDFF))
            .animate() // this wraps the previous Animate in another Animate
            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
            .slide()
      ],
    );
  }
}
