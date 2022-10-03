import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_debitur_controller.dart';

class ListDebiturView extends GetView<ListDebiturController> {
  const ListDebiturView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return ListView.builder(
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
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                controller.listDebitur[index].peminjam1!,
                              ),
                              subtitle: Text(
                                controller.listDebitur[index].bidangUsaha!,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Edit'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
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
