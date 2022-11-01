// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:faker_dart/faker_dart.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../../../models/debtor.dart';
import '../../../service/debtor_service.dart';

class DebiturRealController extends GetxController {
  // List<Debtor> listDebtor = [].obs;
  var listDebtor = Future.value(<Debtor>[]).obs;
  var finalDebtpr = <Debtor>[].obs;
  var selectedDebtor = <Debtor>[].obs;

  final isEditLoading = false.obs;

  void convertFutureToList() async {
    var list = await listDebtor.value;
    finalDebtpr.value = list;
  }

  // assign listDebtor to finalDebtor

  // List<Debtor>? selectedDebtor = [];

  Debtor debtor = Debtor();

  final formKey = GlobalKey<FormBuilderState>();

  final peminjam1 = TextEditingController().obs;
  final peminjam2 = TextEditingController().obs;
  final ktp1 = TextEditingController().obs;
  final ktp2 = TextEditingController().obs;
  final pemilikAgunan1 = TextEditingController().obs;
  final pemilikAgunan2 = TextEditingController().obs;
  final noKtp1 = TextEditingController().obs;
  final noKtp2 = TextEditingController().obs;

  final alamat1 = TextEditingController().obs;
  final alamat2 = TextEditingController().obs;

  final tempatLahir = TextEditingController().obs;
  final tanggalLahir = DateTime.now().obs;
  final umur = TextEditingController().obs;
  final statusKeluargaInput = ''.obs;
  final jumlahTanggungan = TextEditingController().obs;

  final lamanyaBerusaha = TextEditingController().obs;
  final lokasiUsaha = TextEditingController().obs;
  final bidangUsaha = TextEditingController().obs;
  final jenisUsahaInput = ''.obs;

  final pendidikanInput = ''.obs;

  final pekerjaan1 = TextEditingController().obs;
  final pekerjaan2 = TextEditingController().obs;

  final noSkpk = TextEditingController(text: '0').obs;
  final tanggalSekarangInput = DateTime.now().obs;
  final deskripsiDebitur = TextEditingController().obs;

  final searchBox = TextEditingController().obs;

  final loadingFetch = false.obs;

  final debiturController = Get.put(InsightDebiturController());

  // void searchDebtor(String query) {
  //   final suggestion = listDebtor.where((debtor) {
  //     final nama = debtor.peminjam1.toString().toLowerCase();
  //     final input = query.toLowerCase();

  //     return nama.contains(input);
  //   }).toList();

  //   if (suggestion.isNotEmpty) {
  //     listDebtor.value = suggestion;
  //   } else {
  //     listDebtor.value = listDebtor;
  //   }

  //   update();
  // }

