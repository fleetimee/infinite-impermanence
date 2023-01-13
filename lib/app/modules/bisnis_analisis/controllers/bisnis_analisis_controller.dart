// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/analisis_bisnis/save_analis_bisnis.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';

// 🌎 Project imports:

class BisnisAnalisisController extends GetxController {
  void patchProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) +
          0.1,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().patchProgressBar(body, id).then((resp) {
        debiturController.isDataLoading(false);
        debiturController.fetchOneDebitur(id);
      }, onError: (err) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void purgeProgressBar(int id) {
    final body = {
      'progress': double.parse(
              debiturController.insightDebitur.value.progress.toString()) -
          0.1,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().patchProgressBar(body, id).then((resp) {
        debiturController.isDataLoading(false);
        debiturController.fetchOneDebitur(id);
      }, onError: (err) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  String omzetDeskripsi = 'Berapa omzet penjualan per bulan?';
  String hargaBersaingDeskripsi =
      'Apakah harga dagangan bersaing dengan pedagang lain?';
  String persainganPasarDeskripsi =
      'Bagaimana dengan persaingan pasar? Apakah ketat atau biasa saja?';
  String lokasiUsaha =
      'Apakah lokasi usaha / berdagang berada di tempat yang strategis?';
  String kapasitasTerpasangDeskripsi =
      'Apakah kapasitas terpasang sudah sesuai dengan kebutuhan?';
  String kualitasProdukDeskripsi =
      'Bagaimana dengan kualitas produk dagangan? Apakah sudah sesuai dengan standar?';

  final formKey = GlobalKey<FormBuilderState>();

  final isAnalisaBisnisProcessing = false.obs;
  final debiturController = Get.put(InsightDebiturController());

  var debiturId = TextEditingController();

  final omzetPenjualan = 0.obs;
  var omzetPenjualanKeterangan = TextEditingController();
  final hargaBersaing = 0.obs;
  var hargaBersaingKeterangan = TextEditingController();
  final persainganPasar = 0.obs;
  var persainganPasarKeterangan = TextEditingController();
  final lokasiPasar = 0.obs;
  var lokasiPasarKeterangan = TextEditingController();
  final kapasitasTerpasan = 0.obs;
  var kapasitasTerpasanKeterangan = TextEditingController();
  final rating = 0.obs;
  var ratingKeterangan = TextEditingController();
  var deskripsi = TextEditingController();

  final resultOmzet = TextEditingController();
  final resultHarga = TextEditingController();
  final resultPersaingan = TextEditingController();
  final resultLokasi = TextEditingController();
  final resultKapasitas = TextEditingController();
  final resultRating = TextEditingController();

  final sumCrrBisnis = TextEditingController();
  final resultCrrBisnis = 0.obs;

  void saveAnalisisBisnis() {
    final data = {
      "nilai_omzet": omzetPenjualan.value,
      "keterangan_omzet": omzetPenjualanKeterangan.text,
      "nilai_harga_bersaing": hargaBersaing.value,
      "keterangan_harga_bersaing": hargaBersaingKeterangan.text,
      "nilai_persaingan": persainganPasar.value,
      "keterangan_persaingan": persainganPasarKeterangan.text,
      "nilai_lokasi_usaha": lokasiPasar.value,
      "keterangan_lokasi_usaha": lokasiPasarKeterangan.text,
      "nilai_produktivitas": kapasitasTerpasan.value,
      "keterangan_produktivitas": kapasitasTerpasanKeterangan.text,
      "nilai_kualitas": rating.value,
      "keterangan_kualitas": ratingKeterangan.text,
      "deskripsi_bisnis": deskripsi.text,
      "debitur": debiturId.text,
      "hasil_crr_bisnis": resultCrrBisnis.value,
    };

    try {
      isAnalisaBisnisProcessing(true);
      AnalisaBisnisProvider().deployAnalisaBisnis(data).then(
        (resp) {
          isAnalisaBisnisProcessing(false);
          debiturController.fetchOneDebitur(int.parse(debiturId.text));
          Future.delayed(const Duration(seconds: 1), () {
            patchProgressBar(int.parse(debiturId.text));
          });
          clearForm();
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            dialogBackgroundColor: primaryColor,
            titleTextStyle: GoogleFonts.poppins(
              color: secondaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            descTextStyle: GoogleFonts.poppins(
              color: secondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            title: 'Selamat 🎉',
            bodyHeaderDistance: 25,
            desc: 'Sudah menyelesaikan modul Bisnis',
            btnOkOnPress: () {},
          ).show();
        },
        onError: (e) {
          isAnalisaBisnisProcessing(false);
          Get.snackbar(
            'Error',
            e.toString(),
            backgroundColor: Colors.red,
            colorText: secondaryColor,
          );
        },
      );
    } catch (e) {
      isAnalisaBisnisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void updateAnalisaBisnis(id) async {
    final data = {
      "nilai_omzet": omzetPenjualan.value,
      "keterangan_omzet": omzetPenjualanKeterangan.text,
      "nilai_harga_bersaing": hargaBersaing.value,
      "keterangan_harga_bersaing": hargaBersaingKeterangan.text,
      "nilai_persaingan": persainganPasar.value,
      "keterangan_persaingan": persainganPasarKeterangan.text,
      "nilai_lokasi_usaha": lokasiPasar.value,
      "keterangan_lokasi_usaha": lokasiPasarKeterangan.text,
      "nilai_produktivitas": kapasitasTerpasan.value,
      "keterangan_produktivitas": kapasitasTerpasanKeterangan.text,
      "nilai_kualitas": rating.value,
      "keterangan_kualitas": ratingKeterangan.text,
      "deskripsi_bisnis": deskripsi.text,
      "debitur": debiturId.text,
      "hasil_crr_bisnis": resultCrrBisnis.value,
    };

    try {
      isAnalisaBisnisProcessing(true);
      AnalisaBisnisProvider().putAnalisaBisnis(id, data).then((resp) {
        isAnalisaBisnisProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil diperbarui',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }, onError: (e) {
        isAnalisaBisnisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isAnalisaBisnisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void deleteAnalisaBisnis(id) async {
    try {
      isAnalisaBisnisProcessing(true);
      AnalisaBisnisProvider().purgeAnalisaBisnis(id).then((resp) {
        isAnalisaBisnisProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        Future.delayed(const Duration(seconds: 1), () {
          purgeProgressBar(int.parse(debiturId.text));
        });
        clearForm();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          title: 'Sukses',
          bodyHeaderDistance: 25,
          desc: 'Data berhasil dihapus',
          dismissOnTouchOutside: false,
          btnOkOnPress: () {},
        ).show();
      }, onError: (e) {
        isAnalisaBisnisProcessing(false);
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isAnalisaBisnisProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void generateDeskripsi() {
    deskripsi.text =
        'Omset yang tercapai setiap bulan ${omzetPenjualanKeterangan.text}, harga yang ditawarkan kepada pelanggan ${hargaBersaingKeterangan.text}, persaingan usaha ${persainganPasarKeterangan.text.toLowerCase()}, lokasi usaha ${lokasiPasarKeterangan.text.toLowerCase()}, kapasitas terpasang ${kapasitasTerpasanKeterangan.text}, dan kualitas usaha yang ${ratingKeterangan.text.toLowerCase()}';
  }

  void clearForm() {
    omzetPenjualan.value = 0;
    omzetPenjualanKeterangan.text = '';
    hargaBersaing.value = 0;
    hargaBersaingKeterangan.text = '';
    persainganPasar.value = 0;
    persainganPasarKeterangan.text = '';
    lokasiPasar.value = 0;
    lokasiPasarKeterangan.text = '';
    kapasitasTerpasan.value = 0;
    kapasitasTerpasanKeterangan.text = '';
    rating.value = 0;
    ratingKeterangan.text = '';
    deskripsi.clear();
    resultCrrBisnis.value = 0;
  }

  void hasilHitungCrrBisnis() {
    final omzet = omzetPenjualan.value;
    final harga = hargaBersaing.value;
    final persaingan = persainganPasar.value;
    final lokasi = lokasiPasar.value;
    final kapasitas = kapasitasTerpasan.value;
    final ratingDebitur = rating.value;

    final sum = omzet + harga + persaingan + lokasi + kapasitas + ratingDebitur;
    final hasil = sum ~/ 6;

    resultOmzet.text = '$omzet';
    resultHarga.text = '$harga';
    resultPersaingan.text = '$persaingan';
    resultLokasi.text = '$lokasi';
    resultKapasitas.text = '$kapasitas';
    resultRating.text = '$ratingDebitur';

    sumCrrBisnis.text = '$sum';

    resultCrrBisnis.value = hasil;
  }

  final omzetList = '''[
    {"value": 50, "label": "s/d 50%"},
    {"value": 60, "label": "s/d 60%"},
    {"value": 70, "label": "s/d 70%"},
    {"value": 80, "label": "s/d 80%"},
    {"value": 90, "label": "s/d 90%"}
  ]''';

  final hargaBersaingList = '''[
    {"value": 50, "label": "Lebih mahal dari pesaing"},
    {"value": 60, "label": "Sama dengan pesaing"},
    {"value": 70, "label": "Lebih murah sd 5%"},
    {"value": 80, "label": "Lebih murah 5 - 10%"},
    {"value": 90, "label": "Lebih murah diatas 10%"}
  ]''';

  final persainganPasarList = '''[
    {"value": 50, "label": "Sangat ketat"},
    {"value": 60, "label": "Ketat"},
    {"value": 70, "label": "Cukup ketat"},
    {"value": 80, "label": "Kurang ketat"},
    {"value": 90, "label": "Tidak ketat"}
  ]''';

  final lokasiPasarList = '''[
    {"value": 50, "label": "Tidak strategis"},
    {"value": 60, "label": "Kurang strategis"},
    {"value": 70, "label": "Cukup strategis"},
    {"value": 80, "label": "Strategis"},
    {"value": 90, "label": "Sangat strategis"}
  ]''';

  final kapasitasTerpasanList = '''[
    {"value": 50, "label": "s/d 50%"},
    {"value": 60, "label": "s/d 60%"},
    {"value": 70, "label": "s/d 70%"},
    {"value": 80, "label": "s/d 80%"},
    {"value": 90, "label": "Lebih dari s/d 80%"}
  ]''';

  final ratingList = '''[
    {"value": 50, "label": "Jelek"},
    {"value": 60, "label": "Kurang Baik"},
    {"value": 70, "label": "Cukup"},
    {"value": 80, "label": "Baik"},
    {"value": 90, "label": "Sangat Baik"}
  ]''';

  @override
  void onClose() {
    debiturId.dispose();
    omzetPenjualanKeterangan.dispose();
    hargaBersaingKeterangan.dispose();
    persainganPasarKeterangan.dispose();
    lokasiPasarKeterangan.dispose();
    kapasitasTerpasanKeterangan.dispose();
    ratingKeterangan.dispose();
    deskripsi.dispose();
    resultOmzet.dispose();
    resultHarga.dispose();
    resultPersaingan.dispose();
    resultLokasi.dispose();
    resultKapasitas.dispose();
    resultRating.dispose();
    sumCrrBisnis.dispose();
    super.onClose();
  }
}
