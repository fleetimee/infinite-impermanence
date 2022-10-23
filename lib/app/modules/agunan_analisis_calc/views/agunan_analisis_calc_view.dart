import 'package:akm/app/common/style.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: FormBuilder(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                                if (controller
                                    .isAgunanTanahAnalisisProcessing.value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .listAgunanTanahAnalisis.length,
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
                                                    .listAgunanTanahAnalisis[
                                                        index]
                                                    .deskripsiPendek
                                                    .toString()),
                                                paddedText(
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanTanahAnalisis[
                                                              index]
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
                                                controller: controller
                                                        .totalAgunanTanah =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanTanahAnalisis
                                                      .fold<int>(
                                                          0,
                                                          (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                              int.parse(element
                                                                  .nilaiPasar
                                                                  .toString()))
                                                      .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
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
                                    .isAgunanTanahBangunanAnalisisProcessing
                                    .value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .listAgunanTanahBangunanAnalisis
                                            .length,
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
                                                    .listAgunanTanahBangunanAnalisis[
                                                        index]
                                                    .deskripsiPendek
                                                    .toString()),
                                                paddedText(
                                                    'Rp. ${MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanTanahBangunanAnalisis[
                                                              index]
                                                          .nilaiPasar
                                                          .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ).text}'),
                                              ])
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.bottomRight,
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
                                                name:
                                                    'totalAgunanTanahBangunan',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                readOnly: true,
                                                controller: controller
                                                        .totalAgunanTanahBangunan =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanTanahBangunanAnalisis
                                                      .fold<int>(
                                                          0,
                                                          (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                              int.parse(element
                                                                  .nilaiPasar
                                                                  .toString()))
                                                      .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
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
                                'Agunan Kendaraan',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                if (controller
                                    .isAgunanKendaraanAnalisisProcessing
                                    .value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .listAgunanKendaraanAnalisis.length,
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
                                                    .listAgunanKendaraanAnalisis[
                                                        index]
                                                    .deskripsiPanjang
                                                    .toString()),
                                                paddedText(
                                                    'Rp. ${MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanKendaraanAnalisis[
                                                              index]
                                                          .nilaiPasar
                                                          .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ).text}'),
                                              ])
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.bottomRight,
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
                                                name: 'totalAgunanKendaraan',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                readOnly: true,
                                                controller: controller
                                                        .totalAgunanKendaraan =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanKendaraanAnalisis
                                                      .fold<int>(
                                                          0,
                                                          (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                              int.parse(element
                                                                  .nilaiPasar
                                                                  .toString()))
                                                      .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
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
                                'Agunan Peralatan',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                if (controller
                                    .isAgunanPeralatanAnalisisProcessing
                                    .value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .listAgunanPeralatanAnalisis.length,
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
                                                    .listAgunanPeralatanAnalisis[
                                                        index]
                                                    .deskripsiPanjang
                                                    .toString()),
                                                paddedText(
                                                    'Rp. ${MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanPeralatanAnalisis[
                                                              index]
                                                          .nilaiPasar
                                                          .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ).text}'),
                                              ])
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.bottomRight,
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
                                                name: 'totalAgunanPeralatan',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                readOnly: true,
                                                controller: controller
                                                        .totalAgunanPeralatan =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanPeralatanAnalisis
                                                      .fold<int>(
                                                          0,
                                                          (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                              int.parse(element
                                                                  .nilaiPasar
                                                                  .toString()))
                                                      .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
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
                                'Agunan Cash',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                if (controller
                                    .isAgunanCashAnalisisProcessing.value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .listAgunanCashAnalisis.length,
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
                                                    .listAgunanCashAnalisis[
                                                        index]
                                                    .deskripsiPanjang
                                                    .toString()),
                                                paddedText(
                                                    'Rp. ${MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanCashAnalisis[
                                                              index]
                                                          .nilaiPasar
                                                          .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ).text}'),
                                              ])
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.bottomRight,
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
                                                name: 'totalAgunanCash',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                readOnly: true,
                                                controller: controller
                                                        .totalAgunanCash =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanCashAnalisis
                                                      .fold<int>(
                                                          0,
                                                          (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                              int.parse(element
                                                                  .nilaiPasar
                                                                  .toString()))
                                                      .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
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
                                'Agunan Los (Kios Pasar)',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                if (controller
                                    .isAgunanLosAnalisisProcessing.value) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .listAgunanLosAnalisis.length,
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
                                                    .listAgunanLosAnalisis[
                                                        index]
                                                    .deskripsiPanjang
                                                    .toString()),
                                                paddedText(
                                                    'Rp. ${MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanLosAnalisis[
                                                              index]
                                                          .nilaiPasar
                                                          .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ).text}'),
                                              ])
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.bottomRight,
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
                                                name: 'totalAgunanLos',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                readOnly: true,
                                                controller: controller
                                                        .totalAgunanLos =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanLosAnalisis
                                                      .fold<int>(
                                                          0,
                                                          (previousValue,
                                                                  element) =>
                                                              previousValue +
                                                              int.parse(element
                                                                  .nilaiPasar
                                                                  .toString()))
                                                      .toString()),
                                                  thousandSeparator: '.',
                                                  decimalSeparator: '',
                                                  precision: 0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                bottom: 0.0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: primaryColor.withOpacity(0.95),
                  height: 75,
                  width: 480,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Grand Total',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Analisa',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget paddedText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
  );
}
