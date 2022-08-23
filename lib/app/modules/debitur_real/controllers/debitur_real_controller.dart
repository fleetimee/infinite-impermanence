import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/service/debtor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DebiturRealController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    fetchDebitur();
    // fetch debitur
    refreshController.loadComplete();
  }

  final listDebtor = <Debtor>[].obs;
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
  final statusKeluarga = TextEditingController().obs;

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

  // For edit
  final peminjam1Edit = TextEditingController().obs;
  final peminjam2Edit = TextEditingController().obs;
  final ktp1Edit = TextEditingController().obs;
  final ktp2Edit = TextEditingController().obs;

  // For edit

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
      'status_keluarga': statusKeluarga.value.text,
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

  void editDebitur(String id) {
    final api = DebtorService();
    final data = {
      'peminjam1': peminjam1Edit.value.text,
    };
    api.updateDebtor(
      id,
      data,
    );

    fetchDebitur();

    update();
  }

  void fetchDebitur() async {
    loadingFetch.value = true;

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        listDebtor.value = await DebtorService().getDebtors();
        loadingFetch.value = false;
      },
    );
    update();
  }

  @override
  void onInit() {
    fetchDebitur();
    super.onInit();
  }

  @override
  void onClose() {
    super.onReady();
  }

  final jenisUsaha = [
    const DropdownMenuItem(
      value: 'Pertanian',
      child: Text('Pertanian'),
    ),
    const DropdownMenuItem(
      value: 'Perikanan',
      child: Text('Perikanan'),
    ),
    const DropdownMenuItem(
      value: 'Pertambangan',
      child: Text('Pertambangan'),
    ),
    const DropdownMenuItem(
      value: 'Perindustrian',
      child: Text('Perindustrian'),
    ),
    const DropdownMenuItem(
      value: 'Listrik',
      child: Text('Listrik'),
    ),
    const DropdownMenuItem(
      value: 'Gas',
      child: Text('Gas'),
    ),
    const DropdownMenuItem(
      value: 'Air',
      child: Text('Air'),
    ),
    const DropdownMenuItem(
      value: 'Kontruksi',
      child: Text('Kontruksi'),
    ),
    const DropdownMenuItem(
      value: 'Perdagangan',
      child: Text('Perdagangan'),
    ),
    const DropdownMenuItem(
      value: 'Pengangkutan',
      child: Text('Pengangkutan'),
    ),
    const DropdownMenuItem(
      value: 'Perdagangan',
      child: Text('Perdagangan'),
    ),
    const DropdownMenuItem(
      value: 'Komunikasi',
      child: Text('Komunikasi'),
    ),
    const DropdownMenuItem(
      value: 'Jasa Dunia Usaha',
      child: Text('Jasa Dunia Usaha'),
    ),
    const DropdownMenuItem(
      value: 'Jasa Sosial',
      child: Text('Jasa Sosial'),
    ),
    const DropdownMenuItem(
      value: 'Lain - Lain',
      child: Text('Lain Lain'),
    ),
  ];

  final pendidikan = [
    const DropdownMenuItem(
      value: 'Tidak Sekolah',
      child: Text('Tidak Sekolah'),
    ),
    const DropdownMenuItem(
      value: 'SD',
      child: Text('SD'),
    ),
    const DropdownMenuItem(
      value: 'SMP',
      child: Text('SMP'),
    ),
    const DropdownMenuItem(
      value: 'SMA',
      child: Text('SMA'),
    ),
    const DropdownMenuItem(
      value: 'D1',
      child: Text('D1'),
    ),
    const DropdownMenuItem(
      value: 'D2',
      child: Text('D2'),
    ),
    const DropdownMenuItem(
      value: 'D3',
      child: Text('D3'),
    ),
    const DropdownMenuItem(
      value: 'D4',
      child: Text('D4'),
    ),
    const DropdownMenuItem(
      value: 'S1',
      child: Text('S1'),
    ),
    const DropdownMenuItem(
      value: 'S2',
      child: Text('S2'),
    ),
    const DropdownMenuItem(
      value: 'S3',
      child: Text('S3'),
    ),
  ];
}
