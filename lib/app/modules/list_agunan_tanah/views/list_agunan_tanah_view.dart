import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_agunan_tanah_controller.dart';

class ListAgunanTanahView extends GetView<ListAgunanTanahController> {
  const ListAgunanTanahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAgunanTanahView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isAgunanTanahProcessing.value) {
          return const Center(
            child: SataniaLoading(),
          );
        } else {
          if (controller.listAgunanTanah.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.listAgunanTanah.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      controller.listAgunanTanah[index].namaPemilik.toString(),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Data Kosong'),
            );
          }
        }
      }),
    );
  }
}