  void saveDebtor() {
    final body = {
      'peminjam1': peminjam1.value.text,
      'ktp1': ktp1.value.text,
      'peminjam2': peminjam2.value.text,
      'ktp2': ktp2.value.text,
      'pemilik_agunan_1': pemilikAgunan1.value.text,
      'no_ktp1': noKtp1.value.text,
      'pemilik_agunan_2': pemilikAgunan2.value.text,
      'no_ktp2': noKtp2.value.text,
      'alamat_1': alamat1.value.text,
      'alamat_2': alamat2.value.text,
      'tempat_lahir': tempatLahir.value.text,
      'tanggal_lahir': tanggalLahir.value.toString(),
      'umur': umur.value.text,
      'status_keluarga': statusKeluargaInput.value.toString(),
      'jumlah_tanggungan': jumlahTanggungan.value.text,
      'lamanya_berusaha': lamanyaBerusaha.value.text,
      'lokasi_usaha': lokasiUsaha.value.text,
      'jenis_usaha': jenisUsahaInput.value.toString(),
      'bidang_usaha': bidangUsaha.value.text,
      'pendidikan': pendidikanInput.value.toString(),
      'pekerjaan1': pekerjaan1.value.text,
      'pekerjaan2': pekerjaan2.value.text,
      'no_skpk': noSkpk.value.text,
      'tgl_sekarang': tanggalSekarangInput.value.toString(),
      'deskripsi_debitur': deskripsiDebitur.value.text,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().addDebtor(body).then((resp) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          'Data gagal disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      debiturController.isDataLoading(false);
      Get.snackbar(
        'Error',
        'Data gagal disimpan',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void deleteDebtor(String id) {
    final api = DebtorService();

    api.deleteDebtor(id);

    update();

    fetchDebitur();
  }

  void editDebitur(String id) async {
    // isEditLoading.value = true;

    final body = {
      'peminjam1': peminjam1.value.text,
      'ktp1': ktp1.value.text,
      'peminjam2': peminjam2.value.text,
      'ktp2': ktp2.value.text,
      'pemilik_agunan_1': pemilikAgunan1.value.text,
      'no_ktp1': noKtp1.value.text,
      'pemilik_agunan_2': pemilikAgunan2.value.text,
      'no_ktp2': noKtp2.value.text,
      'alamat_1': alamat1.value.text,
      'alamat_2': alamat2.value.text,
      'tempat_lahir': tempatLahir.value.text,
      'tanggal_lahir': tanggalLahir.value.toString(),
      'umur': umur.value.text,
      'status_keluarga': statusKeluargaInput.value.toString(),
      'jumlah_tanggungan': jumlahTanggungan.value.text,
      'lamanya_berusaha': lamanyaBerusaha.value.text,
      'lokasi_usaha': lokasiUsaha.value.text,
      'jenis_usaha': jenisUsahaInput.value.toString(),
      'bidang_usaha': bidangUsaha.value.text,
      'pendidikan': pendidikanInput.value.toString(),
      'pekerjaan1': pekerjaan1.value.text,
      'pekerjaan2': pekerjaan2.value.text,
      'no_skpk': noSkpk.value.text,
      'tgl_sekarang': tanggalSekarangInput.value.toString(),
      'deskripsi_debitur': deskripsiDebitur.value.text,
    };

    try {
      debiturController.isDataLoading(true);
      DebtorService().updateDebtor(id, body).then((resp) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        debiturController.fetchOneDebitur(int.parse(id));
      }, onError: (e) {
        debiturController.isDataLoading(false);
        Get.snackbar(
          'Error',
          'Data gagal disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      debiturController.isDataLoading(false);
      Get.snackbar(
        'Error',
        'Data gagal disimpan',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    // final api = DebtorService();
    // final data = {
    //   'peminjam1': peminjam1.value.text,
    //   'ktp1': ktp1.value.text,
    //   'peminjam2': peminjam2.value.text,
    //   'ktp2': ktp2.value.text,
    //   'pemilik_agunan_1': pemilikAgunan1.value.text,
    //   'no_ktp1': noKtp1.value.text,
    //   'pemilik_agunan_2': pemilikAgunan2.value.text,
    //   'no_ktp2': noKtp2.value.text,
    //   'alamat_1': alamat1.value.text,
    //   'alamat_2': alamat2.value.text,
    //   'tempat_lahir': tempatLahir.value.text,
    //   'tanggal_lahir': tanggalLahir.value.toString(),
    //   'umur': umur.value.text,
    //   'status_keluarga': statusKeluargaInput.value.toString(),
    //   'jumlah_tanggungan': jumlahTanggungan.value.text,
    //   'lamanya_berusaha': lamanyaBerusaha.value.text,
    //   'lokasi_usaha': lokasiUsaha.value.text,
    //   'jenis_usaha': jenisUsahaInput.value.toString(),
    //   'bidang_usaha': bidangUsaha.value.text,
    //   'pendidikan': pendidikanInput.value.toString(),
    //   'pekerjaan1': pekerjaan1.value.text,
    //   'pekerjaan2': pekerjaan2.value.text,
    //   'no_skpk': noSkpk.value.text,
    //   'tgl_sekarang': tanggalSekarangInput.value.toString(),
    //   'deskripsi_debitur': deskripsiDebitur.value.text,
    // };

    // await api.updateDebtor(id, data);

    // update();

    // isEditLoading.value = false;
  }

  void fetchDebitur() async {
    loadingFetch.value = true;

    final api = DebtorService().getDebtors();
    listDebtor.value = api;
    loadingFetch.value = false;
    listDebtor.refresh();

    update();
  }

  void filterDebtor() async {
    await FilterListDialog.display<Debtor>(
      useSafeArea: true,
      themeData: FilterListThemeData(
        Get.context!,
        choiceChipTheme: const ChoiceChipThemeData(
          selectedBackgroundColor: primaryColor, elevation: 5,

          // textStyle: TextStyle(color: Colors.black, fontSize: 12),
        ),
        headerTheme: const HeaderThemeData(
          backgroundColor: primaryColor,
          headerTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          searchFieldHintText: 'Cari Debitur',
          closeIconColor: Colors.white,
        ),
        controlButtonBarTheme: ControlButtonBarThemeData(
          Get.context!,
          backgroundColor: secondaryColor,
          controlButtonTheme: const ControlButtonThemeData(
            primaryButtonBackgroundColor: primaryColor,
          ),
        ),
        // Disable chip selection
        // Change reset button
        // Change apply button
        // Change search bar
        // Change search bar hint text
        // Change search bar text style
        // Change search bar text input type
        // Change search bar text input action
        // Disable chip selection
        borderRadius: 20,
      ),
      backgroundColor: Colors.white,
      applyButtonText: 'Pilih',
      enableOnlySingleSelection: true,
      barrierDismissible: false,
      selectedItemsText: 'Debitur Terpilih',
      Get.context!,
      hideSelectedTextCount: true,
      listData: finalDebtpr,
      selectedListData: selectedDebtor,
      choiceChipLabel: (user) => user!.peminjam1,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.peminjam1!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        selectedDebtor.value = list!;
        debugPrint('selected: $list');
        update();

        Get.snackbar(
          '${list[0].peminjam1}',
          'Dipilih',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: Colors.white,
        );

        Navigator.pop(Get.context!);
      },
    );
  }

  final faker = Faker.instance;

  @override
  void onClose() {
    peminjam1.value.dispose();
    ktp1.value.dispose();
    peminjam2.value.dispose();
    ktp2.value.dispose();
    pemilikAgunan1.value.dispose();
    noKtp1.value.dispose();
    pemilikAgunan2.value.dispose();
    noKtp2.value.dispose();
    alamat1.value.dispose();
    alamat2.value.dispose();
    tempatLahir.value.dispose();
    umur.value.dispose();
    lamanyaBerusaha.value.dispose();
    lokasiUsaha.value.dispose();
    bidangUsaha.value.dispose();
    pekerjaan1.value.dispose();
    pekerjaan2.value.dispose();
    noSkpk.value.dispose();
    deskripsiDebitur.value.dispose();
    super.onClose();
  }

  final jenisUsahaList = [
    'Pertanian',
    'Perikanan',
    'Pertambangan',
    'Perindustrian',
    'Listrik',
    'Gas',
    'Air',
    'Kontruksi',
    'Perdagangan',
    'Pengangkutan',
    'Komunikasi',
    'Jasa Dunia Usaha',
    'Jasa Sosial',
    'Lain - Lain',
  ];

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

  final statusList = [
    'Kawin',
    'Belum Kawin',
    'Cerai Hidup',
    'Cerai Mati',
  ];
}
