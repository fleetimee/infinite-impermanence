// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/modules/list_debitur/controllers/list_debitur_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import '../../../models/debtor.dart';
import '../../../service/debtor_service.dart';

class DebiturRealController extends GetxController {
  Debtor debtor = Debtor();

  final formKey = GlobalKey<FormBuilderState>();

  var page = 1;
  var sort = 'id,ASC';

  var isInputDebiturProcessing = false;

  final peminjam1 = TextEditingController().obs;
  final peminjam2 = TextEditingController().obs;
  final peminjam3 = TextEditingController().obs;
  final peminjam4 = TextEditingController().obs;
  final ktp1 = TextEditingController().obs;
  final ktp2 = TextEditingController().obs;
  final pemilikAgunan1 = TextEditingController().obs;
  final pemilikAgunan2 = TextEditingController().obs;
  final noKtp1 = TextEditingController().obs;
  final noKtp2 = TextEditingController().obs;
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

  final searchBox = TextEditingController().obs;

  final loadingFetch = false.obs;

  final listDebiturController = Get.put(ListDebiturController());

  final debiturController = Get.put(InsightDebiturController());

  void editDebitur(String id) async {
    final body = {
      'peminjam1': peminjam1.value.text,
      'ktp1': ktp1.value.text,
      'peminjam2': peminjam2.value.text,
      'ktp2': ktp2.value.text,
      'peminjam3': peminjam3.value.text,
      'peminjam4': peminjam4.value.text,
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
      debiturController.isDataLoading(true);
      DebtorService().updateDebtor(id, body).then((resp) {
        debiturController.isDataLoading(false);
        listDebiturController.getAllDebitur(page.toString(), sort);
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
  }

  void generateDescription() {
    deskripsiDebitur.value.text =
        'Pemohon memiliki usaha ${bidangUsaha.value.text} yang beralamat ${lokasiUsaha.value.text}. Usaha tersebut sudah dikelola selama ${lamanyaBerusaha.value.text} tahun yang lalu dan saat ini debitur memiliki ${jumlahKaryawan.value.text} karyawan untuk membantu dalam menjalankan usahanya. Status Keluarga Pemohon saat ini ${statusKeluargaInput.value.toString()} dengan jumlah tanggungan ${jumlahTanggungan.value.text} orang. Pemohon memiliki pendidikan ${pendidikanInput.value} dan pekerjaan ${pekerjaan1.value.text}';
  }

  void clearForm() {
    peminjam1.value.text = '';
    ktp1.value.text = '';
    peminjam2.value.text = '';
    ktp2.value.text = '';
    pemilikAgunan1.value.text = '';
    noKtp1.value.text = '';
    pemilikAgunan2.value.text = '';
    noKtp2.value.text = '';
    noHp.value.text = '';
    alamat1.value.text = '';
    alamat2.value.text = '';
    alamat3.value.text = '';
    alamat4.value.text = '';
    tempatLahir.value.text = '';
    tanggalLahir.value = DateTime.now();
    umur.value.text = '';
    statusKeluargaInput.value = '';
    jumlahTanggungan.value.text = '';
    npwp.value.text = '';
    lamanyaBerusaha.value.text = '';
    lokasiUsaha.value.text = '';
    bidangUsaha.value.text = '';
    jenisUsahaInput.value = '';
    jumlahKaryawan.value.text = '';
    pendidikanInput.value = '';
    pekerjaan1.value.text = '';
    pekerjaan2.value.text = '';
    noSkpk.value.text = '0';
    tanggalSekarangInput.value = DateTime.now();
    deskripsiDebitur.value.text = '';
  }

  final faker = Faker.instance;

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
