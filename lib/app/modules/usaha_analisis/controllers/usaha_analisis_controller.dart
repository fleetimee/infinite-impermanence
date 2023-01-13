// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/analisis_jenis_usaha/save_analis_jenis_usaha.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/service/debtor_service.dart';

// 🌎 Project imports:

class UsahaAnalisisController extends GetxController {
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

  String jenisUsahaDeskripsi =
      'Penilaian jenis usaha, data diambil otomatis dari saat penginputan pertama debitur. Untuk melihat nilainya tinggal tekan tombol Lihat Hasil.';

  final formKey = GlobalKey<FormBuilderState>();

  final isAnalisaUsahaProcessing = false.obs;

  final debiturController = Get.put(InsightDebiturController());

  var jenisUsaha = TextEditingController();
  var crrJenisUsaha = TextEditingController();
  var debiturId = TextEditingController();

  @override
  void onReady() {
    hitungCrrUsaha();
    super.onReady();
  }

  void saveAnalisaUsaha() {
    final data = {
      'jenis_usaha': jenisUsaha.text,
      'total_crr_usaha': crrJenisUsaha.text,
      'debitur': debiturId.text,
    };

    try {
      isAnalisaUsahaProcessing(true);
      AnalisaJenisUsahaProvider().deployAnalisaJenisUsaha(data).then((resp) {
        isAnalisaUsahaProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        Future.delayed(const Duration(seconds: 1), () {
          patchProgressBar(int.parse(debiturId.text));
        });
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
          desc: 'Sudah menyelesaikan modul Jenis Usaha',
          btnOkOnPress: () {},
        ).show();
      }, onError: (err) {
        isAnalisaUsahaProcessing(false);
        Get.snackbar(
          'Gagal',
          'Gagal Menyimpan Analisa Usaha',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAnalisaUsahaProcessing(false);
      Get.snackbar(
        'Gagal',
        'Gagal Menyimpan Analisa Usaha',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateAnalisaUsaha(id) {
    final data = {
      'jenis_usaha': jenisUsaha.text,
      'total_crr_usaha': crrJenisUsaha.text,
      'debitur': debiturId.text,
    };

    try {
      isAnalisaUsahaProcessing(true);
      AnalisaJenisUsahaProvider().putAnalisaJenisUsaha(id, data).then((resp) {
        isAnalisaUsahaProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        Get.snackbar(
          'Sukses',
          'Berhasil Memperbarui Analisa Usaha',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isAnalisaUsahaProcessing(false);
        Get.snackbar(
          'Gagal',
          'Gagal Memperbarui Analisa Usaha',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAnalisaUsahaProcessing(false);
      Get.snackbar(
        'Gagal',
        'Gagal Memperbarui Analisa Usaha',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void deleteAnalisaUsaha(id) {
    try {
      isAnalisaUsahaProcessing(true);
      AnalisaJenisUsahaProvider().purgeAnalisaUsaha(id).then((resp) {
        isAnalisaUsahaProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        Future.delayed(const Duration(seconds: 1), () {
          purgeProgressBar(int.parse(debiturId.text));
        });
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
      }, onError: (err) {
        isAnalisaUsahaProcessing(false);
        Get.snackbar(
          'Gagal',
          'Gagal Menghapus Analisa Usaha',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isAnalisaUsahaProcessing(false);
      Get.snackbar(
        'Gagal',
        'Gagal Menghapus Analisa Usaha',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void hitungCrrUsaha() async {
    if (jenisUsaha.text == 'Pertanian') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Perikanan') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Pertambangan') {
      crrJenisUsaha.text = '65';
    } else if (jenisUsaha.text == 'Perindustrian') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Listrik') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Gas') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Air') {
      crrJenisUsaha.text = '70';
    } else if (jenisUsaha.text == 'Kontruksi') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Perdagangan') {
      crrJenisUsaha.text = '85';
    } else if (jenisUsaha.text == 'Pengangkutan') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Komunikasi') {
      crrJenisUsaha.text = '80';
    } else if (jenisUsaha.text == 'Jasa Dunia Usaha') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Jasa Sosial') {
      crrJenisUsaha.text = '75';
    } else if (jenisUsaha.text == 'Lain - Lain') {
      crrJenisUsaha.text = '75';
    } else {
      crrJenisUsaha.text = '0';
    }
  }

  @override
  void onClose() {
    jenisUsaha.dispose();
    crrJenisUsaha.dispose();
    debiturId.dispose();
    super.onClose();
  }
}
