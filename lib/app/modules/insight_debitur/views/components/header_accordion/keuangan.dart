// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class HeaderKeuangan extends StatelessWidget {
  HeaderKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final neracaController = Get.put(InputNeracaController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TabBar(
        controller: controller.tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: primaryColor,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.paypal,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Keuangan',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuNeraca extends StatelessWidget {
  MenuNeraca({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final neracaController = Get.put(InputNeracaController());

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
                'Neraca',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(
                () {
                  if (neracaController.isNeracaProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.inputNeraca == null) {
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
                  if (neracaController.isNeracaProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.inputNeraca != null
                            ? const SizedBox()
                            : Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.INPUT_NERACA,
                                        arguments:
                                            controller.insightDebitur.value.id);
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
                              ),
                        controller.insightDebitur.value.inputNeraca == null
                            ? const SizedBox()
                            : Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.LIHAT_NERACA,
                                        arguments: controller
                                            .insightDebitur.value.inputNeraca);
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
                        const SizedBox(
                          width: 10.0,
                        ),
                        controller.insightDebitur.value.inputNeraca == null
                            ? const SizedBox()
                            : Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.EDIT_NERACA,
                                        arguments: controller
                                            .insightDebitur.value.inputNeraca);
                                  },
                                  child: const Text(
                                    "Edit",
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
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}

class MenuRugiLaba extends StatelessWidget {
  MenuRugiLaba({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final rugiLabaController = Get.put(RugiLabaController());

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
                'Rugi / Laba',
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
                  if (rugiLabaController.isRugiLabaProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.inputRugiLaba == null) {
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
                  if (rugiLabaController.isRugiLabaProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        //Check if neraca is empty
                        controller.insightDebitur.value.inputNeraca == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Get.snackbar('Error', 'Dibilangin batu',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  },
                                  child: const Text(
                                    "Input Neraca terlebih dahulu",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : controller.insightDebitur.value.inputRugiLaba !=
                                    null
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.VIEW_RUGI_LABA,
                                                  arguments: controller
                                                      .insightDebitur.value);
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
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.EDIT_RUGI_LABA,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.RUGI_LABA,
                                            arguments: controller
                                                .insightDebitur.value);
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

class MenuInputKeuangan extends StatelessWidget {
  MenuInputKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final inputKeuanganController = Get.put(InputKeuanganController());

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
                'Input Keuangan',
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
                  if (inputKeuanganController.isInputKeuanganProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.inputKeuangan == null) {
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
                  if (inputKeuanganController.isInputKeuanganProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        //Check if neraca is empty
                        controller.insightDebitur.value.inputRugiLaba == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Get.snackbar('Error', 'Dibilangin batu',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  },
                                  child: const Text(
                                    "Input Rugi Laba terlebih dahulu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : controller.insightDebitur.value.inputKeuangan !=
                                    null
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.LIHAT_KEUANGAN,
                                                  arguments: controller
                                                      .insightDebitur.value);
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
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(Routes.EDIT_KEUANGAN,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.INPUT_KEUANGAN,
                                            arguments: controller
                                                .insightDebitur.value);
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

class MenuAnalisaKeuangan extends StatelessWidget {
  MenuAnalisaKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaKeuanganController = Get.put(KeuanganAnalisisController());

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
                'Analisa Keuangan',
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
                  if (analisaKeuanganController
                      .isKeuanganAnalisisProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaKeuangan ==
                        null) {
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
                  if (analisaKeuanganController
                      .isKeuanganAnalisisProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        //Check if neraca is empty
                        controller.insightDebitur.value.inputKeuangan == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Get.snackbar('Error', 'Dibilangin batu',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  },
                                  child: const Text(
                                    "Input Keuangan terlebih dahulu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : controller.insightDebitur.value.analisaKeuangan !=
                                    null
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(
                                                  Routes
                                                      .LIHAT_KEUANGAN_ANALISIS,
                                                  arguments: controller
                                                      .insightDebitur.value);
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
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueGrey,
                                            ),
                                            onPressed: () {
                                              Get.toNamed(
                                                  Routes.EDIT_KEUANGAN_ANALISIS,
                                                  arguments: controller
                                                      .insightDebitur.value);
                                            },
                                            child: const Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.KEUANGAN_ANALISIS,
                                            arguments: controller
                                                .insightDebitur.value);
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
