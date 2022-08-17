// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:get/get.dart';

class KarakterAnalisisController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final uletDalamBisnis = 0.0.obs;
  final kakuFleksibel = 0.0.obs;
  final inovatifKreatif = 0.0.obs;
  final jujur = 0.0.obs;
  final umur = 0.obs;
  final scorePendidikan = 0.obs;
  final scorePengalaman = 0.obs;

  final deskripsi = TextEditingController();
  final result = TextEditingController();

  final resultPendidikan = TextEditingController();
  final resultPengalaman = TextEditingController();
  final resultUlet = TextEditingController();
  final resultKaku = TextEditingController();
  final resultInovatif = TextEditingController();
  final resultJujur = TextEditingController();
  final resultCrr = 0.0.obs;

  void hitungCrr() {
    final pendidikan = scorePendidikan.value * 0.10;
    final pengalaman = scorePengalaman.value * 0.20;
    final ulet = uletDalamBisnis.value * 0.20;
    final kaku = kakuFleksibel.value * 0.15;
    final inovatif = inovatifKreatif.value * 0.15;
    final jujurDebitur = jujur.value * 0.15;

    resultPendidikan.text = '$pendidikan';
    resultPengalaman.text = '$pengalaman';
    resultUlet.text = '$ulet';
    resultKaku.text = '$kaku';
    resultInovatif.text = '$inovatif';
    resultJujur.text = '$jujurDebitur';

    final hasilCrr =
        pendidikan + pengalaman + ulet + kaku + inovatif + jujurDebitur;

    resultCrr.value = hasilCrr;
  }
}
