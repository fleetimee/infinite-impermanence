// ignore_for_file: must_be_immutable

import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengajuan_printing_controller.dart';

class PengajuanPrintingView extends GetView<PengajuanPrintingController> {
  PengajuanPrintingView({Key? key}) : super(key: key);

  String photoUrl =
      'https://images.unsplash.com/photo-1494587351196-bbf5f29cff42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: const Text('Pengajuan Printing'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isProcessing.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            Card(
                              color: Colors.green[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Print",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Inputan",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.green[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.edit_note,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.description),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Hasil Inputan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.INPUT_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.drafts),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Draft Usulan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.USULAN_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.library_add),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Draft Usulan Baru"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.USULAN_BARU_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.gavel),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text(" Draft Putusan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.PUTUSAN_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Card(
                              color: Colors.red[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Print",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Analisa Keuangan",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.account_balance_wallet,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.request_quote),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Laporan Keuangan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.RUGILABA_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.local_police),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Keterangan Neraca"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.NERACA_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.savings),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Analisa Keuangan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.KEUANGAN_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Card(
                              color: Colors.teal[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Print",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Analisa Karakter",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.teal[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.settings_accessibility,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.face_4_outlined),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Analisa Karakter"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.KARAKTER_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Card(
                              color: Colors.deepOrange[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Print",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Analisa Bisnis",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.receipt_long,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.receipt),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Analisa Bisnis"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.BISNIS_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Card(
                              color: Colors.indigo[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Print",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Analisa Jenis Usaha",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.indigo[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.local_convenience_store,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.shopping_bag),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Analisa Jenis Usaha"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.USAHA_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Card(
                              color: Colors.lightBlueAccent[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Print",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Analisa Agunan",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.landslide,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.landscape),
                                ),
                                title: const Text("Cetak"),
                                subtitle: const Text("Analisa Agunan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.AGUNAN_PRINT,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.forest),
                                ),
                                title: const Text("Lihat"),
                                subtitle: const Text("Detail Agunan"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.DETAIL_AGUNAN,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.query_stats,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Card(
                              color: Colors.amber[100],
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Lihat",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent[400],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.photo_library),
                                ),
                                title: const Text("Lihat"),
                                subtitle: const Text("Foto Gallery"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.GALLERY_IMAGE,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.picture_as_pdf),
                                ),
                                title: const Text("Lihat"),
                                subtitle: const Text("File Dokumen"),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.GALLERY_FILE,
                                        arguments:
                                            controller.insightDebitur.value);
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
