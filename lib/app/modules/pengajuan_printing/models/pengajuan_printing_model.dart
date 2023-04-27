import 'package:akm/app/modules/pengajuan_printing/controllers/pengajuan_printing_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrintCardPengajuanDetail {
  final IconData icon;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  PrintCardPengajuanDetail({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

final List<PrintCardPengajuanDetail> inputanPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.description,
    title: 'Hasil Inputan',
    subtitle: 'Cetak Hasil Inputan',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(
        Routes.INPUT_PRINT,
        arguments: controller.insightDebitur.value,
      );
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.drafts,
    title: 'Memorandum Pengusulan Komite Kredit',
    subtitle: 'Cetak Memorandum Pengusulan Komite Kredit',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.USULAN_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.library_add,
    title: 'Memorandum Pengusulan Komite Kredit',
    subtitle: 'Cetak Memorandum Pengusulan Komite Kredit',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.USULAN_BARU_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.gavel,
    title: 'Putusan Kredit',
    subtitle: 'Cetak Putusan Kredit',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.PUTUSAN_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
];

final List<PrintCardPengajuanDetail> keuanganPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.request_quote,
    title: 'Laporan Keuangan',
    subtitle: 'Cetak Laporan Keuangan',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.RUGILABA_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.local_police,
    title: 'Keterangan Neraca',
    subtitle: 'Cetak Keterangan Neraca',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.NERACA_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.savings,
    title: 'Analisa Keuangan',
    subtitle: 'Cetak Analisa Keuangan',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.KEUANGAN_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
];

final List<PrintCardPengajuanDetail> karakterPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.face_4_outlined,
    title: 'Analisa Karakter',
    subtitle: 'Cetak Analisa Karakter',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.KARAKTER_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
];

final List<PrintCardPengajuanDetail> bisnisPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.business_center_sharp,
    title: 'Analisa Bisnis',
    subtitle: 'Cetak Analisa Bisnis',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.BISNIS_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
];

final List<PrintCardPengajuanDetail> usahaPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.shopping_bag,
    title: 'Analisa Jenis Usaha',
    subtitle: 'Cetak Analisa Jenis Usaha',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.USAHA_PRINT,
          arguments: controller.insightDebitur.value);
    },
  )
];

final List<PrintCardPengajuanDetail> agunanPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.landscape,
    title: 'Analisa Agunan',
    subtitle: 'Cetak Analisa Agunan',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.AGUNAN_PRINT,
          arguments: controller.insightDebitur.value);
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.forest,
    title: 'Detail Agunan',
    subtitle: 'Lihat Detail Agunan',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.DETAIL_AGUNAN,
          arguments: controller.insightDebitur.value);
    },
  ),
];

final List<PrintCardPengajuanDetail> galleryPrintList = [
  PrintCardPengajuanDetail(
    icon: Icons.image,
    title: 'Gallery',
    subtitle: 'Lihat Foto Gallery Debitur',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.GALLERY_IMAGE,
          arguments: controller.insightDebitur.value);
    },
  ),
  PrintCardPengajuanDetail(
    icon: Icons.image,
    title: 'Dokumen',
    subtitle: 'Lihat Dokumen Debitur',
    onTap: () {
      final controller = Get.find<PengajuanPrintingController>();

      Get.toNamed(Routes.GALLERY_IMAGE,
          arguments: controller.insightDebitur.value);
    },
  ),
];
