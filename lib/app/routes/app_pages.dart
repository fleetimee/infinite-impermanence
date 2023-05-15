import 'package:get/get.dart';

import '../modules/agunan_analisis/bindings/agunan_analisis_binding.dart';
import '../modules/agunan_analisis/views/agunan_analisis_view.dart';
import '../modules/agunan_analisis/views/lihat_agunan_analisis_view_view.dart';
import '../modules/agunan_analisis_calc/bindings/agunan_analisis_calc_binding.dart';
import '../modules/agunan_analisis_calc/views/agunan_analisis_calc_view.dart';
import '../modules/agunan_form_onboarding/bindings/agunan_form_onboarding_binding.dart';
import '../modules/agunan_form_onboarding/views/agunan_form_onboarding_view.dart';
import '../modules/agunan_pilih/bindings/agunan_pilih_binding.dart';
import '../modules/agunan_pilih/views/agunan_pilih_view.dart';
import '../modules/asuransi/bindings/asuransi_binding.dart';
import '../modules/asuransi/views/asuransi_view.dart';
import '../modules/asuransi/views/edit_asuransi_view.dart';
import '../modules/asuransi/views/lihat_asuransi_view.dart';
import '../modules/bisnis_analisis/bindings/bisnis_analisis_binding.dart';
import '../modules/bisnis_analisis/views/bisnis_analisis_view.dart';
import '../modules/bisnis_analisis/views/edit_bisnis_analisis_view.dart';
import '../modules/bisnis_analisis/views/lihat_bisnis_analisis_view.dart';
import '../modules/crypto/bindings/crypto_binding.dart';
import '../modules/crypto/views/crypto_view.dart';
import '../modules/crypto_detail/bindings/crypto_detail_binding.dart';
import '../modules/crypto_detail/views/crypto_detail_view.dart';
import '../modules/debitur_deploy/bindings/debitur_deploy_binding.dart';
import '../modules/debitur_deploy/views/debitur_deploy_view.dart';
import '../modules/debitur_real/bindings/debitur_real_binding.dart';
import '../modules/debitur_real/views/debitur_edit_view.dart';
import '../modules/debitur_real/views/debitur_onboarding_view.dart';
import '../modules/detail_agunan/bindings/detail_agunan_binding.dart';
import '../modules/detail_agunan/views/detail_agunan_view.dart';
import '../modules/gallery_file/bindings/gallery_file_binding.dart';
import '../modules/gallery_file/views/gallery_file_view.dart';
import '../modules/gallery_image/bindings/gallery_image_binding.dart';
import '../modules/gallery_image/views/gallery_image_view.dart';
import '../modules/gate/bindings/gate_binding.dart';
import '../modules/gate/views/gate_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_pengutus/bindings/home_pengutus_binding.dart';
import '../modules/home_pengutus/views/home_pengutus_view.dart';
import '../modules/home_reviewer/bindings/home_reviewer_binding.dart';
import '../modules/home_reviewer/views/home_reviewer_view.dart';
import '../modules/ijin_legitimasi/bindings/ijin_legitimasi_binding.dart';
import '../modules/ijin_legitimasi/views/edit_ijin_legitimasi_view.dart';
import '../modules/ijin_legitimasi/views/ijin_legitimasi_view.dart';
import '../modules/ijin_legitimasi/views/lihat_ijin_legitimasi_view.dart';
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
import '../modules/insight_debitur/views/components/printing/pk/pk_preview.dart';
import '../modules/insight_debitur/views/components/printing/putusan/putusan_preview.dart';
import '../modules/insight_debitur/views/components/printing/rugi_laba/rugi_laba_preview.dart';
import '../modules/insight_debitur/views/components/printing/slik/slik_preview.dart';
import '../modules/insight_debitur/views/components/printing/spkk/spkk_preview.dart';
import '../modules/insight_debitur/views/components/printing/usulan/usulan_preview.dart';
import '../modules/insight_debitur/views/components/printing/usulan_baru/usulan_baru_preview.dart';
import '../modules/insight_debitur/views/insight_debitur_view.dart';
import '../modules/instagram_feed/bindings/instagram_feed_binding.dart';
import '../modules/instagram_feed/views/instagram_feed_view.dart';
import '../modules/intro-screen/bindings/intro_screen_binding.dart';
import '../modules/intro-screen/views/intro_screen_view.dart';
import '../modules/karakter_analisis/bindings/karakter_analisis_binding.dart';
import '../modules/karakter_analisis/views/edit_karakter_analisis_view.dart';
import '../modules/karakter_analisis/views/karakter_analisis_view.dart';
import '../modules/karakter_analisis/views/lihat_karakter_analisis_view.dart';
import '../modules/keuangan_analisis/bindings/keuangan_analisis_binding.dart';
import '../modules/keuangan_analisis/views/edit_keuangan_analisis_view.dart';
import '../modules/keuangan_analisis/views/keuangan_analisis_view.dart';
import '../modules/keuangan_analisis/views/lihat_keuangan_analisis_view.dart';
import '../modules/kurs/bindings/kurs_binding.dart';
import '../modules/kurs/views/kurs_view.dart';
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
import '../modules/login-page/bindings/login_page_binding.dart';
import '../modules/login-page/views/login_page_view.dart';
import '../modules/media/bindings/media_binding.dart';
import '../modules/media/views/media_view.dart';
import '../modules/media_docs/bindings/media_docs_binding.dart';
import '../modules/media_docs/views/media_docs_view.dart';
import '../modules/office-selection/bindings/office_selection_binding.dart';
import '../modules/office-selection/views/office_selection_view.dart';
import '../modules/pengajuan_detail/bindings/pengajuan_detail_binding.dart';
import '../modules/pengajuan_detail/views/components/printing/tanggapan_analis/analis_preview.dart';
import '../modules/pengajuan_detail/views/components/printing/tanggapan_pemutus/pemutus_preview.dart';
import '../modules/pengajuan_detail/views/components/printing/tanggapan_reviewer/reviewer_preview.dart';
import '../modules/pengajuan_detail/views/pengajuan_detail_view.dart';
import '../modules/pengajuan_printing/bindings/pengajuan_printing_binding.dart';
import '../modules/pengajuan_printing/views/pengajuan_printing_view.dart';
import '../modules/pengajuan_submit_analis/bindings/pengajuan_submit_analis_binding.dart';
import '../modules/pengajuan_submit_analis/views/pengajuan_submit_analis_view.dart';
import '../modules/pengutus_completed_list/bindings/pengutus_completed_list_binding.dart';
import '../modules/pengutus_completed_list/views/pengutus_completed_list_view.dart';
import '../modules/pengutus_pending_list/bindings/pengutus_pending_list_binding.dart';
import '../modules/pengutus_pending_list/views/pengutus_pending_list_view.dart';
import '../modules/pengutus_pending_stats/bindings/pengutus_pending_stats_binding.dart';
import '../modules/pengutus_pending_stats/views/pengutus_pending_stats_view.dart';
import '../modules/pengutus_submit/bindings/pengutus_submit_binding.dart';
import '../modules/pengutus_submit/views/pengutus_submit_view.dart';
import '../modules/porsekot_table/bindings/porsekot_table_binding.dart';
import '../modules/porsekot_table/views/porsekot_table_view.dart';
import '../modules/reviewer_completed_list/bindings/reviewer_completed_list_binding.dart';
import '../modules/reviewer_completed_list/views/reviewer_completed_list_view.dart';
import '../modules/reviewer_pending_list/bindings/reviewer_pending_list_binding.dart';
import '../modules/reviewer_pending_list/views/reviewer_pending_list_view.dart';
import '../modules/reviewer_stats/bindings/reviewer_stats_binding.dart';
import '../modules/reviewer_stats/views/reviewer_stats_view.dart';
import '../modules/reviewer_submit/bindings/reviewer_submit_binding.dart';
import '../modules/reviewer_submit/views/reviewer_submit_view.dart';
import '../modules/rss_feed/bindings/rss_feed_binding.dart';
import '../modules/rss_feed/views/rss_feed_view.dart';
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
import '../modules/youtube_feed/bindings/youtube_feed_binding.dart';
import '../modules/youtube_feed/views/youtube_feed_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SEARCH_NIK,
      page: () => const SearchNikView(),
      binding: SearchNikBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.UPLOADS,
      page: () => const UploadsView(),
      binding: UploadsBinding(),
    ),
    GetPage(
      name: _Paths.BISNIS_ANALISIS,
      page: () => BisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_BISNIS_ANALISIS,
      page: () => LihatBisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_BISNIS_ANALISIS,
      page: () => EditBisnisAnalisisView(),
      binding: BisnisAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_PRINT,
      page: () => InputPreview(),
    ),
    GetPage(
      name: _Paths.BISNIS_PRINT,
      page: () => BisnisPreview(),
    ),
    GetPage(
      name: _Paths.KARAKTER_ANALISIS,
      page: () => KarakterAnalisisView(),
      binding: KarakterAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_KARAKTER_ANALISIS,
      page: () => LihatKarakterAnalisisView(),
      binding: KarakterAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_KARAKTER_ANALISIS,
      page: () => EditKarakterAnalisisView(),
      binding: KarakterAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.KARAKTER_PRINT,
      page: () => KarakterPreview(),
    ),
    GetPage(
      name: _Paths.KEUANGAN_ANALISIS,
      page: () => KeuanganAnalisisView(),
      binding: KeuanganAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_KEUANGAN_ANALISIS,
      page: () => LihatKeuanganAnalisisView(),
      binding: KeuanganAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_KEUANGAN_ANALISIS,
      page: () => EditLihatKeuanganAnalisisView(),
      binding: KeuanganAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.KEUANGAN_PRINT,
      page: () => KeuanganPreview(),
    ),
    GetPage(
      name: _Paths.DEBITUR_REAL,
      page: () => DebiturOnboardingView(),
      binding: DebiturRealBinding(),
    ),
    GetPage(
      name: _Paths.DEBITUR_EDIT,
      page: () => DebiturEditView(),
      binding: DebiturRealBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_KEUANGAN,
      page: () => InputKeuanganView(),
      binding: InputKeuanganBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_KEUANGAN,
      page: () => LihatInputKeuanganView(),
      binding: InputKeuanganBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_KEUANGAN,
      page: () => EditInputKeuanganView(),
      binding: InputKeuanganBinding(),
    ),
    GetPage(
      name: _Paths.PORSEKOT_TABLE,
      page: () => const PorsekotTableView(),
      binding: PorsekotTableBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_NERACA,
      page: () => InputNeracaView(),
      binding: InputNeracaBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_NERACA,
      page: () => LihatneracaView(),
      binding: InputNeracaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NERACA,
      page: () => EditNeracaView(),
      binding: InputNeracaBinding(),
    ),
    GetPage(
      name: _Paths.RUGI_LABA,
      page: () => RugiLabaView(),
      binding: RugiLabaBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_RUGI_LABA,
      page: () => LihatRugiLabaView(),
      binding: RugiLabaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_RUGI_LABA,
      page: () => EditRugiLabaView(),
      binding: RugiLabaBinding(),
    ),
    GetPage(
      name: _Paths.USAHA_ANALISIS,
      page: () => UsahaAnalisisView(),
      binding: UsahaAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_USAHA_ANALISIS,
      page: () => LihatUsahaAnalisisView(),
      binding: UsahaAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_USAHA_ANALISIS,
      page: () => EditUsahaAnalisisView(),
      binding: UsahaAnalisisBinding(),
    ),
    GetPage(
      name: _Paths.PRINT_USAHA,
      page: () => JenisUsahaPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_NERACA,
      page: () => NeracaPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_AGUNAN,
      page: () => AgunanPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_RUGILABA,
      page: () => RugiLabaPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_MODEL,
      page: () => ModelPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_USULAN,
      page: () => UsulanPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_PUTUSAN,
      page: () => PutusanPreview(),
    ),
    GetPage(
      name: _Paths.PRINT_USULAN_BARU,
      page: () => UsulanBaruPreview(),
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
    GetPage(
      name: _Paths.ASURANSI,
      page: () => AsuransiView(),
      binding: AsuransiBinding(),
    ),
    GetPage(
      name: _Paths.LIHAT_ASURANSI,
      page: () => LihatAsuransiView(),
      binding: AsuransiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ASURANSI,
      page: () => EditAsuransiView(),
      binding: AsuransiBinding(),
    ),
    GetPage(
      name: _Paths.MEDIA,
      page: () => MediaView(),
      binding: MediaBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY_IMAGE,
      page: () => GalleryImageView(),
      binding: GalleryImageBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY_FILE,
      page: () => GalleryFileView(),
      binding: GalleryFileBinding(),
    ),
    GetPage(
      name: _Paths.MEDIA_DOCS,
      page: () => MediaDocsView(),
      binding: MediaDocsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.INTRO_SCREEN,
      page: () => IntroScreenView(),
      binding: IntroScreenBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN_DETAIL,
      page: () => const PengajuanDetailView(),
      binding: PengajuanDetailBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN_SUBMIT_ANALIS,
      page: () => PengajuanSubmitAnalisView(),
      binding: PengajuanSubmitAnalisBinding(),
    ),
    GetPage(
      name: _Paths.GATE,
      page: () => const GateView(),
      binding: GateBinding(),
    ),
    GetPage(
      name: _Paths.HOME_REVIEWER,
      page: () => HomeReviewerView(),
      binding: HomeReviewerBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWER_SUBMIT,
      page: () => ReviewerSubmitView(),
      binding: ReviewerSubmitBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PENGUTUS,
      page: () => HomePengutusView(),
      binding: HomePengutusBinding(),
    ),
    GetPage(
      name: _Paths.PENGUTUS_SUBMIT,
      page: () => PengutusSubmitView(),
      binding: PengutusSubmitBinding(),
    ),
    GetPage(
      name: _Paths.ANALIS_PRINT,
      page: () => AnalisPreview(),
    ),
    GetPage(
      name: _Paths.REVIEWER_PRINT,
      page: () => ReviewerPreview(),
    ),
    GetPage(
      name: _Paths.PENGUTUS_PRINT,
      page: () => PemutusPreview(),
    ),
    GetPage(
      name: _Paths.SLIK_PRINTING,
      page: () => SlikPreview(),
    ),
    GetPage(
      name: _Paths.SPKK_PRINTING,
      page: () => SpkkPreview(),
    ),
    GetPage(
      name: _Paths.PK_PRINTING,
      page: () => PkPreview(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN_PRINTING,
      page: () => const PengajuanPrintingView(),
      binding: PengajuanPrintingBinding(),
    ),
    GetPage(
      name: _Paths.RSS_FEED,
      page: () => const RssFeedView(),
      binding: RssFeedBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBE_FEED,
      page: () => const YoutubeFeedView(),
      binding: YoutubeFeedBinding(),
    ),
    GetPage(
      name: _Paths.KURS,
      page: () => const KursView(),
      binding: KursBinding(),
    ),
    GetPage(
      name: _Paths.INSTAGRAM_FEED,
      page: () => const InstagramFeedView(),
      binding: InstagramFeedBinding(),
    ),
    GetPage(
      name: _Paths.CRYPTO,
      page: () => const CryptoView(),
      binding: CryptoBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWER_PENDING_LIST,
      page: () => const ReviewerPendingListView(),
      binding: ReviewerPendingListBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWER_COMPLETED_LIST,
      page: () => const ReviewerCompletedListView(),
      binding: ReviewerCompletedListBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWER_STATS,
      page: () => const ReviewerStatsView(),
      binding: ReviewerStatsBinding(),
    ),
    GetPage(
      name: _Paths.CRYPTO_DETAIL,
      page: () => const CryptoDetailView(),
      binding: CryptoDetailBinding(),
    ),
    GetPage(
      name: _Paths.PENGUTUS_COMPLETED_LIST,
      page: () => const PengutusCompletedListView(),
      binding: PengutusCompletedListBinding(),
    ),
    GetPage(
      name: _Paths.PENGUTUS_PENDING_LIST,
      page: () => const PengutusPendingListView(),
      binding: PengutusPendingListBinding(),
    ),
    GetPage(
      name: _Paths.PENGUTUS_PENDING_STATS,
      page: () => const PengutusPendingStatsView(),
      binding: PengutusPendingStatsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AGUNAN,
      page: () => const DetailAgunanView(),
      binding: DetailAgunanBinding(),
    ),
    GetPage(
      name: _Paths.OFFICE_SELECTION,
      page: () => OfficeSelectionView(),
      binding: OfficeSelectionBinding(),
    ),
  ];
}
