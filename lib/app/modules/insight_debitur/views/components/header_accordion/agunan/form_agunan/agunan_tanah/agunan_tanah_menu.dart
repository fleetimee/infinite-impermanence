// ignore_for_file: prefer_is_empty

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MenuAgunanTanah extends StatelessWidget {
  MenuAgunanTanah({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final selectedAgunanController = Get.put(AgunanPilihController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GFAccordion(
          titleChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Form Agunan Tanah',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Obx(
                () {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.agunan?.length == 0) {
                      return Row(
                        children: const [
                          Text(
                            'Belum di-input',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.red,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sudah di-input',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Obx(
                () {
                  if (selectedAgunanController.isAgunanInputProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.agunan!.isEmpty == true
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.AGUNAN_PILIH,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  child: const Text(
                                    "Input",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: ViewButton(controller: controller),
                              ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                      height: 425,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Jenis Agunan',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Berdasarkan data yang diinputkan debitur ini memiliki ${controller.insightDebitur.value.agunan!.length} jenis agunan diantara lain adalah',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: controller
                                    .insightDebitur.value.agunan!.length,
                                itemBuilder: (context, index) {
                                  // return ListTile(
                                  //   title: Text(controller
                                  //       .insightDebitur
                                  //       .value
                                  //       .agunan![
                                  //           index]
                                  //       .jenisAgunan!),
                                  //   subtitle: Text(controller
                                  //       .insightDebitur
                                  //       .value
                                  //       .agunan![
                                  //           index]
                                  //       .kodeAgunan
                                  //       .toString()),
                                  // );
                                  return GFListTile(
                                    avatar: GFAvatar(
                                      backgroundColor: primaryColor,
                                      foregroundColor: Colors.white,
                                      shape: GFAvatarShape.standard,
                                      child: Icon(
                                        controller
                                                    .insightDebitur
                                                    .value
                                                    .agunan![index]
                                                    .kodeAgunan ==
                                                1
                                            ? FontAwesomeIcons.earthAsia
                                            : controller
                                                        .insightDebitur
                                                        .value
                                                        .agunan![index]
                                                        .kodeAgunan ==
                                                    2
                                                ? FontAwesomeIcons.house
                                                : controller
                                                            .insightDebitur
                                                            .value
                                                            .agunan![index]
                                                            .kodeAgunan ==
                                                        3
                                                    ? FontAwesomeIcons.car
                                                    : controller
                                                                .insightDebitur
                                                                .value
                                                                .agunan![index]
                                                                .kodeAgunan ==
                                                            4
                                                        ? FontAwesomeIcons
                                                            .screwdriverWrench
                                                        : controller
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan![
                                                                        index]
                                                                    .kodeAgunan ==
                                                                5
                                                            ? FontAwesomeIcons
                                                                .moneyBill
                                                            : controller
                                                                        .insightDebitur
                                                                        .value
                                                                        .agunan![
                                                                            index]
                                                                        .kodeAgunan ==
                                                                    6
                                                                ? FontAwesomeIcons
                                                                    .shop
                                                                : controller
                                                                            .insightDebitur
                                                                            .value
                                                                            .agunan![
                                                                                index]
                                                                            .kodeAgunan ==
                                                                        7
                                                                    ? FontAwesomeIcons
                                                                        .algolia
                                                                    : FontAwesomeIcons
                                                                        .arrowUpFromGroundWater,
                                      ),
                                    ),
                                    title: Text(
                                      controller.insightDebitur.value
                                          .agunan![index].jenisAgunan!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )));
            },
            child: const Text(
              "Lihat",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
