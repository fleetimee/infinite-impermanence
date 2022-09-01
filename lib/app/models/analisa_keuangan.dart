// To parse this JSON data, do
//
//     final analisaKeuangan = analisaKeuanganFromJson(jsonString);

// 🎯 Dart imports:
import 'dart:convert';

AnalisaKeuangan analisaKeuanganFromJson(String str) =>
    AnalisaKeuangan.fromJson(json.decode(str));

String analisaKeuanganToJson(AnalisaKeuangan data) =>
    json.encode(data.toJson());

class AnalisaKeuangan {
  AnalisaKeuangan({
    this.id,
    this.totalAset,
    this.jumlahAsetKini,
    this.flatInitial,
    this.efektifInitial,
    this.totalFlatEfektifInPercentage,
    this.efektifInRp,
    this.flatInRp,
    this.totalFlatEfektifInRp,
    this.totalAngsuranKeseluruhan,
    this.persenOmzetKini,
    this.persenOmzetYad,
    this.persenBiayaBahanKini,
    this.persenBiayaBahanYad,
    this.persenBiayaOperasiKini,
    this.persenBiayaOperasiYad,
    this.persenBiayaUpahKini,
    this.persenBiayaUpahYad,
    this.persenBiayaHidupKini,
    this.persenBiayaHidupYad,
    this.totalLabaUsahaKini,
    this.totalLabaUsahaYad,
    this.persenLabaUsahaKini,
    this.persenLabaUsahaYad,
    this.persenRatioKini,
    this.persenRatioYad,
    this.persenRoeKini,
    this.persenRoeYad,
    this.keteranganRoe,
    this.persenRoaKini,
    this.persenRoaYad,
    this.keteranganRoa,
    this.persenDerKini,
    this.persenDerYad,
    this.keteranganDer,
    this.persenDscKini,
    this.persenDscYad,
    this.keteranganDsc,
    this.kreditDisetujuin,
    this.pinjamanMaksimal,
    this.perhitunganModalKerja,
    this.kebutuhanInvestasi,
    this.kebutuhanKredit,
    this.totalCrrKeuangan,
  });

  int? id;
  String? totalAset;
  String? jumlahAsetKini;
  double? flatInitial;
  double? efektifInitial;
  double? totalFlatEfektifInPercentage;
  String? efektifInRp;
  String? flatInRp;
  String? totalFlatEfektifInRp;
  String? totalAngsuranKeseluruhan;
  String? persenOmzetKini;
  String? persenOmzetYad;
  String? persenBiayaBahanKini;
  String? persenBiayaBahanYad;
  String? persenBiayaOperasiKini;
  String? persenBiayaOperasiYad;
  String? persenBiayaUpahKini;
  String? persenBiayaUpahYad;
  String? persenBiayaHidupKini;
  String? persenBiayaHidupYad;
  String? totalLabaUsahaKini;
  String? totalLabaUsahaYad;
  String? persenLabaUsahaKini;
  String? persenLabaUsahaYad;
  String? persenRatioKini;
  String? persenRatioYad;
  String? persenRoeKini;
  String? persenRoeYad;
  String? keteranganRoe;
  String? persenRoaKini;
  String? persenRoaYad;
  String? keteranganRoa;
  String? persenDerKini;
  String? persenDerYad;
  String? keteranganDer;
  String? persenDscKini;
  String? persenDscYad;
  String? keteranganDsc;
  bool? kreditDisetujuin;
  String? pinjamanMaksimal;
  String? perhitunganModalKerja;
  String? kebutuhanInvestasi;
  String? kebutuhanKredit;
  double? totalCrrKeuangan;

