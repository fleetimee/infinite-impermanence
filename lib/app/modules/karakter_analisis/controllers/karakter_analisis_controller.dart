// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import '../../../service/analisa_karakter_service.dart';

class KarakterAnalisisController extends GetxController {
  var nilaiUmur = TextEditingController();
  var scoreUmur = 0.0.obs;
  var finalScoreUmur = 0.0.obs;
  var crrUmur = 0.0.obs;

  var pendidikanInput = ''.obs;
  var scorePendidikan = 0.0.obs;
  var crrPendidikan = 0.0.obs;

  var lamanyaBerusaha = TextEditingController();
  var scorePengalaman = 0.0.obs;
  var crrPengalaman = 0.0.obs;

  var uletDalamBisnis = 0.0.obs;
  var keteranganUletDalamBisnis = TextEditingController();
  var crrUlet = 0.0.obs;

  var kakuFleksibel = 0.0.obs;
  var keteranganKakuFleksibel = TextEditingController();
  var crrKaku = 0.0.obs;

  var inovatifKreatif = 0.0.obs;
  var keteranganInovatifKreatif = TextEditingController();
  var crrInovatif = 0.0.obs;

  var jujur = 0.0.obs;
  var keteranganJujur = TextEditingController();
  var crrJujur = 0.0.obs;

  final formKey = GlobalKey<FormBuilderState>();

  var deskripsi = TextEditingController();

  final resultCrr = 0.0.obs;

  var debiturId = TextEditingController();

  void saveAnalisaKarakter() {
    final api = AnalisaKarakterService();

    final data = {
      'nilai_umur': nilaiUmur.text,
      'score_umur': finalScoreUmur.value,
      'crr_umur': crrUmur.value,
      'score_pendidikan': scorePendidikan.value,
      'crr_pendidikan': crrPendidikan.value,
      'nilai_lamanya_berusaha': lamanyaBerusaha.text,
      'score_lamanya_berusaha': scorePengalaman.value,
      'crr_lamanya_berusaha': crrPengalaman.value,
      'score_ulet': uletDalamBisnis.value,
      'keterangan_ulet': keteranganUletDalamBisnis.text,
      'crr_ulet': crrUlet.value,
      'score_kaku': kakuFleksibel.value,
      'keterangan_kaku': keteranganKakuFleksibel.text,
      'crr_kaku': crrKaku.value,
      'score_kreatif': inovatifKreatif.value,
      'keterangan_kreatif': keteranganInovatifKreatif.text,
      'crr_kreatif': crrInovatif.value,
      'score_kejujuran': jujur.value,
      'keterangan_kejujuran': keteranganJujur.text,
      'crr_kejujuran': crrJujur.value,
      'deskripsi_karakter': deskripsi.text,
      'total_crr_karakter': resultCrr.value,
      'debitur': debiturId.text,
    };

    api.addAnalisaKarakter(data);

    update();
  }

  void result() {
    hitungCrrUmur();
    hitungCrrPendidikan();
    hitungLamanyaBerusaha();
    hitungUletDalamBisnis();
    hitungKakuFleksibel();
    hitungInovatifKreatif();
    hitungJujur();

    final hitungSemua = crrUmur.value +
        crrPendidikan.value +
        crrPengalaman.value +
        crrUlet.value +
        crrKaku.value +
        crrInovatif.value +
        crrJujur.value;

    resultCrr.value = showFewerDecimalPplaces(hitungSemua);

    debugPrint('TOTAL CRR: ${resultCrr.value}');
  }

