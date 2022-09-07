// // To parse this JSON data, do
// //
// //     final keuangan = keuanganFromJson(jsonString);

// // 🎯 Dart imports:
// import 'dart:convert';

// Keuangan keuanganFromJson(String str) => Keuangan.fromJson(json.decode(str));

// String keuanganToJson(Keuangan data) => json.encode(data.toJson());

// class Keuangan {
//   Keuangan({
//     this.id,
//     this.kreditDiusulkan,
//     this.angsuran,
//     this.bungaPerTahun,
//     this.provisi,
//     this.sistemAngsuran,
//     this.digunakanUntuk,
//     this.angsuranRp,
//     // this.pinjamanLainnya,
//     // this.angsuranPinjamanLainnya,
//     // this.nilaiAset,
//     this.hpp,
//     this.penjualanKini,
//     this.biayaBahanKini,
//     this.biayaOperasionalKini,
//     this.biayaUpahKini,
//     this.biayaHidupKini,
//     this.penjualanAsumsi,
//     this.biayaBahanAsumsi,
//     this.biayaOperasionalAsumsi,
//     this.biayaUpahAsumsi,
//     this.biayaHidupAsumsi,
//     this.tradeCycle,
//     this.debitur,
//   });

//   int? id;
//   String? kreditDiusulkan;
//   int? angsuran;
//   int? bungaPerTahun;
//   int? provisi;
//   String? sistemAngsuran;
//   String? digunakanUntuk;
//   String? angsuranRp;
//   // String? pinjamanLainnya;
//   // String? angsuranPinjamanLainnya;
//   // String? nilaiAset;
//   int? hpp;
//   String? penjualanKini;
//   String? biayaBahanKini;
//   String? biayaOperasionalKini;
//   String? biayaUpahKini;
//   String? biayaHidupKini;
//   String? penjualanAsumsi;
//   String? biayaBahanAsumsi;
//   String? biayaOperasionalAsumsi;
//   String? biayaUpahAsumsi;
//   String? biayaHidupAsumsi;
//   int? tradeCycle;
//   int? debitur;

//   factory Keuangan.fromJson(Map<String, dynamic> json) => Keuangan(
//         id: json["id"],
//         kreditDiusulkan: json["kredit_diusulkan"],
//         angsuran: json["angsuran"],
//         bungaPerTahun: json["bunga_per_tahun"],
//         provisi: json["provisi"],
//         sistemAngsuran: json["sistem_angsuran"],
//         digunakanUntuk: json["digunakan_untuk"],
//         angsuranRp: json["angsuran_rp"],
//         // pinjamanLainnya: json["pinjaman_lainnya"],
//         // angsuranPinjamanLainnya: json["angsuran_pinjaman_lainnya"],
//         // nilaiAset: json["nilai_aset"],
//         hpp: json["hpp"],
//         penjualanKini: json["penjualan_kini"],
//         biayaBahanKini: json["biaya_bahan_kini"],
//         biayaOperasionalKini: json["biaya_operasional_kini"],
//         biayaUpahKini: json["biaya_upah_kini"],
//         biayaHidupKini: json["biaya_hidup_kini"],
//         penjualanAsumsi: json["penjualan_asumsi"],
//         biayaBahanAsumsi: json["biaya_bahan_asumsi"],
//         biayaOperasionalAsumsi: json["biaya_operasional_asumsi"],
//         biayaUpahAsumsi: json["biaya_upah_asumsi"],
//         biayaHidupAsumsi: json["biaya_hidup_asumsi"],
//         tradeCycle: json["trade_cycle"],
//         debitur: json["debitur"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "kredit_diusulkan": kreditDiusulkan,
//         "angsuran": angsuran,
//         "bunga_per_tahun": bungaPerTahun,
//         "provisi": provisi,
//         "sistem_angsuran": sistemAngsuran,
//         "digunakan_untuk": digunakanUntuk,
//         "angsuran_rp": angsuranRp,
//         // "pinjaman_lainnya": pinjamanLainnya,
//         // "angsuran_pinjaman_lainnya": angsuranPinjamanLainnya,
//         // "nilai_aset": nilaiAset,
//         "hpp": hpp,
//         "penjualan_kini": penjualanKini,
//         "biaya_bahan_kini": biayaBahanKini,
//         "biaya_operasional_kini": biayaOperasionalKini,
//         "biaya_upah_kini": biayaUpahKini,
//         "biaya_hidup_kini": biayaHidupKini,
//         "penjualan_asumsi": penjualanAsumsi,
//         "biaya_bahan_asumsi": biayaBahanAsumsi,
//         "biaya_operasional_asumsi": biayaOperasionalAsumsi,
//         "biaya_upah_asumsi": biayaUpahAsumsi,
//         "biaya_hidup_asumsi": biayaHidupAsumsi,
//         "trade_cycle": tradeCycle,
//         "debitur": debitur
//       };
// }

// To parse this JSON data, do
//
//     final keuangan = keuanganFromJson(jsonString);

