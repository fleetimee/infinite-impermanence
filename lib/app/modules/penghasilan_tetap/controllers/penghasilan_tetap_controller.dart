// ignore_for_file: unnecessary_overrides

import 'package:akm/app/modules/penghasilan_tetap/views/components/step_one_form.dart';
import 'package:akm/app/modules/penghasilan_tetap/views/components/step_two_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class PenghasilanTetapController extends GetxController {
  // Form Related
  // final formKey = GlobalKey<FormBuilderState>();

  List<GlobalKey<FormBuilderState>> formKeys = [
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
  ];

  /// The above function calculates the remaining income of the applicant.
  void calCalculateSisaPenghasilan() {
    final penghasilan = int.tryParse(penghasilanPemohonController.text);
    final pengeluaran = int.tryParse(potonganGajiController.text);
    final sisaPenghasilan = penghasilan! - pengeluaran!;
    sisaPenghasilanController.text = sisaPenghasilan.toString();
  }

  // Stepper
  final currentStep = 0.obs;

  // Default value for Dropdown
  final jenisPengajuanValue = ''.obs;
  final jenisPenggunaanValue = ''.obs;

  // Date Controller
  final jangkaWaktuStart = DateTime.now().obs;
  final jangkaWaktuEnd = DateTime.now().obs;

  // Pengajuan Controller
  final plafonFasilitasController = TextEditingController();
  final jangkaWaktuController = TextEditingController();
  final tujuanPenggunaanController = TextEditingController();
  final jangkaWaktuPengajuan = TextEditingController();

  // Net Worth Controller
  final penghasilanPemohonController = TextEditingController();
  final potonganGajiController = TextEditingController();
  final sisaPenghasilanController = TextEditingController();
  final namaPejabatPenanggungJawabController = TextEditingController();
  final jabatanPejabatPenanggungJawabController = TextEditingController();
  final namaPejabatPemotongGajiController = TextEditingController();
  final jabatanPejabatPemotongGajiController = TextEditingController();

  // History
  final noRekeningController = TextEditingController();
  final tanggalMulaiKreditController = TextEditingController();
  final jangkaWaktuKreditController = TextEditingController();
  final plafonKreditController = TextEditingController();

  // DebiturID
  final debiturID = ''.obs;

  List<Step> getSteps() => [
        Step(
          title: const Icon(Icons.person),
          content: StepOneForm(),
          isActive: true,
        ),
        Step(
          title: const Icon(Icons.attach_money),
          content: StepTwoForm(),
          isActive: true,
        ),
        const Step(
          title: Icon(Icons.history),
          content: Text('Step 3 content'),
          isActive: true,
        ),
      ];
}