  factory AnalisaKeuangan.fromJson(Map<String, dynamic> json) =>
      AnalisaKeuangan(
        id: json["id"],
        totalAset: json["total_aset"],
        jumlahAsetKini: json["jumlah_aset_kini"],
        totalAngsuranKeseluruhan: json["total_angsuran_keseluruhan"],
        persenOmzetKini: json["persen_omzet_kini"],
        persenOmzetYad: json["persen_omzet_yad"],
        persenBiayaBahanKini: json["persen_biaya_bahan_kini"],
        persenBiayaBahanYad: json["persen_biaya_bahan_yad"],
        persenBiayaOperasiKini: json["persen_biaya_operasi_kini"],
        persenBiayaOperasiYad: json["persen_biaya_operasi_yad"],
        persenBiayaUpahKini: json["persen_biaya_upah_kini"],
        persenBiayaUpahYad: json["persen_biaya_upah_yad"],
        persenBiayaHidupKini: json["persen_biaya_hidup_kini"],
        persenBiayaHidupYad: json["persen_biaya_hidup_yad"],
        totalLabaUsahaKini: json["total_laba_usaha_kini"],
        totalLabaUsahaYad: json["total_laba_usaha_yad"],
        persenLabaUsahaKini: json["persen_laba_usaha_kini"],
        persenLabaUsahaYad: json["persen_laba_usaha_yad"],
        persenRatioKini: json["persen_ratio_kini"],
        persenRatioYad: json["persen_ratio_yad"],
        persenRoeKini: json["persen_roe_kini"],
        persenRoeYad: json["persen_roe_yad"],
        keteranganRoe: json["keterangan_roe"],
        persenRoaKini: json["persen_roa_kini"],
        persenRoaYad: json["persen_roa_yad"],
        keteranganRoa: json["keterangan_roa"],
        persenDerKini: json["persen_der_kini"],
        persenDerYad: json["persen_der_yad"],
        keteranganDer: json["keterangan_der"],
        persenDscKini: json["persen_dsc_kini"],
        persenDscYad: json["persen_dsc_yad"],
        keteranganDsc: json["keterangan_dsc"],
        kreditDisetujuin: json["kredit_disetujuin"],
        pinjamanMaksimal: json["pinjaman_maksimal"],
        perhitunganModalKerja: json["perhitungan_modal_kerja"],
        kebutuhanInvestasi: json["kebutuhan_investasi"],
        kebutuhanKredit: json["kebutuhan_kredit"],
        totalCrrKeuangan: json["total_crr_keuangan"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_aset": totalAset,
        "jumlah_aset_kini": jumlahAsetKini,
        "flat_initial": flatInitial,
        "efektif_initial": efektifInitial,
        "total_flat_efektif_in_percentage": totalFlatEfektifInPercentage,
        "efektif_in_rp": efektifInRp,
        "flat_in_rp": flatInRp,
        "total_flat_efektif_in_rp": totalFlatEfektifInRp,
        "total_angsuran_keseluruhan": totalAngsuranKeseluruhan,
        "persen_omzet_kini": persenOmzetKini,
        "persen_omzet_yad": persenOmzetYad,
        "persen_biaya_bahan_kini": persenBiayaBahanKini,
        "persen_biaya_bahan_yad": persenBiayaBahanYad,
        "persen_biaya_operasi_kini": persenBiayaOperasiKini,
        "persen_biaya_operasi_yad": persenBiayaOperasiYad,
        "persen_biaya_upah_kini": persenBiayaUpahKini,
        "persen_biaya_upah_yad": persenBiayaUpahYad,
        "persen_biaya_hidup_kini": persenBiayaHidupKini,
        "persen_biaya_hidup_yad": persenBiayaHidupYad,
        "total_laba_usaha_kini": totalLabaUsahaKini,
        "total_laba_usaha_yad": totalLabaUsahaYad,
        "persen_laba_usaha_kini": persenLabaUsahaKini,
        "persen_laba_usaha_yad": persenLabaUsahaYad,
        "persen_ratio_kini": persenRatioKini,
        "persen_ratio_yad": persenRatioYad,
        "persen_roe_kini": persenRoeKini,
        "persen_roe_yad": persenRoeYad,
        "keterangan_roe": keteranganRoe,
        "persen_roa_kini": persenRoaKini,
        "persen_roa_yad": persenRoaYad,
        "keterangan_roa": keteranganRoa,
        "persen_der_kini": persenDerKini,
        "persen_der_yad": persenDerYad,
        "keterangan_der": keteranganDer,
        "persen_dsc_kini": persenDscKini,
        "persen_dsc_yad": persenDscYad,
        "keterangan_dsc": keteranganDsc,
        "kredit_disetujuin": kreditDisetujuin,
        "pinjaman_maksimal": pinjamanMaksimal,
        "perhitungan_modal_kerja": perhitunganModalKerja,
        "kebutuhan_investasi": kebutuhanInvestasi,
        "kebutuhan_kredit": kebutuhanKredit,
        "total_crr_keuangan": totalCrrKeuangan,
      };
}
