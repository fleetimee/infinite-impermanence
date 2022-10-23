import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

import '../controllers/agunan_analisis_calc_controller.dart';

class AgunanAnalisisCalcView extends GetView<AgunanAnalisisCalcController> {
  AgunanAnalisisCalcView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgunanAnalisisCalcView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Agunan Tanah',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.isAgunanTanahAnalisisProcessing.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.listAgunanTanahAnalisis.length,
                              itemBuilder: (context, index) {
                                return Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.6),
                                    1: FlexColumnWidth(0.4),
                                  },
                                  border: TableBorder.all(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                  children: [
                                    TableRow(children: [
                                      paddedText(controller
                                          .listAgunanTanahAnalisis[index]
                                          .deskripsiPendek
                                          .toString()),
                                      paddedText(MoneyMaskedTextController(
                                        initialValue: double.parse(controller
                                            .listAgunanTanahAnalisis[index]
                                            .nilaiPasar
                                            .toString()),
                                        thousandSeparator: '.',
                                        decimalSeparator: '',
                                        precision: 0,
                                      ).text),
                                    ])
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomRight,
                              // child: Text(
                              //   'Total: ${
                              //   // Sum nilai pasar in the list of each object
                              //   controller.listAgunanTanahAnalisis.fold<int>(0, (previousValue, element) => previousValue + int.parse(element.nilaiPasar.toString()))}',
                              //   style: const TextStyle(fontSize: 20),
                              // ),
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Total :',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: FormBuilderTextField(
                                      name: 'totalAgunanTanah',
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      readOnly: true,
                                      controller: controller.totalAgunanTanah =
                                          MoneyMaskedTextController(
                                        initialValue: double.parse(controller
                                            .listAgunanTanahAnalisis
                                            .fold<int>(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue +
                                                    int.parse(element.nilaiPasar
                                                        .toString()))
                                            .toString()),
                                        thousandSeparator: '.',
                                        decimalSeparator: '',
                                        precision: 0,
                                      ),
                                      decoration: const InputDecoration(
                                        prefixText: 'Rp .',
                                        // disable underline
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Agunan Tanah & Bangunan',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller
                          .isAgunanTanahBangunanAnalisisProcessing.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .listAgunanTanahBangunanAnalisis.length,
                              itemBuilder: (context, index) {
                                // return ListTile(
                                //   title: Text(controller
                                //       .listAgunanTanahAnalisis[index].deskripsiPendek
                                //       .toString()),
                                // );
                                return Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.6),
                                    1: FlexColumnWidth(0.4),
                                  },
                                  border: TableBorder.all(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                  children: [
                                    TableRow(children: [
                                      paddedText(controller
                                          .listAgunanTanahBangunanAnalisis[
                                              index]
                                          .deskripsiPendek
                                          .toString()),
                                      paddedText(controller
                                          .listAgunanTanahBangunanAnalisis[
                                              index]
                                          .nilaiPasar
                                          .toString()),
                                    ])
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Total: ${
                                // Sum nilai pasar in the list of each object
                                controller.listAgunanTanahBangunanAnalisis.fold<int>(0, (previousValue, element) => previousValue + int.parse(element.nilaiPasar.toString()))}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
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

Widget paddedText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 17),
    ),
  );
}
