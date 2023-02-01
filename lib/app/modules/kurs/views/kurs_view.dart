import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kurs_controller.dart';

class KursView extends GetView<KursController> {
  const KursView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KursView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'KursView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount:
                          // ignore index 0
                          controller.kursList.length - 1,
                      itemBuilder: (context, index) {
                        // ignore index 0
                        index += 1;

                        return ListTile(
                          title: Text(
                            controller.kursList[index].mataUang ?? '',
                          ),
                          subtitle: Text(
                            controller
                                    .kursList[index].bankNotes?.bankNotesBeli ??
                                '',
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
