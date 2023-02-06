import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/reviewer_stats_controller.dart';

class ReviewerStatsView extends GetView<ReviewerStatsController> {
  const ReviewerStatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik dan Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Progression',
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Obx(() {
                return Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.pendingController.isMyPendingReviewProcessing
                                .value
                            ? const Text(
                                "...",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : controller.pendingController.listMyPendingReview
                                    .isNotEmpty
                                ? const Text(
                                    "0%",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Text(
                                    "100%",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                          "Your progress",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Obx(
                          () => controller.pendingController
                                  .isMyPendingReviewProcessing.value
                              ? const LinearProgressIndicator(
                                  value: 0.0,
                                )
                              : controller.pendingController.listMyPendingReview
                                      .isNotEmpty
                                  ? const LinearProgressIndicator(
                                      value: 0.0,
                                    )
                                  : const LinearProgressIndicator(
                                      value: 1.0,
                                    ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Obx(
                          () => controller.pendingController
                                  .isMyPendingReviewProcessing.value
                              ? const Text(
                                  "...",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                )
                              : controller.pendingController.listMyPendingReview
                                      .isNotEmpty
                                  ? Text(
                                      "There are ${controller.pendingController.listMyPendingReview.length} reviews left to complete",
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    )
                                  : const Text(
                                      "All reviews completed",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Stats',
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Pending",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Obx(
                                    () => Row(
                                      children: [
                                        controller
                                                .pendingController
                                                .isMyPendingReviewProcessing
                                                .value
                                            ? const Text(
                                                "...",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : controller
                                                    .pendingController
                                                    .listMyPendingReview
                                                    .isNotEmpty
                                                ? Text(
                                                    "${controller.pendingController.listMyPendingReview.length}",
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : const Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.pending,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Selesai",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Obx(
                                    () => Row(
                                      children: [
                                        controller
                                                .completedController
                                                .isMyCompletedReviewProcessing
                                                .value
                                            ? const Text(
                                                "...",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : controller
                                                    .completedController
                                                    .listMyCompletedReview
                                                    .isNotEmpty
                                                ? Text(
                                                    "${controller.completedController.listMyCompletedReview.length}",
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : const Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.handshake,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Diterima",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Obx(
                                    () => Row(
                                      children: [
                                        controller
                                                .completedController
                                                .isMyCompletedReviewProcessing
                                                .value
                                            ? const Text(
                                                "...",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : controller
                                                        .completedController
                                                        .listMyCompletedReviewFilteredByAccepatance
                                                        .length
                                                        .toString() ==
                                                    "0"
                                                ? const Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : Text(
                                                    controller
                                                        .completedController
                                                        .listMyCompletedReviewFilteredByAccepatance
                                                        .length
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.check_box,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ditolak",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Obx(() => Row(
                                        children: [
                                          controller
                                                  .completedController
                                                  .isMyCompletedReviewProcessing
                                                  .value
                                              ? const Text(
                                                  "...",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : controller
                                                      .completedController
                                                      .listMyCompletedReview
                                                      .isEmpty
                                                  ? const Text(
                                                      "0",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : Text(
                                                      controller
                                                          .completedController
                                                          .listMyCompletedReviewFilteredByRejection
                                                          .length
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.cancel,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Your Location',
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Builder(
                builder: (context) {
                  List<Marker> allMarkers = [
                    Marker(
                      point: LatLng(
                        double.parse(controller.homeController.latitude.value
                            .split(' ')[1]),
                        double.parse(controller.homeController.longtitude.value
                            .split(' ')[1]),
                      ),
                      builder: (context) => const Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ];
                  return SizedBox(
                    height: 200,
                    width: 450,
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(
                          double.parse(controller.homeController.latitude.value
                              .split(' ')[1]),
                          double.parse(controller
                              .homeController.longtitude.value
                              .split(' ')[1]),
                        ),
                        zoom: 16,
                        interactiveFlags:
                            InteractiveFlag.all - InteractiveFlag.rotate,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                          userAgentPackageName:
                              'dev.fleaflet.flutter_map.example',
                        ),
                        MarkerLayer(
                          markers: allMarkers,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Kamu sedang berada di ${controller.homeController.fullAddress.value}',
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Chart',
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ),
              Obx(
                () => controller.completedController
                            .isMyCompletedReviewProcessing.value &&
                        controller
                            .pendingController.isMyPendingReviewProcessing.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Builder(
                            builder: (context) {
                              final List<Map> chartData = [
                                {
                                  "status": "Pending",
                                  "value": controller.pendingController
                                          .isMyPendingReviewProcessing.value
                                      ? 0
                                      : controller.pendingController
                                          .listMyPendingReview.length,
                                },
                                {
                                  "status": "Selesai",
                                  "value": controller.completedController
                                          .isMyCompletedReviewProcessing.value
                                      ? 0
                                      : controller.completedController
                                          .listMyCompletedReview.length,
                                },
                                {
                                  "status": "Diterima",
                                  "value": controller.completedController
                                          .isMyCompletedReviewProcessing.value
                                      ? 0
                                      : controller
                                          .completedController
                                          .listMyCompletedReviewFilteredByAccepatance
                                          .length,
                                },
                                {
                                  "status": "Ditolak",
                                  "value": controller.completedController
                                          .isMyCompletedReviewProcessing.value
                                      ? 0
                                      : controller
                                          .completedController
                                          .listMyCompletedReviewFilteredByRejection
                                          .length,
                                },
                              ];
                              return Container(
                                color: Theme.of(context).cardColor,
                                padding: const EdgeInsets.all(12.0),
                                child: SfCircularChart(
                                  title: ChartTitle(text: 'Status Review'),
                                  legend: Legend(isVisible: true),
                                  backgroundColor: Colors.transparent,
                                  series: <CircularSeries>[
                                    PieSeries<Map, String>(
                                      dataSource: chartData,
                                      enableTooltip: true,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                        isVisible: true,
                                        showZeroValue: false,
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        borderColor: Colors.transparent,
                                      ),
                                      xValueMapper: (Map data, _) =>
                                          data["status"],
                                      yValueMapper: (Map data, _) =>
                                          data["value"],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
