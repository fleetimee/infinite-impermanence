// 📦 Package imports:
// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/service/debtor_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/data/provider/rugi_laba/save_rugi_laba.provider.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:

class RugiLabaController extends GetxController {
  final isRugiLabaProcessing = false.obs;

  final data = Get.arguments;

  final debiturController = Get.put(InsightDebiturController());

  var debiturId = TextEditingController();
  var neracaId = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  var persentaseHpp = TextEditingController();
  var aktivaLancarKas = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var aktivaBank = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var aktivaPiutangUsaha = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var aktivaPersediaan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var hutangUsaha = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var hutangBank = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var hutangLainnya = MoneyMaskedTextController(
      decimalSeparator: '',
      thousandSeparator: '.',
      precision: 0,
      initialValue: 0);
  var jumlahAktivaLancar = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var jumlahHutang = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var peralatan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var kendaraan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var tanahDanBangunan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var jumlahAktivaTetap = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var modal = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var jumlahAktiva = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var jumlahPasiva = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var omzetPerBulan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var hargaPokokPenjualan = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var labaKotor = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaTenagaKerja = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaOperasional = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaLainnya = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var totalBiaya = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var labaSebelumPajak = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var perkiraanPajak = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var labaSetelahPajak = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var biayaHidupRataRata = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var sisaPenghasilanBersih = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);

  void saveRugiLaba() {
    final body = {
      'kas': aktivaLancarKas.text.replaceAll('.', ''),
      'bank': aktivaBank.text.replaceAll('.', ''),
      'piutang': aktivaPiutangUsaha.text.replaceAll('.', ''),
      'persediaan': aktivaPersediaan.text.replaceAll('.', ''),
      'jumlah_aktiva_lancar': jumlahAktivaLancar.text.replaceAll('.', ''),
      'peralatan': peralatan.text.replaceAll('.', ''),
      'kendaraan': kendaraan.text.replaceAll('.', ''),
      'tanah_bangunan': tanahDanBangunan.text.replaceAll('.', ''),
      'jumlah_aktiva_tetap': jumlahAktivaTetap.text.replaceAll('.', ''),
      'sum_aktiva': jumlahAktiva.text.replaceAll('.', ''),
      'hutang_usaha': hutangUsaha.text.replaceAll('.', ''),
      'hutang_bank': hutangBank.text.replaceAll('.', ''),
      'hutang_lainnya': hutangLainnya.text.replaceAll('.', ''),
      'jumlah_hutang': jumlahHutang.text.replaceAll('.', ''),
      'jumlah_modal': modal.text.replaceAll('.', ''),
      'sum_pasiva': jumlahPasiva.text.replaceAll('.', ''),
      'omzet': omzetPerBulan.text.replaceAll('.', ''),
      'harga_pokok': hargaPokokPenjualan.text.replaceAll('.', ''),
      'laba_kotor': labaKotor.text.replaceAll('.', ''),
      'biaya_tenaga_kerja': biayaTenagaKerja.text.replaceAll('.', ''),
      'biaya_operasional': biayaOperasional.text.replaceAll('.', ''),
      'biaya_lainnya': biayaLainnya.text.replaceAll('.', ''),
      'total_biaya': totalBiaya.text.replaceAll('.', ''),
      'laba_sebelum_pajak': labaSebelumPajak.text.replaceAll('.', ''),
      'perkiraan_pajak': perkiraanPajak.text.replaceAll('.', ''),
      'laba_setelah_pajak': labaSetelahPajak.text.replaceAll('.', ''),
      'penghasilan': labaSetelahPajak.text.replaceAll('.', ''),
      'biaya_hidup': biayaHidupRataRata.text.replaceAll('.', ''),
      'sisa_penghasilan': sisaPenghasilanBersih.text.replaceAll('.', ''),
      'neraca': neracaId.text,
      'debitur': debiturId.text,
    };
    try {
      isRugiLabaProcessing.value = true;
      RugiLabaProvider().deployRugiLaba(body).then((value) {
        isRugiLabaProcessing.value = false;
        clearForm();
        debiturController.fetchOneDebitur(int.parse(debiturId.text));
        patchProgressBar(int.parse(debiturId.text));
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: secondaryColor,
        );
      }).catchError((e) {
        isRugiLabaProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isRugiLabaProcessing.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void updateRugiLaba(id) async {
    final body = {
      'kas': aktivaLancarKas.text.replaceAll('.', ''),
      'bank': aktivaBank.text.replaceAll('.', ''),
      'piutang': aktivaPiutangUsaha.text.replaceAll('.', ''),
      'persediaan': aktivaPersediaan.text.replaceAll('.', ''),
      'jumlah_aktiva_lancar': jumlahAktivaLancar.text.replaceAll('.', ''),
      'peralatan': peralatan.text.replaceAll('.', ''),
      'kendaraan': kendaraan.text.replaceAll('.', ''),
      'tanah_bangunan': tanahDanBangunan.text.replaceAll('.', ''),
      'jumlah_aktiva_tetap': jumlahAktivaTetap.text.replaceAll('.', ''),
      'sum_aktiva': jumlahAktiva.text.replaceAll('.', ''),
      'hutang_usaha': hutangUsaha.text.replaceAll('.', ''),
      'hutang_bank': hutangBank.text.replaceAll('.', ''),
      'hutang_lainnya': hutangLainnya.text.replaceAll('.', ''),
      'jumlah_hutang': jumlahHutang.text.replaceAll('.', ''),
      'jumlah_modal': modal.text.replaceAll('.', ''),
      'sum_pasiva': jumlahPasiva.text.replaceAll('.', ''),
      'omzet': omzetPerBulan.text.replaceAll('.', ''),
      'harga_pokok': hargaPokokPenjualan.text.replaceAll('.', ''),
      'laba_kotor': labaKotor.text.replaceAll('.', ''),
      'biaya_tenaga_kerja': biayaTenagaKerja.text.replaceAll('.', ''),
      'biaya_operasional': biayaOperasional.text.replaceAll('.', ''),
      'biaya_lainnya': biayaLainnya.text.replaceAll('.', ''),
      'total_biaya': totalBiaya.text.replaceAll('.', ''),
      'laba_sebelum_pajak': labaSebelumPajak.text.replaceAll('.', ''),
      'perkiraan_pajak': perkiraanPajak.text.replaceAll('.', ''),
      'laba_setelah_pajak': labaSetelahPajak.text.replaceAll('.', ''),
      'penghasilan': labaSetelahPajak.text.replaceAll('.', ''),
      'biaya_hidup': biayaHidupRataRata.text.replaceAll('.', ''),
      'sisa_penghasilan': sisaPenghasilanBersih.text.replaceAll('.', ''),
    };
    try {
      isRugiLabaProcessing.value = true;
      RugiLabaProvider().putRugiLaba(id, body).then((resp) {
        isRugiLabaProcessing.value = false;
        clearForm();
        debiturController.fetchOneDebitur(int.parse(data.toString()));
        debiturController.insightDebitur.value.inputKeuangan == null
            ? AwesomeDialog(
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
                desc: 'Data Sukses Diperbarui',
                dismissOnTouchOutside: false,
                btnOkOnPress: () {},
              ).show()
            : AwesomeDialog(
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
                    'Untuk mengsinkronkan data, silahkan edit Keuangan pada tombol di bawah ini',
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                btnOkOnPress: () {
                  Get.toNamed(
                    Routes.EDIT_KEUANGAN,
                    arguments: debiturController.insightDebitur.value,
                  );
                },
                btnOkText: 'Edit Input Keuangan',
              ).show();
      }).catchError((e) {
        isRugiLabaProcessing.value = false;
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
        debugPrint(e.toString());
      });
    } catch (e) {
      isRugiLabaProcessing.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  void deleteRugiLaba(int id) {
    try {
      isRugiLabaProcessing(true);
      RugiLabaProvider().deleteRugiLaba(id).then((resp) {
        isRugiLabaProcessing(false);
        clearForm();
        debiturController.fetchOneDebitur(data);
        purgeProgressBar(data);
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
        isRugiLabaProcessing(false);
        Get.snackbar(
          'Error',
          err.toString(),
          backgroundColor: Colors.red,
          colorText: secondaryColor,
        );
      });
    } catch (e) {
      isRugiLabaProcessing(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: secondaryColor,
      );
    }
  }

  /* 
  Function Perhitungan Rugi Laba
  Dimulai dari sini 
  */
  void sumAktivaTetap() {
    final parsePeralatan = double.parse(peralatan.text.replaceAll('.', ''));
    final parseKendaraan = double.parse(kendaraan.text.replaceAll('.', ''));
    final parseTanahDanBangunan =
        double.parse(tanahDanBangunan.text.replaceAll('.', ''));

    final sum = parsePeralatan + parseKendaraan + parseTanahDanBangunan;

    jumlahAktivaTetap.text = sum.toStringAsFixed(0);
  }

  void sumAktivaLancar() {
    final parseAktivaLancarKas =
        double.parse(aktivaLancarKas.text.replaceAll('.', ''));
    final parseAktivaLancarBank =
        double.parse(aktivaBank.text.replaceAll('.', ''));
    final parseAktivaLancarPiutangUsaha =
        double.parse(aktivaPiutangUsaha.text.replaceAll('.', ''));
    final parseAktivaLancarPersediaan =
        double.parse(aktivaPersediaan.text.replaceAll('.', ''));

    final sumAktivaLancar = parseAktivaLancarKas +
        parseAktivaLancarBank +
        parseAktivaLancarPiutangUsaha +
        parseAktivaLancarPersediaan;

    jumlahAktivaLancar.text = sumAktivaLancar.toStringAsFixed(0);
  }

  void sumAktiva() {
    final parseAktivaLancar =
        double.parse(jumlahAktivaLancar.text.replaceAll('.', ''));
    final parseAktivaTetap =
        double.parse(jumlahAktivaTetap.text.replaceAll('.', ''));

    final sumAktiva = parseAktivaLancar + parseAktivaTetap;

    jumlahAktiva.text = sumAktiva.toStringAsFixed(0);
  }

  void sumJumlahHutang() {
    final parseHutangDagang =
        double.parse(hutangUsaha.text.replaceAll('.', ''));
    final parseHutangBank = double.parse(hutangBank.text.replaceAll('.', ''));
    final parseHutangLainnya =
        double.parse(hutangLainnya.text.replaceAll('.', ''));

    final sumHutang = parseHutangDagang + parseHutangBank + parseHutangLainnya;

    jumlahHutang.text = sumHutang.toStringAsFixed(0);
  }

  void sumModal() {
    final parseAktiva = double.parse(jumlahAktiva.text.replaceAll('.', ''));
    final parseHutang = double.parse(jumlahHutang.text.replaceAll('.', ''));

    final sumModal = parseAktiva - parseHutang;

    modal.text = sumModal.toStringAsFixed(0);
  }

  void sumPasiva() {
    final parseHutang = double.parse(jumlahHutang.text.replaceAll('.', ''));
    final parseModal = double.parse(modal.text.replaceAll('.', ''));

    final sumPasiva = parseHutang + parseModal;

    jumlahPasiva.text = sumPasiva.toStringAsFixed(0);
  }

  void sumLabaKotor() {
    final parseOmzetPerBulan =
        double.parse(omzetPerBulan.text.replaceAll('.', ''));
    final parseHpp = double.parse(hargaPokokPenjualan.text.replaceAll('.', ''));

    final result = parseOmzetPerBulan - parseHpp;

    labaKotor.text = result.toStringAsFixed(0);
  }

  void sumTotalBiaya() {
    final parseBiayaTenagaKerja =
        double.parse(biayaTenagaKerja.text.replaceAll('.', ''));
    final parseBiayaOperasional =
        double.parse(biayaOperasional.text.replaceAll('.', ''));
    final parseBiayaLainnya =
        double.parse(biayaLainnya.text.replaceAll('.', ''));

    final hasil =
        parseBiayaTenagaKerja + parseBiayaOperasional + parseBiayaLainnya;

    totalBiaya.text = hasil.toStringAsFixed(0);
  }

  void sumLabaSebelumPajak() {
    final parseLabaKotor = double.parse(labaKotor.text.replaceAll('.', ''));
    final parseTotalBiaya = double.parse(totalBiaya.text.replaceAll('.', ''));

    final hasil = parseLabaKotor - parseTotalBiaya;

    labaSebelumPajak.text = hasil.toStringAsFixed(0);
  }

  void sumPerkiraanPajak() {
    final parseLabaSebelumPajak =
        double.parse(labaSebelumPajak.text.replaceAll('.', ''));

    final hasil = (0.05 * parseLabaSebelumPajak);

    perkiraanPajak.text = hasil.toStringAsFixed(0);
  }

  void sumLabaSetelahPajak() {
    final parseLabaSebelumPajak =
        double.parse(labaSebelumPajak.text.replaceAll('.', ''));
    final parsePerkiraanPajak =
        double.parse(perkiraanPajak.text.replaceAll('.', ''));

    final hasil = parseLabaSebelumPajak - parsePerkiraanPajak;

    labaSetelahPajak.text = hasil.toStringAsFixed(0);
  }

  void sumSisaPenghasilan() {
    final parseLabaSetelahPajak =
        double.parse(labaSetelahPajak.text.replaceAll('.', ''));
    final parseBiayaHidupRataRata =
        double.parse(biayaHidupRataRata.text.replaceAll('.', ''));

    final hasil = parseLabaSetelahPajak - parseBiayaHidupRataRata;

    sisaPenghasilanBersih.text = hasil.toStringAsFixed(0);
  }

  void hitungHpp() {
    final parseOmzetPerBulan =
        double.parse(omzetPerBulan.text.replaceAll('.', ''));
    final parseHpp = double.parse(persentaseHpp.text) / 100;

    final hitungHargaPokokPenjualan = parseOmzetPerBulan * parseHpp;

    hargaPokokPenjualan.text = hitungHargaPokokPenjualan.toStringAsFixed(0);
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

  void result() {
    sumAktivaLancar();
    sumAktiva();
    sumJumlahHutang();
    sumModal();
    sumPasiva();
    sumAktivaTetap();
  }

  void perkiraanLaba() {
    sumTotalBiaya();
    sumLabaSebelumPajak();
    sumPerkiraanPajak();
    sumLabaSetelahPajak();
  }

  void clearForm() {
    aktivaLancarKas.clear();
    aktivaBank.clear();
    aktivaPiutangUsaha.clear();
    aktivaPersediaan.clear();
    hutangUsaha.clear();
    hutangBank.clear();
    jumlahAktivaLancar.clear();
    jumlahHutang.clear();
    peralatan.clear();
    kendaraan.clear();
    tanahDanBangunan.clear();
    jumlahAktivaTetap.clear();
    modal.clear();
    jumlahAktiva.clear();
    jumlahPasiva.clear();
    omzetPerBulan.clear();
    hargaPokokPenjualan.clear();
    labaKotor.clear();
    biayaTenagaKerja.clear();
    biayaOperasional.clear();
    biayaLainnya.clear();
    totalBiaya.clear();
    labaSebelumPajak.clear();
    perkiraanPajak.clear();
    labaSetelahPajak.clear();
    biayaHidupRataRata.clear();
    sisaPenghasilanBersih.clear();
    hargaPokokPenjualan.clear();
    persentaseHpp.clear();
  }

  @override
  void onClose() {
    super.onInit();
    //Dispose text editing controllers
    aktivaLancarKas.dispose();
    aktivaBank.dispose();
    aktivaPiutangUsaha.dispose();
    aktivaPersediaan.dispose();
    hutangUsaha.dispose();
    hutangBank.dispose();
    hutangLainnya.dispose();
    jumlahAktivaLancar.dispose();
    jumlahHutang.dispose();
    peralatan.dispose();
    kendaraan.dispose();
    tanahDanBangunan.dispose();
    jumlahAktivaTetap.dispose();
    modal.dispose();
    jumlahAktiva.dispose();
    jumlahPasiva.dispose();
    omzetPerBulan.dispose();
    hargaPokokPenjualan.dispose();
    labaKotor.dispose();
    biayaTenagaKerja.dispose();
    biayaOperasional.dispose();
    biayaLainnya.dispose();
    totalBiaya.dispose();
    labaSebelumPajak.dispose();
    perkiraanPajak.dispose();
    labaSetelahPajak.dispose();
    biayaHidupRataRata.dispose();
    sisaPenghasilanBersih.dispose();
    persentaseHpp.dispose();
  }
}
