// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/service/debtor_service.dart';
import '../../../models/debtor.dart';

class DebiturDeployController extends GetxController {
  Debtor debtor = Debtor();

  final formKey = GlobalKey<FormBuilderState>();

  final isInputDebiturProcessing = false.obs;

  final peminjam1 = TextEditingController().obs;
  final peminjam2 = TextEditingController().obs;
  final peminjam3 = TextEditingController().obs;
  final peminjam4 = TextEditingController().obs;
  final ktp1 = TextEditingController().obs;
  final ktp2 = TextEditingController().obs;
  final pemilikAgunan1 = TextEditingController().obs;
  final pemilikAgunan2 = TextEditingController().obs;
  final noKtp1 = TextEditingController().obs;
  final noKtp2 = TextEditingController(text: '0').obs;
  final noHp = TextEditingController().obs;

  final alamat1 = TextEditingController().obs;
  final alamat2 = TextEditingController().obs;
  final alamat3 = TextEditingController().obs;
  final alamat4 = TextEditingController().obs;

  final tempatLahir = TextEditingController().obs;
  final tanggalLahir = DateTime.now().obs;
  final umur = TextEditingController().obs;
  final statusKeluargaInput = ''.obs;
  final jumlahTanggungan = TextEditingController().obs;
  final npwp = TextEditingController().obs;

  final lamanyaBerusaha = TextEditingController().obs;
  final lokasiUsaha = TextEditingController().obs;
  final bidangUsaha = TextEditingController().obs;
  final jenisUsahaInput = ''.obs;
  final jumlahKaryawan = TextEditingController().obs;

  final pendidikanInput = ''.obs;

  final pekerjaan1 = TextEditingController().obs;
  final pekerjaan2 = TextEditingController().obs;

  final noSkpk = TextEditingController(text: '0').obs;
  final tanggalSekarangInput = DateTime.now().obs;
  final deskripsiDebitur = TextEditingController().obs;

  final penginput = TextEditingController().obs;

  void saveDebtor() {
    final body = {
      'userId': penginput.value.text,
      'peminjam1': peminjam1.value.text,
      'ktp1': ktp1.value.text,
      'peminjam2': peminjam2.value.text,
      'peminjam3': peminjam3.value.text,
      'peminjam4': peminjam4.value.text,
      'ktp2': ktp2.value.text,
      'pemilik_agunan_1': pemilikAgunan1.value.text,
      'no_ktp1': noKtp1.value.text,
      'pemilik_agunan_2': pemilikAgunan2.value.text,
      'no_ktp2': noKtp2.value.text,
      'no_hp': noHp.value.text,
      'alamat_1': alamat1.value.text,
      'alamat_2': alamat2.value.text,
      'alamat_3': alamat3.value.text,
      'alamat_4': alamat4.value.text,
      'tempat_lahir': tempatLahir.value.text,
      'tanggal_lahir': tanggalLahir.value.toString(),
      'umur': umur.value.text,
      'status_keluarga': statusKeluargaInput.value.toString(),
      'jumlah_tanggungan': jumlahTanggungan.value.text,
      'npwp': npwp.value.text,
      'lamanya_berusaha': lamanyaBerusaha.value.text,
      'lokasi_usaha': lokasiUsaha.value.text,
      'jenis_usaha': jenisUsahaInput.value.toString(),
      'bidang_usaha': bidangUsaha.value.text,
      'jumlah_karyawan': jumlahKaryawan.value.text,
      'pendidikan': pendidikanInput.value.toString(),
      'pekerjaan1': pekerjaan1.value.text,
      'pekerjaan2': pekerjaan2.value.text,
      'no_skpk': noSkpk.value.text,
      'tgl_sekarang': tanggalSekarangInput.value.toString(),
      'deskripsi_debitur': deskripsiDebitur.value.text,
    };

    try {
      isInputDebiturProcessing(true);
      DebtorService().addDebtor(body).then((resp) {
        isInputDebiturProcessing(false);
        clearForm();
        Get.snackbar(
          'Success',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (err) {
        isInputDebiturProcessing(false);
        Get.snackbar(
          'Error',
          'Data gagal disimpan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void clearForm() {
    penginput.value.clear();
    peminjam1.value.clear();
    peminjam2.value.clear();
    peminjam3.value.clear();
    peminjam4.value.clear();
    ktp1.value.clear();
    ktp2.value.clear();
    pemilikAgunan1.value.clear();
    pemilikAgunan2.value.clear();
    noKtp1.value.clear();
    noKtp2.value.clear();
    noHp.value.clear();
    alamat1.value.clear();
    alamat2.value.clear();
    alamat3.value.clear();
    alamat4.value.clear();
    tempatLahir.value.clear();
    tanggalLahir.value = DateTime.now();
    umur.value.clear();
    statusKeluargaInput.value = '';
    jumlahTanggungan.value.clear();
    npwp.value.clear();
    lamanyaBerusaha.value.clear();
    lokasiUsaha.value.clear();
    bidangUsaha.value.clear();
    jenisUsahaInput.value = '';
    jumlahKaryawan.value.clear();
    pendidikanInput.value = '';
    pekerjaan1.value.clear();
    pekerjaan2.value.clear();
    noSkpk.value.clear();
    tanggalSekarangInput.value = DateTime.now();
    deskripsiDebitur.value.clear();
  }

  void generateDescription() {
    deskripsiDebitur.value.text =
        'Pemohon memiliki usaha ${bidangUsaha.value.text} yang beralamat ${lokasiUsaha.value.text}. Usaha tersebut sudah dikelola selama ${lamanyaBerusaha.value.text} tahun yang lalu dan saat ini debitur memiliki ${jumlahKaryawan.value.text} karyawan untuk membantu dalam menjalankan usahanya. Status Keluarga Pemohon saat ini ${statusKeluargaInput.value.toString()} dengan jumlah tanggungan ${jumlahTanggungan.value.text} orang. Pemohon memiliki pendidikan ${pendidikanInput.value} dan pekerjaan ${pekerjaan1.value.text}';
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
