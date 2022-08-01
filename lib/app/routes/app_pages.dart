import 'package:get/get.dart';

import '../modules/create_debitur/bindings/create_debitur_binding.dart';
import '../modules/create_debitur/views/create_debitur_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/penghasilan_tetap/bindings/penghasilan_tetap_binding.dart';
import '../modules/penghasilan_tetap/views/penghasilan_tetap_view.dart';
import '../modules/penghasilan_xtetap/bindings/penghasilan_xtetap_binding.dart';
import '../modules/penghasilan_xtetap/views/penghasilan_xtetap_view.dart';
import '../modules/search_nik/bindings/search_nik_binding.dart';
import '../modules/search_nik/views/search_nik_view.dart';

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
  ];
}