  //
  increaseDecimalPlaces(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  showFewerDecimalPplaces(double value) {
    return double.parse(value.toStringAsFixed(1));
  }

  void hitungCrrUmur() {
    final parseUmur = int.parse(nilaiUmur.text);

    // Umur 21 - 30
    if (parseUmur > 20) {
      if (parseUmur <= 30) {
        final firstCount = parseUmur - 21;
        final secondCount = firstCount / 10 * 10 + 61;
        scoreUmur.value = secondCount;
      } else {
        scoreUmur.value = 0.0;
      }
      debugPrint('Score Umur: ${scoreUmur.value}');

      final hitungCrr = scoreUmur.value * 0.05;
      finalScoreUmur.value = scoreUmur.value;
      crrUmur.value = showFewerDecimalPplaces(hitungCrr);
    } else {
      scoreUmur.value = 0.0;
    }

    // Umur 31 - 40
    if (parseUmur > 30) {
      if (parseUmur <= 40) {
        final firstCount = parseUmur - 31;
        final secondCount = firstCount / 10 * 10 + 71;
        scoreUmur.value = secondCount;
      } else {
        scoreUmur.value = 0.0;
      }
      debugPrint('Score Umur: ${scoreUmur.value}');
      finalScoreUmur.value = scoreUmur.value;
      crrUmur.value = showFewerDecimalPplaces(scoreUmur.value * 0.05);
    } else {
      scoreUmur.value = 0.0;
    }

    // Umur 41 - 50
    if (parseUmur > 40) {
      if (parseUmur <= 50) {
        final firstCount = parseUmur - 41;
        final secondCount = firstCount / 10 * 10 + 81;
        scoreUmur.value = secondCount;
      } else {
        scoreUmur.value = 0.0;
      }
      debugPrint('Score Umur: ${scoreUmur.value}');
      finalScoreUmur.value = scoreUmur.value;

      crrUmur.value = showFewerDecimalPplaces(scoreUmur.value * 0.05);
    } else {
      scoreUmur.value = 0.0;
    }

    // Umur 51 - 55
    if (parseUmur > 50) {
      if (parseUmur <= 55) {
        final firstCount = parseUmur - 51;
        final secondCount = firstCount / 10 * 10 + 71;
        scoreUmur.value = secondCount;
      } else {
        scoreUmur.value = 0.0;
      }
      debugPrint('Score Umur: ${scoreUmur.value}');
      finalScoreUmur.value = scoreUmur.value;

      crrUmur.value = showFewerDecimalPplaces(scoreUmur.value * 0.05);
    } else {
      scoreUmur.value = 0.0;
    }

    debugPrint('CRR UMUR: ${crrUmur.toString()}');
  }

  void hitungCrrPendidikan() {
    if (pendidikanInput.value == 'Tidak Sekolah') {
      scorePendidikan.value = 60.0;
    } else if (pendidikanInput.value == 'SD') {
      scorePendidikan.value = 70.0;
    } else if (pendidikanInput.value == 'SLTP') {
      scorePendidikan.value = 75.0;
    } else if (pendidikanInput.value == 'SLTA') {
      scorePendidikan.value = 80.0;
    } else if (pendidikanInput.value == 'D3') {
      scorePendidikan.value = 85.0;
    } else if (pendidikanInput.value == 'S1') {
      scorePendidikan.value = 90.0;
    } else if (pendidikanInput.value == 'S2') {
      scorePendidikan.value = 95.0;
    } else if (pendidikanInput.value == 'S3') {
      scorePendidikan.value = 95.0;
    }

    crrPendidikan.value = scorePendidikan.value * 0.10;

    debugPrint('Score Pendidikan: ${scorePendidikan.value.toString()}');
    debugPrint('CRR PENDIDIKAN: ${crrPendidikan.toString()}');
  }

  void hitungLamanyaBerusaha() {
    final parseLamanyaBerusaha = double.parse(lamanyaBerusaha.text);

    if (parseLamanyaBerusaha == 1.0) {
      scorePengalaman.value = 60.0;
    } else if (parseLamanyaBerusaha == 2.0) {
      scorePengalaman.value = 65.0;
    } else if (parseLamanyaBerusaha == 3.0) {
      scorePengalaman.value = 70.0;
    } else if (parseLamanyaBerusaha == 4.0) {
      scorePengalaman.value = 75.0;
    } else if (parseLamanyaBerusaha == 5.0) {
      scorePengalaman.value = 80.0;
    } else if (parseLamanyaBerusaha == 6.0) {
      scorePengalaman.value = 85.0;
    } else if (parseLamanyaBerusaha == 7.0) {
      scorePengalaman.value = 90.0;
    } else if (parseLamanyaBerusaha >= 8.0) {
      scorePengalaman.value = 95.0;
    }

    crrPengalaman.value = scorePengalaman.value * 0.20;

    debugPrint('Score Pengalaman: ${scorePengalaman.value.toString()}');
    debugPrint('CRR PENGALAMAN: ${crrPengalaman.toString()}');
  }

  void hitungUletDalamBisnis() {
    final hasil = uletDalamBisnis.value * 0.20;
    crrUlet.value = hasil;

    debugPrint('Score Ulet: ${uletDalamBisnis.value.toString()}');
    debugPrint('CRR ULET: ${crrUlet.toString()}');
  }

  void hitungKakuFleksibel() {
    final hasil = kakuFleksibel.value * 0.15;
    crrKaku.value = showFewerDecimalPplaces(hasil);

    debugPrint('Score Kaku: ${kakuFleksibel.value.toString()}');
    debugPrint('CRR KAKU: ${crrKaku.toString()}');
  }

  void hitungInovatifKreatif() {
    final hasil = showFewerDecimalPplaces(inovatifKreatif.value * 0.15);
    crrInovatif.value = hasil;

    debugPrint('Score Inovatif: ${inovatifKreatif.value.toString()}');
    debugPrint('CRR INOVATIF: ${crrInovatif.toString()}');
  }

  void hitungJujur() {
    final hasil = jujur.value * 0.15;
    crrJujur.value = showFewerDecimalPplaces(hasil);

    debugPrint('Score Jujur: ${jujur.value.toString()}');
    debugPrint('CRR JUJUR: ${crrJujur.toString()}');
  }

  final pendidikanList = [
    'Tidak Sekolah',
    'SD',
    'SLTP',
    'SLTA',
    'D3',
    'S1',
    'S2',
    'S3',
  ];
}
