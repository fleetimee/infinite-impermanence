import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crypto_detail_controller.dart';

class CryptoDetailView extends GetView<CryptoDetailController> {
  const CryptoDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // function to remove html tags from string

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        height: 90.0,
        child: ElevatedButton.icon(
          icon: const Icon(Icons.favorite),
          label: const Text("Add to favorite"),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // <-- Radius
            ),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Obx(() => controller.isDataLoading.value
                      ? const Align(
                          alignment: Alignment.bottomCenter,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.6,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                controller.crypto.value.image!.large!,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.6,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => controller.isDataLoading.value
                            ? const Text(
                                "Ticker : ...",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              )
                            : Text(
                                "Ticker : ${controller.crypto.value.symbol?.toUpperCase()}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              )),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      const Text(
                        "",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          controller.isDataLoading.value
                              ? "Loading..."
                              : controller.crypto.value.name!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      )),
                  Row(
                    children: [
                      Obx(() => Text(
                            controller.isDataLoading.value
                                ? "Loading..."
                                : "\$${controller.getUsdFromCurrentPrice(controller.crypto.value.marketData!.currentPrice!)}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Obx(
                        () => controller.isDataLoading.value
                            ? const SizedBox.shrink()
                            : controller.crypto.value.marketData!
                                        .priceChangePercentage24H! <
                                    0
                                ? Card(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        "${controller.crypto.value.marketData!.priceChangePercentage24H!.toStringAsFixed(2)}%",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : Card(
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        "${controller.crypto.value.marketData!.priceChangePercentage24H!.toStringAsFixed(2)}%",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Obx(() => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.isDataLoading.value
                              ? "Loading..."
                              : controller.removeHtmlTags(
                                  controller.crypto.value.description!.en!),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Categories",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Obx(() => Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              runAlignment: WrapAlignment.start,
                              children: controller.isDataLoading.value
                                  ? const [
                                      Text(
                                        "Loading...",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ]
                                  : controller.crypto.value.categories!
                                      .map(
                                        (e) => Card(
                                          color: primaryColor,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 8.0,
                                            ),
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
