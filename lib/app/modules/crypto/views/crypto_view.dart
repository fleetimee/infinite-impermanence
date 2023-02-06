import 'package:akm/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../controllers/crypto_controller.dart';

class CryptoView extends GetView<CryptoController> {
  const CryptoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrency Market'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: controller.crypto.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.CRYPTO_DETAIL,
                                arguments: controller.crypto[index].id);
                          },
                          child: GFCard(
                            margin: const EdgeInsets.all(8),
                            content: GFListTile(
                              avatar: Row(
                                children: [
                                  Text(
                                    '#${index + 1}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GFAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: CachedNetworkImage(
                                      imageUrl: controller.crypto[index].image!,
                                      imageBuilder: (context, imageProvider) =>
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
                                    // backgroundImage: NetworkImage(
                                    //   controller.crypto[index].image!,
                                    // ),
                                  ),
                                ],
                              ),
                              titleText: controller.crypto[index].name,
                              icon: Row(
                                children: [
                                  Text(
                                    '\$${controller.crypto[index].currentPrice}',
                                    style: TextStyle(
                                        color: controller.crypto[index]
                                                    .priceChangePercentage24H! >
                                                0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.arrow_forward_ios_outlined)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
