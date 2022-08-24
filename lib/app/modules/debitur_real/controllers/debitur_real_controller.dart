import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/models/debtor_details.dart';
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
  final objDebtor = Debtor().obs;

  Debtor debtor = Debtor();
  DebtorDetails debtorDetails = DebtorDetails();

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
    // api.updateDebtor(
    //   id,
    //   data,
    // );

    // fetchDebiturPerId(id);

    // update();

    // fetchDebitur();

    // listDebtor.refresh();

    await api.updateDebtor(id, data);
    fetchDebitur();
    listDebtor.refresh();
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

  // void fetchDebiturById(String id) async {
  //   final api = DebtorService();
  //   final data = await api.getDebtorById(id);

  //   // peminjam1.value = data.peminjam1 as TextEditingController;
  //   // ktp1.value = data.ktp1 as TextEditingController;
  //   // peminjam2.value = data['peminjam2'];
  //   // ktp2.value = data['ktp2'];
  //   // pemilikAgunan1.value = data['pemilik_agunan_1'];
  //   // noKtp1.value = data['no_ktp1'];
  //   // pemilikAgunan2.value = data['pemilik_agunan_2'];
  //   // noKtp2.value = data['no_ktp2'];
  //   // alamat1.value = data['alamat_1'];
  //   // alamat2.value = data['alamat_2'];
  //   // tempatLahir.value = data['tempat_lahir'];
  //   // tanggalLahir.value = data['tanggal_lahir'];
  //   // umur.value = data['umur'];
  //   // statusKeluarga.value = data['status_keluarga'];
  //   // lamanyaBerusaha.value = data['lamanya_berusaha'];
  //   // lokasiUsaha.value = data['lokasi_usaha'];
  //   // jenisUsahaInput.value = data['jenis_usaha'];
  //   // bidangUsaha.value = data['bidang_usaha'];
  //   // pendidikanInput.value = data['pendidikan'];
  //   // pekerjaan1.value = data['pekerjaan1'];
  //   // pekerjaan2.value = data['pekerjaan2'];
  //   // noSkpk.value = data['no_skpk'];
  //   // tanggalSekarangInput.value = data['tgl_sekarang'];
  //   // deskripsiDebitur.value = data['deskripsi_debitur'];
  // }

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
    statusKeluarga.value.dispose();
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
}
