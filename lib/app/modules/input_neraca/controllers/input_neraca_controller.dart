// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:akm/app/service/debtor_service.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/neraca/save_neraca.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';

// 🌎 Project imports:

class InputNeracaController extends GetxController {
  @override
  void onClose() {}

  final isNeracaProcessing = false.obs;

  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  var cashOnHand = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var tabungan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var jumlahKasDanBank = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var piutangUsaha = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var piutangLainnya = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var persediaan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var hutangUsaha = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var hutangBank = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var peralatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var kendaraan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var tanahDanBangunan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var aktivaTetap = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var debitur = TextEditingController();
  var tanggalInput = DateTime.now().obs;

  final data = Get.arguments;

  void saveNeraca() {
    final body = {
      'tanggal_input': tanggalInput.value.toString(),
      'kas_on_hand': cashOnHand.text.replaceAll('.', ''),
      'tabungan': tabungan.text.replaceAll('.', ''),
      'jumlah_kas_dan_tabungan': jumlahKasDanBank.text.replaceAll('.', ''),
      'jumlah_piutang': piutangLainnya.text.replaceAll('.', ''),
      'jumlah_persediaan': persediaan.text.replaceAll('.', ''),
      'hutang_usaha': hutangUsaha.text.replaceAll('.', ''),
      'hutang_bank': hutangBank.text.replaceAll('.', ''),
      'peralatan': peralatan.text.replaceAll('.', ''),
      'kendaraan': kendaraan.text.replaceAll('.', ''),
      'tanah_bangunan': tanahDanBangunan.text.replaceAll('.', ''),
      'aktiva_tetap': aktivaTetap.text.replaceAll('.', ''),
      'debitur': debitur.text,
    };
    try {
      isNeracaProcessing(true);
      NeracaProvider().deployNeraca(body).then((resp) {
        isNeracaProcessing(false);
        clearForm();
        debiturController.fetchOneDebitur(int.parse(debitur.text));
        Get.snackbar(
          'Sucess',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }, onError: (err) {
        isNeracaProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isNeracaProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void updateNeraca(id) async {
    final body = {
      'tanggal_input': tanggalInput.value.toString(),
      'kas_on_hand': cashOnHand.text.replaceAll('.', ''),
      'tabungan': tabungan.text.replaceAll('.', ''),
      'jumlah_kas_dan_tabungan': jumlahKasDanBank.text.replaceAll('.', ''),
      'jumlah_piutang': piutangLainnya.text.replaceAll('.', ''),
      'jumlah_persediaan': persediaan.text.replaceAll('.', ''),
      'hutang_usaha': hutangUsaha.text.replaceAll('.', ''),
      'hutang_bank': hutangBank.text.replaceAll('.', ''),
      'peralatan': peralatan.text.replaceAll('.', ''),
      'kendaraan': kendaraan.text.replaceAll('.', ''),
      'tanah_bangunan': tanahDanBangunan.text.replaceAll('.', ''),
      'aktiva_tetap': aktivaTetap.text.replaceAll('.', ''),
    };
    try {
      isNeracaProcessing(true);
      NeracaProvider().putNeraca(id, body).then((resp) {
        isNeracaProcessing(false);
        clearForm();
        debiturController
            .fetchOneDebitur(int.parse(debiturController.debiturId.toString()));
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          title: 'Sukses Diperbarui',
          bodyHeaderDistance: 25,
          desc:
              'Untuk mengsinkronkan data, silahkan edit Rugi Laba pada menu di bawah ini',
          dismissOnTouchOutside: false,
          btnOkOnPress: () {},
        ).show();
      }, onError: (err) {
        isNeracaProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isNeracaProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void deleteNeraca(int id) {
    try {
      isNeracaProcessing(true);
      NeracaProvider().deleteNeraca(id).then((resp) {
        isNeracaProcessing(false);
        clearForm();
        debiturController.fetchOneDebitur(id);
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
        isNeracaProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isNeracaProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

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

  void hitungKasDanBank() {
    final cashOnHandValue = double.parse(cashOnHand.text.replaceAll('.', ''));
    final tabunganValue = double.parse(tabungan.text.replaceAll('.', ''));
    final jumlahKasDanBankValue = cashOnHandValue + tabunganValue;

    jumlahKasDanBank.text = jumlahKasDanBankValue.toStringAsFixed(0);
  }

  void hitungAktivaTetap() {
    final parsePeralatan = double.parse(peralatan.text.replaceAll('.', ''));
    final parseKendaraan = double.parse(kendaraan.text.replaceAll('.', ''));
    final parseTanahDanBangunan =
        double.parse(tanahDanBangunan.text.replaceAll('.', ''));

    final hasil = parsePeralatan + parseKendaraan + parseTanahDanBangunan;

    aktivaTetap.text = hasil.toStringAsFixed(0);
  }

  void clearForm() {
    tanggalInput.value = DateTime.now();
    cashOnHand.text = '';
    tabungan.text = '';
    jumlahKasDanBank.text = '';
    piutangLainnya.text = '';
    persediaan.text = '';
    hutangUsaha.text = '';
    hutangBank.text = '';
    peralatan.text = '';
    kendaraan.text = '';
    tanahDanBangunan.text = '';
    aktivaTetap.text = '';
  }

  void clearFormEdit() {
    tanggalInput.value = DateTime.now();
    cashOnHand.text = '';
    tabungan.text = '';
    jumlahKasDanBank.text = '';
    piutangLainnya.text = '';
    persediaan.text = '';
    hutangUsaha.text = '';
    hutangBank.text = '';
    peralatan.text = '';
    kendaraan.text = '';
    tanahDanBangunan.text = '';
    aktivaTetap.text = '';
  }
}
