// 🐦 Flutter imports:
import 'package:akm/app/service/debtor_service.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:finance/finance.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/input_keuangan/save_keuangan.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import '../../../common/style.dart';

class InputKeuanganController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
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

  final isInputKeuanganProcessing = false.obs;

  final debiturController = Get.put(InsightDebiturController());

  final formKey = GlobalKey<FormBuilderState>();

  TabController? tabController;

  var rugiLaba = TextEditingController();
  var debitur = TextEditingController();
  var angsuranPerBulan = TextEditingController();
  var provisi = TextEditingController();
  var sistemAngsuran = '';
  var digunakanUntuk = '';
  var bungaPerTahun = TextEditingController();
  var tradeCycle = TextEditingController(text: '0');
  var hpp = TextEditingController(text: '75');
  var kreditYangDiusulkan = MoneyMaskedTextController(
      initialValue: 0,
      thousandSeparator: '.',
      decimalSeparator: '',
      precision: 0);
  var totalAngsuran = MoneyMaskedTextController(
      initialValue: 0,
      thousandSeparator: '.',
      decimalSeparator: '',
      precision: 0);
  var pinjamanLainnya = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var angsuranPinjamanLainnya = TextEditingController(text: '0');
  var nilaiAset = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var penjualanKini = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaBahanKini = MoneyMaskedTextController(
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0,
      initialValue: 0);
  var biayaUpahKini = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaOperasionalKini = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaHidupKini = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var penjualanYad = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var biayaBahanYad = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var biayaUpahYad = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var biayaOperasionalYad = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);
  var biayaHidupYad = MoneyMaskedTextController(
      initialValue: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0);

  void saveKeuangan() {
    final body = {
      'kredit_diusulkan': kreditYangDiusulkan.text.replaceAll('.', ''),
      'angsuran': angsuranPerBulan.text,
      'bunga_per_tahun': bungaPerTahun.text,
      'provisi': provisi.text,
      'sistem_angsuran': sistemAngsuran,
      'digunakan_untuk': digunakanUntuk,
      'angsuran_rp': totalAngsuran.text.replaceAll('.', ''),
      'penjualan_kini': penjualanKini.text.replaceAll('.', ''),
      'biaya_bahan_kini': biayaBahanKini.text.replaceAll('.', ''),
      'biaya_operasional_kini': biayaOperasionalKini.text.replaceAll('.', ''),
      'biaya_upah_kini': biayaUpahKini.text.replaceAll('.', ''),
      'biaya_hidup_kini': biayaHidupKini.text.replaceAll('.', ''),
      'penjualan_asumsi': penjualanYad.text.replaceAll('.', ''),
      'biaya_bahan_asumsi': biayaBahanYad.text.replaceAll('.', ''),
      'biaya_operasional_asumsi': biayaOperasionalYad.text.replaceAll('.', ''),
      'biaya_upah_asumsi': biayaUpahYad.text.replaceAll('.', ''),
      'biaya_hidup_asumsi': biayaHidupYad.text.replaceAll('.', ''),
      'trade_cycle': tradeCycle.text,
      'debitur': debitur.text,
      'rugilaba': rugiLaba.text,
    };

    try {
      isInputKeuanganProcessing(true);
      InputKeuanganProvider().deployInputKeuangan(body).then((resp) {
        isInputKeuanganProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debitur.text));
        clearTextEditing();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }).catchError((e) {
        isInputKeuanganProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isInputKeuanganProcessing.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void updateKeuangan(id) async {
    final body = {
      'kredit_diusulkan': kreditYangDiusulkan.text.replaceAll('.', ''),
      'angsuran': angsuranPerBulan.text,
      'bunga_per_tahun': bungaPerTahun.text,
      'provisi': provisi.text,
      'sistem_angsuran': sistemAngsuran.toString(),
      'digunakan_untuk': digunakanUntuk.toString(),
      'angsuran_rp': totalAngsuran.text.replaceAll('.', ''),
      'penjualan_kini': penjualanKini.text.replaceAll('.', ''),
      'biaya_bahan_kini': biayaBahanKini.text.replaceAll('.', ''),
      'biaya_operasional_kini': biayaOperasionalKini.text.replaceAll('.', ''),
      'biaya_upah_kini': biayaUpahKini.text.replaceAll('.', ''),
      'biaya_hidup_kini': biayaHidupKini.text.replaceAll('.', ''),
      'penjualan_asumsi': penjualanYad.text.replaceAll('.', ''),
      'biaya_bahan_asumsi': biayaBahanYad.text.replaceAll('.', ''),
      'biaya_operasional_asumsi': biayaOperasionalYad.text.replaceAll('.', ''),
      'biaya_upah_asumsi': biayaUpahYad.text.replaceAll('.', ''),
      'biaya_hidup_asumsi': biayaHidupYad.text.replaceAll('.', ''),
      'trade_cycle': tradeCycle.text,
      'debitur': debitur.text,
      'rugilaba': rugiLaba.text,
    };

    try {
      isInputKeuanganProcessing(true);
      InputKeuanganProvider().putInputKeuangan(id, body).then((resp) {
        isInputKeuanganProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debitur.text));
        clearTextEditing();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }, onError: (e) {
        isInputKeuanganProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isInputKeuanganProcessing.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void deleteKeuangan(id) async {
    try {
      isInputKeuanganProcessing(true);
      InputKeuanganProvider().purgeInputKeuangan(id).then((resp) {
        isInputKeuanganProcessing(false);
        debiturController.fetchOneDebitur(int.parse(debitur.text));
        clearTextEditing();
        Get.snackbar(
          'Success',
          'Data berhasil dihapus',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }, onError: (e) {
        isInputKeuanganProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isInputKeuanganProcessing.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void mothlyPaymentCalculation() {
    if (kreditYangDiusulkan.text == '0' || kreditYangDiusulkan.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Kredit yang diusulkan masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Pinjaman Maksimal Masih Kosong');
    }

    if (angsuranPerBulan.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Angsuran per bulan masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Angsuran per bulan masih kosong');
    }

    if (bungaPerTahun.text == '') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Bunga per tahun masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Bunga per tahun masih kosong');
    }

    final parseBungaPerTahun = double.parse(bungaPerTahun.text);
    final parseBungaPerTahunAsDecimal = parseBungaPerTahun / 100;
    final parseAngsuranPerBulanKredit = int.parse(angsuranPerBulan.text);
    final parseKreditYangDiminta =
        double.parse(kreditYangDiusulkan.text.replaceAll('.', ''));

    final hitungAwal = Finance.pmt(
          rate: parseBungaPerTahunAsDecimal / 12,
          nper: parseAngsuranPerBulanKredit,
          pv: parseKreditYangDiminta,
        ) *
        -1 %
        5;

    final hitungKedua = Finance.pmt(
          rate: parseBungaPerTahunAsDecimal / 12,
          nper: parseAngsuranPerBulanKredit,
          pv: parseKreditYangDiminta,
        ) *
        -1;

    final ifBenar = hitungKedua - hitungAwal + 5;
    final ifSalah = hitungKedua - hitungAwal;

    if (hitungAwal > 2) {
      totalAngsuran.text = ifBenar.toStringAsFixed(0);
    } else {
      totalAngsuran.text = ifSalah.toStringAsFixed(0);
    }
  }

  void hitungBiayaBahanHpp() {
    if (penjualanKini.text == '' || penjualanKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Penjualan kini masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Penjualan kini masih kosong');
    }

    final parsePenjualanKini =
        double.parse(penjualanKini.text.replaceAll('.', ''));
    final parseHpp = double.parse(hpp.text) / 100;

    final hitungBiayaBahanKini = parsePenjualanKini * parseHpp;

    biayaBahanKini.text = hitungBiayaBahanKini.toStringAsFixed(0);
  }

  void hitungAsumsiPenjualan() {
    if (penjualanKini.text == '' || penjualanKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Penjualan kini masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Penjualan kini masih kosong');
    }

    if (biayaBahanKini.text == '' || biayaBahanKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya bahan kini masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Biaya bahan kini masih kosong');
    }

    if (biayaUpahKini.text == '' || biayaUpahKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya upah kini masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Biaya upah kini masih kosong');
    }

    if (biayaOperasionalKini.text == '' || biayaOperasionalKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya operasional kini masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Biaya operasional kini masih kosong');
    }

    if (biayaHidupKini.text == '' || biayaHidupKini.text == '0') {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Biaya hidup kini masih kosong',
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
        btnOkOnPress: () {},
      ).show();
      throw Exception('Biaya hidup kini masih kosong');
    }

    final parsePenjualanKini =
        double.parse(penjualanKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaBahanKini =
        double.parse(biayaBahanKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaUpahKini =
        double.parse(biayaUpahKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaOperasionalKini =
        double.parse(biayaOperasionalKini.text.replaceAll('.', '')) * 1.1;
    final parseBiayaHidupKini =
        double.parse(biayaHidupKini.text.replaceAll('.', '')) * 1;

    penjualanYad.text = parsePenjualanKini.toStringAsFixed(0);
    biayaBahanYad.text = parseBiayaBahanKini.toStringAsFixed(0);
    biayaUpahYad.text = parseBiayaUpahKini.toStringAsFixed(0);
    biayaOperasionalYad.text = parseBiayaOperasionalKini.toStringAsFixed(0);
    biayaHidupYad.text = parseBiayaHidupKini.toStringAsFixed(0);
  }

  void clearTextEditing() {
    kreditYangDiusulkan.clear();
    angsuranPerBulan.clear();
    bungaPerTahun.clear();
    provisi.clear();
    totalAngsuran.clear();
    pinjamanLainnya.clear();
    angsuranPinjamanLainnya.clear();
    nilaiAset.clear();
    penjualanKini.clear();
    hpp.clear();
    biayaBahanKini.clear();
    biayaOperasionalKini.clear();
    biayaUpahKini.clear();
    biayaHidupKini.clear();
    penjualanYad.clear();
    biayaBahanYad.clear();
    biayaOperasionalYad.clear();
    biayaUpahYad.clear();
    biayaHidupYad.clear();
    tradeCycle.clear();
    rugiLaba.clear();
    digunakanUntuk = '';
    sistemAngsuran = '';
  }

  @override
  void onClose() {
    rugiLaba.dispose();
    debitur.dispose();
    angsuranPerBulan.dispose();
    provisi.dispose();
    bungaPerTahun.dispose();
    angsuranPinjamanLainnya.dispose();
    hpp.dispose();
    tradeCycle.dispose();
    tabController?.dispose();
    super.onClose();
  }

  final digunakanUntukList = [
    'Modal Kerja',
    'Investasi',
  ];

  final sistemAngsuranList = [
    'Flat',
    'Efektif',
  ];
}
