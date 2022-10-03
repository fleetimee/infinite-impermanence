import 'package:akm/app/common/style.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        FontAwesomeIcons.userNinja,
                        size: 30,
                        color: primaryColor,
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
                      : Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                  1: FlexColumnWidth(1),
                                },
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                children: [
                                  TableRow(children: [
                                    paddedText('No. Debitur'),
                                    paddedText(controller
                                        .insightDebitur.value.noDebitur
                                        .toString()),
                                  ]),
                                  TableRow(
                                    children: [
                                      paddedText('Peminjam 1'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.peminjam1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Peminjam 2'),
                                      paddedText(
                                        controller
                                            .insightDebitur.value.peminjam2
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Asal KTP 1'),
                                      paddedText(
                                        controller.insightDebitur.value.ktp1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Asal KTP 2'),
                                      paddedText(
                                        controller.insightDebitur.value.ktp2
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Alamat 1'),
                                      paddedText(
                                        controller.insightDebitur.value.alamat1
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      paddedText('Alamat 2'),
                                      paddedText(
                                        controller.insightDebitur.value.alamat2
                                                    .toString() ==
                                                ''
                                            ? '-'
                                            : controller
                                                .insightDebitur.value.alamat2
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
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

Widget paddedText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 17),
    ),
  );
}
