import 'package:get/get.dart';

import '../modules/agunan/bindings/agunan_binding.dart';
import '../modules/agunan/views/agunan_view.dart';
import '../modules/bisnis_analisis/bindings/bisnis_analisis_binding.dart';
import '../modules/bisnis_analisis/views/bisnis_analisis_view.dart';
import '../modules/create_debitur/bindings/create_debitur_binding.dart';
import '../modules/create_debitur/views/create_debitur_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/karakter_analisis/bindings/karakter_analisis_binding.dart';
import '../modules/karakter_analisis/views/karakter_analisis_view.dart';
import '../modules/penghasilan_tetap/bindings/penghasilan_tetap_binding.dart';
import '../modules/penghasilan_tetap/views/penghasilan_tetap_view.dart';
import '../modules/penghasilan_xtetap/bindings/penghasilan_xtetap_binding.dart';
import '../modules/penghasilan_xtetap/views/penghasilan_xtetap_view.dart';
import '../modules/pro_pengajuan_approve/bindings/pro_pengajuan_approve_binding.dart';
import '../modules/pro_pengajuan_approve/views/pro_pengajuan_approve_view.dart';
import '../modules/search_nik/bindings/search_nik_binding.dart';
import '../modules/search_nik/views/search_nik_view.dart';
import '../modules/uploads/bindings/uploads_binding.dart';
import '../modules/uploads/views/uploads_view.dart';

// ignore_for_file: prefer_const_constructors

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SEARCH_NIK,
      page: () => SearchNikView(),
      binding: SearchNikBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CREATE_DEBITUR,
      page: () => CreateDebiturView(),
      binding: CreateDebiturBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PENGHASILAN_TETAP,
      page: () => const PenghasilanTetapView(),
      binding: PenghasilanTetapBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PENGHASILAN_XTETAP,
      page: () => const PenghasilanXtetapView(),
      binding: PenghasilanXtetapBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.UPLOADS,
      page: () => const UploadsView(),
      binding: UploadsBinding(),
    ),
    GetPage(
      name: _Paths.PRO_PENGAJUAN_APPROVE,
      page: () => const ProPengajuanApproveView(),
      binding: ProPengajuanApproveBinding(),
    ),
    GetPage(
      name: _Paths.AGUNAN,
      page: () => const AgunanView(),
      binding: AgunanBinding(),
    ),
    GetPage(
      name: _Paths.BISNIS_ANALISIS,
      page: () => const BisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.KARAKTER_ANALISIS,
      page: () => const KarakterAnalisisView(),
      binding: KarakterAnalisisBinding(),
    ),
  ];
}
