// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:akm/app/modules/penghasilan_tetap/views/components/step_one_form.dart';
import 'package:akm/app/modules/penghasilan_tetap/views/components/step_three_form.dart';
import 'package:akm/app/modules/penghasilan_tetap/views/components/step_two_form.dart';
import 'package:akm/app/modules/penghasilan_tetap/views/components/step_zero_form.dart';

class PenghasilanTetapController extends GetxController {
  // Form Related
  // final formKey = GlobalKey<FormBuilderState>();

  List<GlobalKey<FormBuilderState>> formKeys = [
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
  ];

  // Switch riwayat peminjaman
  RxBool isPernahPinjam = false.obs;

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
  final debiturId = ''.obs;

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: const Icon(Icons.check),
            content: const StepZeroForm(),
            isActive: currentStep >= 0),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: const Icon(Icons.person),
          content: StepOneForm(),
          isActive: currentStep >= 1,
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          title: const Icon(Icons.attach_money),
          content: StepTwoForm(),
          isActive: currentStep >= 2,
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          title: const Icon(Icons.history),
          content: StepThreeForm(),
          isActive: currentStep >= 3,
        ),
      ];
}
