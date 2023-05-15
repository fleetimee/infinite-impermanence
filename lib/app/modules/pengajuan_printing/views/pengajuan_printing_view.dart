import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_agunan_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_bisnis_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_gallery_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_inputan_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_karakter_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_keuangan_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_others_section.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_usaha_section.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengajuan_printing_controller.dart';

class PengajuanPrintingView extends GetView<PengajuanPrintingController> {
  const PengajuanPrintingView({Key? key}) : super(key: key);

  final String photoUrl =
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
              : const Scrollbar(
                  child: SingleChildScrollView(
                    child: PengajuanPrintingList(),
                  ),
                ),
        ),
      ),
    );
  }
}

class PengajuanPrintingList extends StatelessWidget {
  const PengajuanPrintingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrintInputanSection(),
          SizedBox(height: 25),
          PrintKeuanganSection(),
          SizedBox(height: 25),
          PrintKarakterSection(),
          SizedBox(height: 25),
          PrintBisnisSection(),
          SizedBox(height: 25),
          PrintUsahaSection(),
          SizedBox(height: 25),
          PrintAgunanSection(),
          SizedBox(height: 25),
          PrintAgunanGallery(),
          SizedBox(height: 25),
          PrintOtherSection(),
        ],
      ),
    );
  }
}
