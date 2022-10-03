import 'package:akm/app/common/style.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/insight_debitur_controller.dart';

class InsightDebiturView extends GetView<InsightDebiturController> {
  const InsightDebiturView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: FutureBuilder(
      //     future:
      //         InsightDebiturProvider().fetchDebiturById(controller.debiturId),
      //     builder: (context, AsyncSnapshot snapshot) {
      //       if (snapshot.hasData) {
      //         return Text(snapshot.data.peminjam1.toString());
      //       } else {
      //         return const Text('Insight Debitur');
      //       }
      //     },
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: secondaryColor),
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                width: double.maxFinite,
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: FutureBuilder(
                future: controller.img,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return FancyShimmerImage(
                      imageUrl: snapshot.data,
                      boxFit: BoxFit.cover,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Obx(
                          () => controller.isDataLoading.value
                              ? const Text('Loading...')
                              : Text(
                                  controller.insightDebitur.value.peminjam1
                                      .toString(),
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                      const Icon(
                        Icons.bookmark_add_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Obx(
                  () => controller.isDataLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Text(
                              controller.insightDebitur.value.peminjam1
                                  .toString(),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
