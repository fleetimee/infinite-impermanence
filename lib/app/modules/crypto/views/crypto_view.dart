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
                        return GFCard(
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
                                  backgroundImage: NetworkImage(
                                      controller.crypto[index].image!),
                                ),
                              ],
                            ),
                            titleText: controller.crypto[index].name,
                            icon: Text(
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
