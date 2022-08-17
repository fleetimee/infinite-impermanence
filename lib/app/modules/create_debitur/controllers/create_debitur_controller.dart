// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/create_debitur/views/components/step_five_form.dart';
import 'package:akm/app/modules/create_debitur/views/components/step_four_form.dart';
import 'package:akm/app/modules/create_debitur/views/components/step_six_form.dart';
import 'package:akm/app/modules/create_debitur/views/components/step_three_form.dart';
import 'package:akm/app/modules/create_debitur/views/components/step_two_form.dart';
import 'package:akm/app/service/add_debitur.dart';
import '../views/components/step_one_form.dart';

class CreateDebiturController extends GetxController {
  /// This is a list of GlobalKey<FormState> that will be used to validate the form.
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  // Loading
  final isSuccess = false;

  // Default value for current step
  final currentStep = 0.obs;
  final lastStep = false.obs;

  // Default value for Dropdown
  final genderValue = ''.obs;
  final agamaController = ''.obs;
  final hubunganValue = ''.obs;
  final tanggalLahirValue = ''.obs;

  // Data Pribadi Value Controller
  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final namaIbuController = TextEditingController();

  // Data Kontak Value Controller
  final noHpIndonesiaController =
      MaskedTextController(mask: '(0000) 0000-0000');
  final noSelularIndonesiaController =
      MaskedTextController(mask: '(000) 0000-0000');
  final emailController = TextEditingController();

  // Data Finansial Value Controller
  final moneyController = MoneyMaskedTextController(
    leftSymbol: 'Rp   ',
    thousandSeparator: '.',
    rightSymbol: '',
  );
  final bidangUsahaController = TextEditingController();
  final jumlahTanggunganController = TextEditingController();

  // Data Relasi Debitur Controller
  final namaPasanganController = TextEditingController();
  final pekerjaanPasanganController = TextEditingController();
  final nikPasanganController = TextEditingController();
  final tempatLahirPasanganController = TextEditingController();
  final tanggalLahirPasanganController = TextEditingController();

  // Data Karier Value Controller
  final namaInstansiController = TextEditingController();
  final pekerjaanController = TextEditingController();

  // Data Lokasi Value Controller
  final provinsiController = TextEditingController();
  final kabupatenController = TextEditingController();
  final kecamatanController = TextEditingController();
  final kelurahanController = TextEditingController();
  final rtController = TextEditingController();
  final rwController = TextEditingController();
  final kodePosController = TextEditingController();

  // Location value
  final provinsiValue = ''.obs;
  final kabupatenValue = ''.obs;
  final kecamatanValue = ''.obs;
  final kelurahanValue = ''.obs;

  // Send Data to the server
  void sendData() {
    // Initialize the service
    final api = ApiService();

    // Get the form data
    final data = {
      'nik': nikController.text,
      'nama_debitur': namaController.text,
      'alamat': alamatController.text,
      'tempat_lahir': tempatLahirController.text,
      'tanggal_lahir': tanggalLahirController.text,
      'agama': agamaController.toString(),
      'gender': genderValue.toString(),
      'nama_ibu': namaIbuController.text,
      'no_telp': noHpIndonesiaController.text,
      'no_seluler': noSelularIndonesiaController.text,
      'email': emailController.text,
      'instansi': namaInstansiController.text,
      'bidang_usaha': bidangUsahaController.text,
      'jumlah_tanggungan': jumlahTanggunganController.text,
      'relationship': hubunganValue.toString(),
      'nama_pasangan': namaPasanganController.text,
      'pekerjaan_pasangan': pekerjaanPasanganController.text,
      'nik_pasangan': nikPasanganController.text,
      'tempat_lahir_pasangan': tempatLahirPasanganController.text,
      'tgl_lahir_pasangan': tanggalLahirPasanganController.text,
      'nama_instansi': namaInstansiController.text,
      'pekerjaan': pekerjaanController.text,
      'provinsi': provinsiController.text,
      'kabupaten': kabupatenController.text,
      'kecamatan': kecamatanController.text,
      'kelurahan': kelurahanController.text,
      'rt': rtController.text,
      'rw': rwController.text,
      'total_income': moneyController.text,
      'kode_pos': kodePosController.text,
    };

    // Send the data to the server and if success add snackbar
    api.addDebitur(data);

    // Add Snackbar
    Get.snackbar(
      'Success',
      'Data berhasil ditambahkan',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          title: const Text('Personal'),
          subtitle: const Text('Data Pribadi Debitur'),
          content: StepOneForm(),
          isActive: currentStep >= 0,
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: const Text('Contact'),
          content: StepTwoForm(),
          subtitle: const Text('Data Kontak Debitur'),
          isActive: currentStep >= 1,
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          title: const Text('Finansial'),
          content: StepThreeForm(),
          isActive: currentStep >= 2,
          subtitle: const Text('Data Finansial Debitur'),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          title: const Text('Relation'),
          content: StepFourForm(),
          subtitle: const Text('Data Relasi Debitur'),
          isActive: currentStep >= 3,
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          title: const Text('Career'),
          content: StepFiveForm(),
          subtitle: const Text('Data Pekerjaan Debitur'),
          isActive: currentStep >= 4,
        ),
        Step(
          state: currentStep > 5 ? StepState.complete : StepState.indexed,
          title: const Text('Location'),
          content: StepSixForm(),
          isActive: currentStep >= 5,
          subtitle: const Text('Data Lokasi Debitur'),
        ),
      ];
}
