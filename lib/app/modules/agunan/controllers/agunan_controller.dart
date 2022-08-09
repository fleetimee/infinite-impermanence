// ignore_for_file: unnecessary_overrides

import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgunanController extends GetxController {
  final isCheckedTanah = false.obs;
  final isCheckedTanahAndBangunan = false.obs;
  final isCheckedMesinAndPeralatan = false.obs;
  final isCheckedKendaraan = false.obs;
  final isCheckedCashCollateral = false.obs;
  final isCheckedKios = false.obs;
  final isCheckedLainnya = false.obs;
  final isExpanded = false.obs;

  final tanahInput = TextEditingController();
  final tanahAndBangunanInput = TextEditingController();
  final mesinAndPeralatanInput = TextEditingController();
  final kendaraanInput = TextEditingController();
  final cashCollateralInput = TextEditingController();
  final kiosInput = TextEditingController();
  final lainnyaInput = TextEditingController();

  // Make tanah key
  final tanahKey = GlobalKey<FormBuilderState>();
}
