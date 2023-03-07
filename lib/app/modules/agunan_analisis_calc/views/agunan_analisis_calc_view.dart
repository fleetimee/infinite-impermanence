// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/agunan_analisis_calc_controller.dart';

class AgunanAnalisisCalcView extends GetView<AgunanAnalisisCalcController> {
  AgunanAnalisisCalcView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Analisa Agunan'),
        ),
        body: FormBuilder(
          key: controller.formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
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
                                                          .nilaiLiquidasi
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
                                                                  .nilaiLiquidasi
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
                                                          .nilaiLiquidasi
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
                                                                  .nilaiLiquidasi
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
                                                          .nilaiLiquidasi
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
                                                                  .nilaiLiquidasi
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
                                                          .nilaiLiquidasi
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
                                                                  .nilaiLiquidasi
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
                                                          .nilaiLiquidasi
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
                                                                  .nilaiLiquidasi
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
                                                          .nilaiLiquidasi
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
                                                                  .nilaiLiquidasi
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
                                'Agunan Lainnya',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Obx(() {
                                if (controller
                                    .isAgunanLainnyaAnalisisProcessing.value) {
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
                                            .listAgunanLainnyaAnalisis.length,
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
                                                    .listAgunanLainnyaAnalisis[
                                                        index]
                                                    .deskripsiPanjang
                                                    .toString()),
                                                paddedText(
                                                    'Rp. ${MoneyMaskedTextController(
                                                  initialValue: double.parse(
                                                      controller
                                                          .listAgunanLainnyaAnalisis[
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
                                                name: 'totalAgunanLainnya',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                readOnly: true,
                                                controller: controller
                                                        .totalAgunanLainnya =
                                                    MoneyMaskedTextController(
                                                  initialValue: double.parse(controller
                                                      .listAgunanLainnyaAnalisis
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
                        const SizedBox(
                          height: 150,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: primaryColor.withOpacity(0.95),
                  height: 145,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              'Grand Total :',
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            child: FormBuilderTextField(
                              name: 'grandTotal',
                              readOnly: true,
                              textAlign: TextAlign.right,
                              controller: controller.grandTotal,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                              decoration: const InputDecoration(
                                prefixText: 'Rp .',
                                prefixStyle: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                                // disable underline
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GFButton(
                              onPressed: () {
                                controller.hitungGrandTotal();
                              },
                              text: 'Hitung',
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GFButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                            .fields['grandTotal']!.value ==
                                        null ||
                                    controller.formKey.currentState!
                                            .fields['grandTotal']!.value ==
                                        0 ||
                                    controller.formKey.currentState!
                                            .fields['grandTotal']!.value ==
                                        '0') {
                                  Get.snackbar(
                                    'Error',
                                    'Hitung Grand Total Terlebih Dahulu',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    icon: const Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  showBarModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Center(
                                                  child: Text(
                                                    'Yeay berhasil mendapatkan',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ),
                                                const Center(
                                                  child: Text(
                                                    'CRR Agunan 🎉🎉🎉',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Center(
                                                  child: Lottie.asset(
                                                    'assets/images/home/agunan_promp.zip',
                                                    frameRate: FrameRate.max,
                                                    height: 280,
                                                    repeat: true,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const Text(
                                                        'Gagal memuat animasi',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Kredit yang diajukan',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                FormBuilderTextField(
                                                  name: 'kreditYangDiajukan',
                                                  readOnly: true,
                                                  controller: controller
                                                          .kreditYangDiajukan =
                                                      MoneyMaskedTextController(
                                                    initialValue: double.parse(
                                                        data[7]
                                                            .inputKeuangan
                                                            .kreditDiusulkan),
                                                    thousandSeparator: '.',
                                                    decimalSeparator: '',
                                                    precision: 0,
                                                  ),
                                                  decoration:
                                                      const InputDecoration(
                                                    prefixText: 'Rp .',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Total Agunan (Liquidasi)',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                FormBuilderTextField(
                                                  name: 'grandTotalAnalisis',
                                                  readOnly: true,
                                                  controller:
                                                      controller.grandTotal,
                                                  decoration:
                                                      const InputDecoration(
                                                    prefixText: 'Rp .',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Rasio Agunan / Kredit',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                FormBuilderTextField(
                                                  name: 'ratio',
                                                  textAlign: TextAlign.right,
                                                  readOnly: true,
                                                  controller:
                                                      controller.ratioAgunan,
                                                  decoration:
                                                      const InputDecoration(
                                                    suffixText: '%',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GFButton(
                                              onPressed: () {
                                                controller.hitungRatioDanCrr();
                                              },
                                              text: 'Hitung',
                                              color: primaryColor,
                                              size: GFSize.LARGE,
                                              fullWidthButton: true,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Total CRR:',
                                                        style: GoogleFonts
                                                            .spaceGrotesk(
                                                          fontSize: 35,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child:
                                                          FormBuilderTextField(
                                                        name: 'crrAgunan',
                                                        readOnly: true,
                                                        decoration:
                                                            const InputDecoration(
                                                          // Disable underline
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        controller: controller
                                                            .crrAgunan,
                                                        style: GoogleFonts
                                                            .spaceGrotesk(
                                                          fontSize: 35,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GFButton(
                                              onPressed: () {
                                                controller.saveAnalisaAgunan(
                                                    data[7].id);
                                                // controller
                                                //     .patchProgressBar(data[7].id);
                                                Get.back();
                                                Get.back();
                                                Get.back();
                                              },
                                              text: 'Simpan',
                                              color: primaryColor,
                                              size: GFSize.LARGE,
                                              fullWidthButton: true,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              text: 'Analisa',
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
