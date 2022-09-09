// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/modules/debitur_detail_banget/controllers/debitur_detail_banget_controller.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class DebiturListView extends GetView<DebiturRealController> {
  DebiturListView({Key? key}) : super(key: key);

  final foreignCont = Get.put(DebiturDetailBangetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => controller.loadingFetch.value
            ? Container()
            : FloatingActionButton(
                onPressed: () => controller.filterDebtor(),
                child: const Icon(Icons.search),
              ),
      ),
      appBar: AppBar(
        title: const Text('Cari Debitur'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'List Debitur',
              style: GoogleFonts.adventPro(
                  fontSize: 30,
                  color: secondaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Search bar to filter list

            const SizedBox(height: 16),
            Obx(
              () => Expanded(
                child: controller.loadingFetch.value
                    ? Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: primaryColor,
                          size: 50,
                        ),
                      )
                    : controller.selectedDebtor.isEmpty
                        ? Center(
                            child: EmptyWidget(
                              image: null,
                              packageImage: PackageImage.Image_1,
                              title: 'No Debitur',
                              subTitle: 'Silahkan cari debitur',
                              titleTextStyle: const TextStyle(
                                fontSize: 22,
                                color: Color(0xff9da9c7),
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: const TextStyle(
                                fontSize: 14,
                                color: Color(0xffabb8d6),
                              ),
                            ),
                          )
                        : GetBuilder<DebiturRealController>(
                            init: controller,
                            builder: (_) => ListView.separated(
                              itemCount: controller.selectedDebtor.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (_, index) {
                                final debtor = controller.selectedDebtor[index];
                                return Container(
                                  color: secondaryColor,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              // Show first letter of name
                                              child: Text(
                                                debtor.peminjam1!
                                                    .substring(0, 1),
                                                style: const TextStyle(
                                                  color: secondaryColor,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                                debtor.peminjam1.toString(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: primaryColor)),
                                            subtitle: Text(
                                                debtor.bidangUsaha.toString()),
                                            trailing: const Icon(
                                              Icons.keyboard_arrow_right,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                        DetailDebitur(debtor: debtor),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailDebitur extends StatelessWidget {
  DetailDebitur({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  final controller = Get.put(DebiturRealController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      child: Obx(
        () => controller.loadingFetch.value
            ? const SizedBox()
            : ExpansionTile(
                title: const Text('Detail Debitur'),
                children: [
                  // Detail Debitur
                  ExpansionTile(
                    leading: const Icon(Icons.people),
                    title: const Text(
                      'Data Pribadi Debitur',
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.remove_red_eye),
                                label: const Text(
                                  "Lihat Data",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.DEBITUR_DETAIL_BANGET,
                                    arguments: debtor.id,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.edit),
                                label: const Text(
                                  "Edit Debitur",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.DEBITUR_EDIT,
                                      arguments: debtor);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Analisa Kuantitatif
                  ExpansionTile(
                    title: const Text('Analisa Kuantitatif'),
                    leading: const Icon(
                      Icons.attach_money,
                    ),
                    children: [
                      // Neraca
                      ExpansionTile(
                        title: const Text('1. Neraca'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                // check if neraca is not empty
                                debtor.inputNeraca != null
                                    ? const SizedBox()
                                    : Expanded(
                                        child: OutlinedButton.icon(
                                          icon: const Icon(
                                              FontAwesomeIcons.chartLine),
                                          label: const Text(
                                            "Input Neraca",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.blueGrey,
                                          ),
                                          onPressed: () {
                                            Get.toNamed(Routes.INPUT_NERACA,
                                                // Send debtor id to input keuangan page
                                                arguments: debtor.id);
                                          },
                                        ),
                                      ),
                                //check if neraca is empty
                                debtor.inputNeraca == null
                                    ? const SizedBox()
                                    : Expanded(
                                        child: OutlinedButton.icon(
                                          icon:
                                              const Icon(FontAwesomeIcons.eye),
                                          label: const Text(
                                            "Lihat Neraca",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.deepOrange,
                                          ),
                                          onPressed: () {
                                            Get.toNamed(Routes.LIHAT_NERACA,
                                                // Send debtor id to input keuangan page
                                                arguments: debtor.inputNeraca);
                                          },
                                        ),
                                      ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    icon: const Icon(FontAwesomeIcons.pencil),
                                    label: const Text(
                                      "Edit Neraca",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.green,
                                    ),
                                    onPressed: () {
                                      Get.toNamed(Routes.EDIT_NERACA,
                                          // Send debtor id to input keuangan page
                                          arguments: debtor.inputNeraca);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Rugi Laba
                      ExpansionTile(
                        title: const Text('2. Rugi Laba'),
                        children: [
                          OutlinedButton.icon(
                            icon: const Icon(FontAwesomeIcons.amazon),
                            label: const Text(
                              "Input Rugi Laba",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.RUGI_LABA,
                                  // Send ID neraca to input rugi laba page
                                  arguments: debtor);
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
