import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitView extends GetView<ReviewerSubmitController> {
  const ReviewerSubmitView({Key? key}) : super(key: key);

  String formatDatetime(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  void getRating() {}

  Future<List<String>> _getItems() async {
    final httpClient = http.Client();
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}firebase-remote/pengutus'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*'
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('data: $data');
        var uid = data['data'].map<String>((e) => e['uid'].toString()).toList();
        var displayName = data['data']
            .map<String>((e) => e['displayName'].toString())
            .toList();

        var combined = displayName
            .map<String>((e) => '$e : ${uid[displayName.indexOf(e)]}')
            .toList();

        return combined;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: FormBuilder(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GFTypography(
                    text: 'Review Pengajuan',
                    type: GFTypographyType.typo1,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Text(
                      controller.isProcessing.value
                          ? 'Loading...'
                          : 'Pengajuan ini berisikan calon debitur dengan nama ${controller.insightDebitur.value.peminjam1}, dengan no pengajuan ${controller.pengajuan.id} yang diajukan pada tanggal ${formatDatetime(controller.pengajuan.tglSubmit!)} oleh analis Novian',
                      style: Theme.of(context).textTheme.caption?.merge(
                            const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tanggal Review :',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderDateTimePicker(
                    name: 'tglReview',
                    inputType: InputType.date,
                    format: DateFormat('dd-MM-yyyy'),
                    resetIcon: const Icon(Icons.clear),
                    decoration: const InputDecoration(
                      hintText: 'Pilih Tanggal Review',
                      prefixIcon: Icon(Icons.date_range),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      border: // no border
                          InputBorder.none,
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Ditujukan Kepada :',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderSearchableDropdown<String>(
                    name: 'reviewers',
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    asyncItems: (filter) {
                      return _getItems();
                    },
                    clearButtonProps: const ClearButtonProps(
                      icon: Icon(Icons.clear),
                      color: Colors.red,
                    ),
                    itemAsString: (item) {
                      // hide the uid from screen
                      return item.split(':')[0];
                    },
                    onChanged: (value) {
                      debugPrint('value: $value');
                    },
                    decoration: const InputDecoration(
                      border: // no border
                          InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Pilih Pemutus',
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Berikut adalah detail pengajuan yang diajukan :',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.grey[200],
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 6,
                                  child: GFTypography(
                                    text: 'Hasil Inputan Debitur',
                                    type: GFTypographyType.typo3,
                                    showDivider: false,
                                  ),
                                ),
                                Expanded(
                                  child: Obx(
                                    () => Icon(
                                      controller.isInputanRead.value == true
                                          ? Icons.check_box
                                          : Icons.close,
                                      color:
                                          controller.isInputanRead.value == true
                                              ? Colors.green
                                              : Colors.transparent,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Ini merupakan hasil inputan debitur yang telah diinputkan oleh analis, dan akan di review oleh anda sebagai reviewer.',
                              style: Theme.of(context).textTheme.caption?.merge(
                                    const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.isProcessing.value
                                          ? 'Loading'
                                          : controller
                                              .insightDebitur.value.peminjam1!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.merge(
                                            const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          'Rating',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.merge(
                                                const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: GFColors.SUCCESS,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          controller.isProcessing.value
                                              ? 'Loading'
                                              : ': ${controller.rating.value} - ${controller.keterangan.value}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.merge(
                                                const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          'Score ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.merge(
                                                const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: GFColors.SUCCESS,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          controller.isProcessing.value
                                              ? 'Loading'
                                              : ': ${controller.totalCrr.value}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.merge(
                                                const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const SizedBox(width: 5),
                                        Obx(
                                          () => controller.isProcessing.value
                                              ? const Chip(
                                                  label: Text('Loading...'))
                                              : Chip(
                                                  label: Text(controller
                                                      .insightDebitur
                                                      .value
                                                      .jenisUsaha
                                                      .toString())),
                                        ),
                                        const SizedBox(width: 5),
                                        Obx(
                                          () => controller.isProcessing.value
                                              ? const Chip(
                                                  label: Text('Loading...'))
                                              : controller.insightDebitur.value
                                                          .inputRugiLaba ==
                                                      null
                                                  ? const SizedBox.shrink()
                                                  : double.parse(controller
                                                              .insightDebitur
                                                              .value
                                                              .inputRugiLaba!
                                                              .omzet
                                                              .toString()) <=
                                                          100000000
                                                      ? const Chip(
                                                          label: Text('Mikro'))
                                                      : const Chip(
                                                          label: Text('Kecil')),
                                        ),
                                        const SizedBox(width: 5),
                                        const Chip(label: Text('Tetap')),
                                        const SizedBox(width: 5),
                                        Obx(
                                          () => controller.isProcessing.value
                                              ? const Chip(
                                                  label: Text('Loading...'))
                                              : controller.insightDebitur.value
                                                          .inputKeuangan ==
                                                      null
                                                  ? const SizedBox.shrink()
                                                  : double.parse(controller
                                                              .insightDebitur
                                                              .value
                                                              .inputKeuangan!
                                                              .kreditDiusulkan
                                                              .toString()) >
                                                          25000000
                                                      ? const Chip(
                                                          label:
                                                              Text('Kur Kecil'))
                                                      : const Chip(
                                                          label: Text(
                                                              'Kur Mikro')),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            GFItemsCarousel(
                              rowCount: 3,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/home/keuangan_slider.jpg',
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: const Text(
                                                'Keuangan',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black54,
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                              () => controller
                                                      .isProcessing.value
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaKeuangan ==
                                                          null
                                                      ? const Text(
                                                          'N/A',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      : Text(
                                                          controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaKeuangan!
                                                              .totalCrrKeuangan
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/home/karakter_slider.jpg',
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: const Text(
                                                'Karakter',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black54,
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                              () => controller
                                                      .isProcessing.value
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaKarakter ==
                                                          null
                                                      ? const Text(
                                                          'N/A',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      : Text(
                                                          controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaKarakter!
                                                              .totalCrrKarakter
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/home/bisnis_slider.jpg',
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: const Text(
                                                'Bisnis',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black54,
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                              () => controller
                                                      .isProcessing.value
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaBisnis ==
                                                          null
                                                      ? const Text(
                                                          'N/A',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      : Text(
                                                          double.parse(controller
                                                                  .insightDebitur
                                                                  .value
                                                                  .analisaBisnis!
                                                                  .hasilCrrBisnis
                                                                  .toString())
                                                              .toStringAsFixed(
                                                                  1),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/home/usaha_slider.jpg',
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: const Text(
                                                'Jenis Usaha',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black54,
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                              () => controller
                                                      .isProcessing.value
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaJenisUsaha ==
                                                          null
                                                      ? const Text(
                                                          'N/A',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      : Text(
                                                          double.parse(controller
                                                                  .insightDebitur
                                                                  .value
                                                                  .analisaJenisUsaha!
                                                                  .totalCrrUsaha
                                                                  .toString())
                                                              .toStringAsFixed(
                                                                  1),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/home/agunan_slider.jpg',
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: const Text(
                                                'Agunan',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black54,
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                              () => controller
                                                      .isProcessing.value
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : controller
                                                              .insightDebitur
                                                              .value
                                                              .analisaAgunan ==
                                                          null
                                                      ? const Text(
                                                          'N/A',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      : Text(
                                                          double.parse(controller
                                                                  .insightDebitur
                                                                  .value
                                                                  .analisaAgunan!
                                                                  .totalCrrAgunan
                                                                  .toString())
                                                              .toStringAsFixed(
                                                                  1),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.INPUT_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Hasil Inputan',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.USULAN_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Draft Usulan',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.USULAN_BARU_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Draft Usulan Baru',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.PUTUSAN_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Draft Putusan',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            FormBuilderCheckbox(
                              name: 'inputan',
                              onChanged: (value) {
                                controller.isInputanRead.value = value!;
                              },
                              initialValue: controller.isInputanRead.value,
                              title: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Saya sudah melihat inputan debitur',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              validator: FormBuilderValidators.equal(
                                true,
                                errorText: 'Saya sudah melihat inputan debitur',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  KeuanganCard(controller: controller),
                  const SizedBox(height: 20),
                  KarakterCard(controller: controller),
                  const SizedBox(height: 20),
                  BisnisCard(controller: controller),
                  const SizedBox(height: 20),
                  UsahaCard(controller: controller),
                  const SizedBox(height: 20),
                  AgunanCard(controller: controller),
                  const SizedBox(height: 20),
                  Text(
                    'Untuk beberapa parameter dibawah ini hanya untuk tambahan saja dan tidak masuk kedalam penilaian :',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  GalleryCard(controller: controller),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AgunanCard extends StatelessWidget {
  const AgunanCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Agunan Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isAgunanPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isAgunanPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan agunan debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.AGUNAN_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Summary Agunan',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              FormBuilderRadioGroup(
                name: 'agunan',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isAgunanPressed.value = true;
                },
                decoration: InputDecoration(
                  labelText: 'Apakah bisnis debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
                validator: FormBuilderValidators.required(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UsahaCard extends StatelessWidget {
  const UsahaCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Jenis Usaha Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isUsahaPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isUsahaPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ini merupakan rekapan jenis usaha debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.USAHA_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Summary Jenis Usaha',
                color: primaryColor,
                shape: GFButtonShape.pills,
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderRadioGroup(
                name: 'usaha',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isUsahaPressed.value = true;
                },
                decoration: InputDecoration(
                  labelText: 'Apakah jenis usaha debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
                validator: FormBuilderValidators.required(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BisnisCard extends StatelessWidget {
  const BisnisCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Bisnis Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isBisnisPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isBisnisPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan bisnis debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.BISNIS_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Summary Bisnis',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderRadioGroup(
                name: 'bisnis',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isBisnisPressed.value = true;
                },
                decoration: InputDecoration(
                  labelText: 'Apakah bisnis debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
                validator: FormBuilderValidators.required(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KarakterCard extends StatelessWidget {
  const KarakterCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Karakter Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isKarakterPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isKarakterPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan karakter debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.KARAKTER_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Summary Karakter',
                color: primaryColor,
                shape: GFButtonShape.pills,
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              FormBuilderRadioGroup(
                name: 'karakter',
                wrapAlignment: WrapAlignment.center,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  label: const Text('Apakah karakter debitur ini layak?'),
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
                onChanged: (value) {
                  controller.isKarakterPressed.value = true;
                },
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeuanganCard extends StatelessWidget {
  const KeuanganCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Keuangan Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isKeuanganPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isKeuanganPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan keuangan debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.NERACA_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Neraca',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.RUGILABA_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Laporan Keuangan',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.KEUANGAN_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Summary Keuangan',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              Center(
                child: FormBuilderRadioGroup(
                  name: 'keuangan',
                  wrapAlignment: WrapAlignment.center,
                  onChanged: (value) {
                    // if clicked then change isPressed to true
                    controller.isKeuanganPressed.value = true;
                  },
                  decoration: InputDecoration(
                    labelText: 'Apakah keuangan debitur ini layak?',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelStyle: Theme.of(context).textTheme.caption!.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                  ),
                  options: const [
                    FormBuilderFieldOption(
                      value: true,
                      child: Text('👍 Ya'),
                    ),
                    FormBuilderFieldOption(
                      value: false,
                      child: Text('👎 Tidak'),
                    ),
                  ],
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  const GalleryCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Gallery Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isGalleryRead.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isGalleryRead.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan sekumpulan dokumen penunjang seperti foto dan dokumen lainnya yang sudah diunggah oleh tim analis',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 20),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_IMAGE,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Gallery',
                color: primaryColor,
                shape: GFButtonShape.pills,
                icon: const Icon(
                  Icons.image,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "     ATAU     ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_FILE,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Dokumen',
                icon: const Icon(
                  Icons.picture_as_pdf,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              FormBuilderCheckbox(
                name: 'berkas',
                onChanged: (value) {
                  controller.isGalleryRead.value = value!;
                },
                initialValue: controller.isGalleryRead.value,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Saya sudah melihat berkas ini',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: 'Saya sudah melihat berkas ini',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
