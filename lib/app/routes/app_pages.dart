import 'package:akm/app/modules/ijin_legitimasi/views/edit_ijin_legitimasi_view.dart';
import 'package:akm/app/modules/ijin_legitimasi/views/lihat_ijin_legitimasi_view.dart';
import 'package:get/get.dart';

import '../modules/agunan/bindings/agunan_binding.dart';
import '../modules/agunan/views/agunan_view.dart';
import '../modules/agunan_analisis/bindings/agunan_analisis_binding.dart';
import '../modules/agunan_analisis/views/agunan_analisis_view.dart';
import '../modules/agunan_analisis/views/lihat_agunan_analisis_view_view.dart';
import '../modules/agunan_analisis_calc/bindings/agunan_analisis_calc_binding.dart';
import '../modules/agunan_analisis_calc/views/agunan_analisis_calc_view.dart';
import '../modules/agunan_form_onboarding/bindings/agunan_form_onboarding_binding.dart';
import '../modules/agunan_form_onboarding/views/agunan_form_onboarding_view.dart';
import '../modules/agunan_pilih/bindings/agunan_pilih_binding.dart';
import '../modules/agunan_pilih/views/agunan_pilih_view.dart';
import '../modules/bisnis_analisis/bindings/bisnis_analisis_binding.dart';
import '../modules/bisnis_analisis/views/bisnis_analisis_view.dart';
import '../modules/bisnis_analisis/views/edit_bisnis_analisis_view.dart';
import '../modules/bisnis_analisis/views/lihat_bisnis_analisis_view.dart';
import '../modules/debitur_deploy/bindings/debitur_deploy_binding.dart';
import '../modules/debitur_deploy/views/debitur_deploy_view.dart';
import '../modules/debitur_real/bindings/debitur_real_binding.dart';
import '../modules/debitur_real/views/debitur_edit_view.dart';
import '../modules/debitur_real/views/debitur_onboarding_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/ijin_legitimasi/bindings/ijin_legitimasi_binding.dart';
import '../modules/ijin_legitimasi/views/ijin_legitimasi_view.dart';
import '../modules/input_keuangan/bindings/input_keuangan_binding.dart';
import '../modules/input_keuangan/views/edit_input_keuangan_view.dart';
import '../modules/input_keuangan/views/input_keuangan_view.dart';
import '../modules/input_keuangan/views/lihat_input_keuangan_view.dart';
import '../modules/input_neraca/bindings/input_neraca_binding.dart';
import '../modules/input_neraca/views/edit_neraca_view.dart';
import '../modules/input_neraca/views/input_neraca_view.dart';
import '../modules/input_neraca/views/lihat_neraca_view.dart';
import '../modules/insight_debitur/bindings/insight_debitur_binding.dart';
import '../modules/insight_debitur/views/components/printing/agunan/agunan_preview.dart';
import '../modules/insight_debitur/views/components/printing/bisnis/bisnis_preview.dart';
import '../modules/insight_debitur/views/components/printing/inputan/inputan_preview.dart';
import '../modules/insight_debitur/views/components/printing/jenis_usaha/jenis_usaha_preview.dart';
import '../modules/insight_debitur/views/components/printing/karakter/karakter_preview.dart';
import '../modules/insight_debitur/views/components/printing/keuangan/keuangan_preview.dart';
import '../modules/insight_debitur/views/components/printing/model/model_preview.dart';
import '../modules/insight_debitur/views/components/printing/neraca/neraca_preview.dart';
import '../modules/insight_debitur/views/components/printing/putusan/putusan_preview.dart';
import '../modules/insight_debitur/views/components/printing/rugi_laba/rugi_laba_preview.dart';
import '../modules/insight_debitur/views/components/printing/usulan/usulan_preview.dart';
import '../modules/insight_debitur/views/components/printing/usulan_baru/usulan_baru_preview.dart';
import '../modules/insight_debitur/views/insight_debitur_view.dart';
import '../modules/karakter_analisis/bindings/karakter_analisis_binding.dart';
import '../modules/karakter_analisis/views/edit_karakter_analisis_view.dart';
import '../modules/karakter_analisis/views/karakter_analisis_view.dart';
import '../modules/karakter_analisis/views/lihat_karakter_analisis_view.dart';
import '../modules/keuangan_analisis/bindings/keuangan_analisis_binding.dart';
import '../modules/keuangan_analisis/views/edit_keuangan_analisis_view.dart';
import '../modules/keuangan_analisis/views/keuangan_analisis_view.dart';
import '../modules/keuangan_analisis/views/lihat_keuangan_analisis_view.dart';
import '../modules/list_agunan_cash/bindings/list_agunan_cash_binding.dart';
import '../modules/list_agunan_cash/views/list_agunan_cash_view.dart';
import '../modules/list_agunan_kendaraan/bindings/list_agunan_kendaraan_binding.dart';
import '../modules/list_agunan_kendaraan/views/list_agunan_kendaraan_view.dart';
import '../modules/list_agunan_lainnya/bindings/list_agunan_lainnya_binding.dart';
import '../modules/list_agunan_lainnya/views/list_agunan_lainnya_view.dart';
import '../modules/list_agunan_los/bindings/list_agunan_los_binding.dart';
import '../modules/list_agunan_los/views/list_agunan_los_view.dart';
import '../modules/list_agunan_peralatan/bindings/list_agunan_peralatan_binding.dart';
import '../modules/list_agunan_peralatan/views/list_agunan_peralatan_view.dart';
import '../modules/list_agunan_tanah/bindings/list_agunan_tanah_binding.dart';
import '../modules/list_agunan_tanah/views/list_agunan_tanah_view.dart';
import '../modules/list_agunan_tanah_bangunan/bindings/list_agunan_tanah_bangunan_binding.dart';
import '../modules/list_agunan_tanah_bangunan/views/list_agunan_tanah_bangunan_view.dart';
import '../modules/list_debitur/bindings/list_debitur_binding.dart';
import '../modules/list_debitur/views/list_debitur_view.dart';
import '../modules/list_syarat_lainnya/bindings/list_syarat_lainnya_binding.dart';
import '../modules/list_syarat_lainnya/views/list_syarat_lainnya_view.dart';
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
import '../modules/usaha_analisis/views/edit_usaha_analisis_view.dart';
import '../modules/usaha_analisis/views/lihat_usaha_analisis_view.dart';
import '../modules/usaha_analisis/views/usaha_analisis_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SEARCH_NIK,
      page: () => const SearchNikView(),
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
      name: _Paths.EDIT_BISNIS_ANALISIS,
      page: () => EditBisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.INPUT_PRINT,
      page: () => InputPreview(),
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
      name: _Paths.EDIT_KARAKTER_ANALISIS,
      page: () => EditKarakterAnalisisView(),
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
      name: _Paths.EDIT_KEUANGAN_ANALISIS,
      page: () => EditLihatKeuanganAnalisisView(),
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
      page: () => const DebiturOnboardingView(),
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
      name: _Paths.INPUT_KEUANGAN,
      page: () => InputKeuanganView(),
      binding: InputKeuanganBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LIHAT_KEUANGAN,
      page: () => LihatInputKeuanganView(),
      binding: InputKeuanganBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.EDIT_KEUANGAN,
      page: () => EditInputKeuanganView(),
      binding: InputKeuanganBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PORSEKOT_TABLE,
      page: () => const PorsekotTableView(),
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
      name: _Paths.EDIT_USAHA_ANALISIS,
      page: () => EditUsahaAnalisisView(),
      binding: UsahaAnalisisBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_USAHA,
      page: () => JenisUsahaPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_NERACA,
      page: () => NeracaPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_AGUNAN,
      page: () => AgunanPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_RUGILABA,
      page: () => RugiLabaPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_MODEL,
      page: () => ModelPreview(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PRINT_USULAN,
      page: () => UsulanPreview(),
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
    GetPage(
      name: _Paths.INSIGHT_DEBITUR,
      page: () => InsightDebiturView(),
      binding: InsightDebiturBinding(),
    ),
    GetPage(
      name: _Paths.AGUNAN_PILIH,
      page: () => AgunanPilihView(),
      binding: AgunanPilihBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_TANAH,
      page: () => ListAgunanTanahView(),
      binding: ListAgunanTanahBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_TANAH_BANGUNAN,
      page: () => ListAgunanTanahBangunanView(),
      binding: ListAgunanTanahBangunanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_KENDARAAN,
      page: () => ListAgunanKendaraanView(),
      binding: ListAgunanKendaraanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_PERALATAN,
      page: () => ListAgunanPeralatanView(),
      binding: ListAgunanPeralatanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_CASH,
      page: () => ListAgunanCashView(),
      binding: ListAgunanCashBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_LOS,
      page: () => ListAgunanLosView(),
      binding: ListAgunanLosBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AGUNAN_LAINNYA,
      page: () => ListAgunanLainnyaView(),
      binding: ListAgunanLainnyaBinding(),
    ),
    GetPage(
      name: _Paths.AGUNAN_FORM_ONBOARDING,
      page: () => AgunanFormOnboardingView(),
      binding: AgunanFormOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LIST_SYARAT_LAINNYA,
      page: () => ListSyaratLainnyaView(),
      binding: ListSyaratLainnyaBinding(),
    ),
    GetPage(
      name: _Paths.AGUNAN_ANALISIS,
      page: () => AgunanAnalisisView(),
      binding: AgunanAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_AGUNAN_ANALISIS,
      page: () => LihatAgunanAnalisisViewView(),
      binding: AgunanAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.AGUNAN_ANALISIS_CALC,
      page: () => AgunanAnalisisCalcView(),
      binding: AgunanAnalisisCalcBinding(),
    ),
    GetPage(
      name: _Paths.DEBITUR_DEPLOY,
      page: () => const DebiturDeployView(),
      binding: DebiturDeployBinding(),
    ),
    GetPage(
      name: _Paths.IJIN_LEGITIMASI,
      page: () => IjinLegitimasiView(),
      binding: IjinLegitimasiBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_IJIN_LEGITIMASI,
      page: () => LihatIjinLegitimasiView(),
      binding: IjinLegitimasiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_IJIN_LEGITIMASI,
      page: () => EditIjinLegitimasiView(),
      binding: IjinLegitimasiBinding(),
    ),
  ];
}