// 🎯 Dart imports:
import 'dart:convert';

Keuangan keuanganFromJson(String str) => Keuangan.fromJson(json.decode(str));

String keuanganToJson(Keuangan data) => json.encode(data.toJson());

class Keuangan {
  Keuangan({
    this.id,
    this.kreditDiusulkan,
    this.angsuran,
    this.bungaPerTahun,
    this.provisi,
    this.sistemAngsuran,
    this.digunakanUntuk,
    this.angsuranRp,
    // this.pinjamanLainnya,
    // this.angsuranPinjamanLainnya,
    // this.nilaiAset,
    this.hpp,
    this.penjualanKini,
    this.biayaBahanKini,
    this.biayaOperasionalKini,
    this.biayaUpahKini,
    this.biayaHidupKini,
    this.penjualanAsumsi,
    this.biayaBahanAsumsi,
    this.biayaOperasionalAsumsi,
    this.biayaUpahAsumsi,
    this.biayaHidupAsumsi,
    this.tradeCycle,
    this.debitur,
  });

  int? id;
  String? kreditDiusulkan;
  int? angsuran;
  int? bungaPerTahun;
  int? provisi;
  String? sistemAngsuran;
  String? digunakanUntuk;
  String? angsuranRp;
  // String? pinjamanLainnya;
  // String? angsuranPinjamanLainnya;
  // String? nilaiAset;
  int? hpp;
  String? penjualanKini;
  String? biayaBahanKini;
  String? biayaOperasionalKini;
  String? biayaUpahKini;
  String? biayaHidupKini;
  String? penjualanAsumsi;
  String? biayaBahanAsumsi;
  String? biayaOperasionalAsumsi;
  String? biayaUpahAsumsi;
  String? biayaHidupAsumsi;
  int? tradeCycle;
  DebiturClass? debitur;

  factory Keuangan.fromJson(Map<String, dynamic> json) => Keuangan(
        id: json["id"],
        kreditDiusulkan: json["kredit_diusulkan"],
        angsuran: json["angsuran"],
        bungaPerTahun: json["bunga_per_tahun"],
        provisi: json["provisi"],
        sistemAngsuran: json["sistem_angsuran"],
        digunakanUntuk: json["digunakan_untuk"],
        angsuranRp: json["angsuran_rp"],
        // pinjamanLainnya: json["pinjaman_lainnya"],
        // angsuranPinjamanLainnya: json["angsuran_pinjaman_lainnya"],
        // nilaiAset: json["nilai_aset"],
        hpp: json["hpp"],
        penjualanKini: json["penjualan_kini"],
        biayaBahanKini: json["biaya_bahan_kini"],
        biayaOperasionalKini: json["biaya_operasional_kini"],
        biayaUpahKini: json["biaya_upah_kini"],
        biayaHidupKini: json["biaya_hidup_kini"],
        penjualanAsumsi: json["penjualan_asumsi"],
        biayaBahanAsumsi: json["biaya_bahan_asumsi"],
        biayaOperasionalAsumsi: json["biaya_operasional_asumsi"],
        biayaUpahAsumsi: json["biaya_upah_asumsi"],
        biayaHidupAsumsi: json["biaya_hidup_asumsi"],
        tradeCycle: json["trade_cycle"],
        debitur: DebiturClass.fromJson(json["debitur"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kredit_diusulkan": kreditDiusulkan,
        "angsuran": angsuran,
        "bunga_per_tahun": bungaPerTahun,
        "provisi": provisi,
        "sistem_angsuran": sistemAngsuran,
        "digunakan_untuk": digunakanUntuk,
        "angsuran_rp": angsuranRp,
        // "pinjaman_lainnya": pinjamanLainnya,
        // "angsuran_pinjaman_lainnya": angsuranPinjamanLainnya,
        // "nilai_aset": nilaiAset,
        "hpp": hpp,
        "penjualan_kini": penjualanKini,
        "biaya_bahan_kini": biayaBahanKini,
        "biaya_operasional_kini": biayaOperasionalKini,
        "biaya_upah_kini": biayaUpahKini,
        "biaya_hidup_kini": biayaHidupKini,
        "penjualan_asumsi": penjualanAsumsi,
        "biaya_bahan_asumsi": biayaBahanAsumsi,
        "biaya_operasional_asumsi": biayaOperasionalAsumsi,
        "biaya_upah_asumsi": biayaUpahAsumsi,
        "biaya_hidup_asumsi": biayaHidupAsumsi,
        "trade_cycle": tradeCycle,
        "debitur": debitur?.toJson(),
      };
}

class DebiturClass {
  DebiturClass({
    this.id,
    this.noDebitur,
    this.peminjam1,
  });

  int? id;
  String? noDebitur;
  String? peminjam1;

  factory DebiturClass.fromJson(Map<String, dynamic> json) => DebiturClass(
        id: json["id"],
        noDebitur: json["no_debitur"],
        peminjam1: json["peminjam1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_debitur": noDebitur,
        "peminjam1": peminjam1,
      };
}
