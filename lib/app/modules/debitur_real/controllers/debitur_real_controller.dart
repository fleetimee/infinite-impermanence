// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:filter_list/filter_list.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/service/debtor_service.dart';

class DebiturRealController extends GetxController {
  // List<Debtor> listDebtor = [].obs;
  final listDebtor = <Debtor>[].obs;
  final selectedDebtor = <Debtor>[].obs;
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

  final noSkpk = TextEditingController().obs;
  final tanggalSekarangInput = DateTime.now().obs;
  final deskripsiDebitur = TextEditingController().obs;

  final searchBox = TextEditingController().obs;

  final loadingFetch = false.obs;

  void searchDebtor(String query) {
    final suggestion = listDebtor.where((debtor) {
      final nama = debtor.peminjam1.toString().toLowerCase();
      final input = query.toLowerCase();

      return nama.contains(input);
    }).toList();

    if (suggestion.isNotEmpty) {
      listDebtor.value = suggestion;
    } else {
      listDebtor.value = listDebtor;
    }

    update();
  }

  void saveDebtor() {
    final api = DebtorService();

    final data = {
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

    api.addDebtor(data);

    update();
  }

  void deleteDebtor(String id) {
    final api = DebtorService();

    api.deleteDebtor(id);

    update();

    fetchDebitur();
  }

  void editDebitur(String id) async {
    final api = DebtorService();
    final data = {
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

    await api.updateDebtor(id, data);

    selectedDebtor.clear();

    update();
  }

  void fetchDebitur() async {
    loadingFetch.value = true;

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        listDebtor.value = await DebtorService().getDebtors();
        loadingFetch.value = false;
        listDebtor.refresh();
      },
    );

    update();
  }

  void filterDebtor() async {
    await FilterListDialog.display<Debtor>(
      headlineText: 'Cari disini',
      applyButtonText: 'Pilih',
      enableOnlySingleSelection: true,
      Get.context!,
      hideSelectedTextCount: true,
      listData: listDebtor,
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

        Navigator.pop(Get.context!);
      },
    );
  }

  @override
  void onInit() {
    fetchDebitur();
    super.onInit();
  }

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
    super.onReady();
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
    'SMP',
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
