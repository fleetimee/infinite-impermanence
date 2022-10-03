import 'package:get/get.dart';

import '../modules/agunan/bindings/agunan_binding.dart';
import '../modules/agunan/views/agunan_view.dart';
import '../modules/bisnis_analisis/bindings/bisnis_analisis_binding.dart';
import '../modules/bisnis_analisis/views/bisnis_analisis_view.dart';
import '../modules/bisnis_analisis/views/lihat_bisnis_analisis_view.dart';
import '../modules/debitur_detail_banget/bindings/debitur_detail_banget_binding.dart';
import '../modules/debitur_detail_banget/views/debitur_detail_banget_view.dart';
import '../modules/debitur_real/bindings/debitur_real_binding.dart';
import '../modules/debitur_real/views/components/printing/bisnis/bisnis_preview.dart';
import '../modules/debitur_real/views/components/printing/jenis_usaha/jenis_usaha_preview.dart';
import '../modules/debitur_real/views/components/printing/karakter/karakter_preview.dart';
import '../modules/debitur_real/views/components/printing/keuangan/keuangan_preview.dart';
import '../modules/debitur_real/views/components/printing/model/model_preview.dart';
import '../modules/debitur_real/views/components/printing/putusan/putusan_preview.dart';
import '../modules/debitur_real/views/components/printing/usulan_baru/usulan_baru_preview.dart';
import '../modules/debitur_real/views/debitur_edit_view.dart';
import '../modules/debitur_real/views/debitur_list_view.dart';
import '../modules/debitur_real/views/debitur_onboarding_view.dart';
import '../modules/debitur_real/views/debitur_real_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/input_keuangan/bindings/input_keuangan_binding.dart';
import '../modules/input_keuangan/views/input_keuangan_view.dart';
import '../modules/input_keuangan/views/lihat_input_keuangan_view.dart';
import '../modules/input_neraca/bindings/input_neraca_binding.dart';
import '../modules/input_neraca/views/edit_neraca_view.dart';
import '../modules/input_neraca/views/input_neraca_view.dart';
import '../modules/input_neraca/views/lihat_neraca_view.dart';
import '../modules/karakter_analisis/bindings/karakter_analisis_binding.dart';
import '../modules/karakter_analisis/views/karakter_analisis_view.dart';
import '../modules/karakter_analisis/views/lihat_karakter_analisis_view.dart';
import '../modules/keuangan_analisis/bindings/keuangan_analisis_binding.dart';
import '../modules/keuangan_analisis/views/keuangan_analisis_view.dart';
import '../modules/keuangan_analisis/views/lihat_keuangan_analisis_view.dart';
import '../modules/list_debitur/bindings/list_debitur_binding.dart';
import '../modules/list_debitur/views/list_debitur_view.dart';
import '../modules/porsekot_table/bindings/porsekot_table_binding.dart';
import '../modules/porsekot_table/views/porsekot_table_view.dart';
import '../modules/rugi_laba/bindings/rugi_laba_binding.dart';
import '../modules/rugi_laba/views/edit_rugi_laba_view.dart';
import '../modules/rugi_laba/views/rugi_laba_view.dart';
import '../modules/rugi_laba/views/view_rugi_laba_view.dart';
import '../modules/search_nik/bindings/search_nik_binding.dart';
import '../modules/search_nik/views/search_nik_view.dart';
import '../modules/simulasi_tetap/bindings/simulasi_tetap_binding.dart';
import '../modules/simulasi_tetap/views/simulasi_tetap_view.dart';
import '../modules/uploads/bindings/uploads_binding.dart';
import '../modules/uploads/views/uploads_view.dart';
import '../modules/usaha_analisis/bindings/usaha_analisis_binding.dart';
import '../modules/usaha_analisis/views/lihat_usaha_analisis_view.dart';
import '../modules/usaha_analisis/views/usaha_analisis_view.dart';

// 📦 Package imports:

// 🌎 Project imports:

// 📦 Package imports:

// 🌎 Project imports:

// import '../modules/debitur_real/views/debitur_detail_view.dart';

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
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.UPLOADS,
      page: () => const UploadsView(),
      binding: UploadsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.AGUNAN,
      page: () => const AgunanView(),
      binding: AgunanBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.BISNIS_ANALISIS,
      page: () => BisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LIHAT_BISNIS_ANALISIS,
      page: () => LihatBisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.BISNIS_PRINT,
      page: () => BisnisPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.KARAKTER_ANALISIS,
      page: () => KarakterAnalisisView(),
      binding: KarakterAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LIHAT_KARAKTER_ANALISIS,
      page: () => LihatKarakterAnalisisView(),
      binding: KarakterAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.KARAKTER_PRINT,
      page: () => KarakterPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.KEUANGAN_ANALISIS,
      page: () => KeuanganAnalisisView(),
      binding: KeuanganAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LIHAT_KEUANGAN_ANALISIS,
      page: () => LihatKeuanganAnalisisView(),
      binding: KeuanganAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.KEUANGAN_PRINT,
      page: () => KeuanganPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.DEBITUR_REAL,
      page: () => DebiturOnboardingView(),
      binding: DebiturRealBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ADD_DEBITUR,
      page: () => DebiturRealView(),
      binding: DebiturRealBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.DEBITUR_LIST,
      page: () => DebiturListView(),
      binding: DebiturRealBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.DEBITUR_EDIT,
      page: () => DebiturEditView(),
      binding: DebiturRealBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.DEBITUR_DETAIL_BANGET,
      page: () => DebiturDetailBangetView(),
      binding: DebiturDetailBangetBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.INPUT_KEUANGAN,
      page: () => InputKeuanganView(),
      binding: InputKeuanganBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: _Paths.LIHAT_KEUANGAN,
        page: () => LihatInputKeuanganView(),
        binding: InputKeuanganBinding(),
        transition: Transition.cupertino),
    GetPage(
      name: _Paths.PORSEKOT_TABLE,
      page: () => PorsekotTableView(),
      binding: PorsekotTableBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.INPUT_NERACA,
      page: () => InputNeracaView(),
      binding: InputNeracaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LIHAT_NERACA,
      page: () => LihatneracaView(),
      binding: InputNeracaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.EDIT_NERACA,
      page: () => EditNeracaView(),
      binding: InputNeracaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.RUGI_LABA,
      page: () => RugiLabaView(),
      binding: RugiLabaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.VIEW_RUGI_LABA,
      page: () => LihatRugiLabaView(),
      binding: RugiLabaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.EDIT_RUGI_LABA,
      page: () => EditRugiLabaView(),
      binding: RugiLabaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.USAHA_ANALISIS,
      page: () => UsahaAnalisisView(),
      binding: UsahaAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LIHAT_USAHA_ANALISIS,
      page: () => LihatUsahaAnalisisView(),
      binding: UsahaAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_USAHA,
      page: () => JenisUsahaPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_MODEL,
      page: () => ModelPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_PUTUSAN,
      page: () => PutusanPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_USULAN_BARU,
      page: () => UsulanBaruPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.SIMULASI_TETAP,
      page: () => const SimulasiTetapView(),
      binding: SimulasiTetapBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DEBITUR,
      page: () => const ListDebiturView(),
      binding: ListDebiturBinding(),
    ),
  ];
}
