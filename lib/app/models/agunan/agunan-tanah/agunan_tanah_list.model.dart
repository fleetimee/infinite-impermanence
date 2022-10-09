// To parse this JSON data, do
//
//     final agunanTanahList = agunanTanahListFromJson(jsonString);

import 'dart:convert';

List<AgunanTanahList> agunanTanahListFromJson(String str) =>
    List<AgunanTanahList>.from(
        json.decode(str).map((x) => AgunanTanahList.fromJson(x)));

String agunanTanahListToJson(List<AgunanTanahList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgunanTanahList {
  AgunanTanahList({
    this.id,
    this.deskripsiPendek,
    this.namaPemilik,
    this.buktiKepemilikan,
    this.luasTanah,
    this.tanggal,
    this.nilaiPasar,
    this.nilaiLiquidasi,
    this.nilaiPengikatan,
    this.pengikatan,
    this.lokasi,
    this.titikKoordinat,
    this.deskripsiPanjang,
    this.agunanId,
    this.agunan,
  });

  int? id;
  String? deskripsiPendek;
  String? namaPemilik;
  String? buktiKepemilikan;
  int? luasTanah;
  DateTime? tanggal;
  String? nilaiPasar;
  String? nilaiLiquidasi;
  String? nilaiPengikatan;
  String? pengikatan;
  String? lokasi;
  String? titikKoordinat;
  String? deskripsiPanjang;
  int? agunanId;
  Agunan? agunan;

  factory AgunanTanahList.fromJson(Map<String, dynamic> json) =>
      AgunanTanahList(
        id: json["id"],
        deskripsiPendek: json["deskripsi_pendek"],
        namaPemilik: json["nama_pemilik"],
        buktiKepemilikan: json["bukti_kepemilikan"],
        luasTanah: json["luas_tanah"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        nilaiPasar: json["nilai_pasar"],
        nilaiLiquidasi: json["nilai_liquidasi"],
        nilaiPengikatan: json["nilai_pengikatan"],
        pengikatan: json["pengikatan"],
        lokasi: json["lokasi"],
        titikKoordinat: json["titik_koordinat"],
        deskripsiPanjang: json["deskripsi_panjang"],
        agunanId: json["agunanId"],
        agunan: json["agunan"] == null ? null : Agunan.fromJson(json["agunan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deskripsi_pendek": deskripsiPendek,
        "nama_pemilik": namaPemilik,
        "bukti_kepemilikan": buktiKepemilikan,
        "luas_tanah": luasTanah,
        "tanggal": tanggal == null
            ? null
            : "${tanggal?.year.toString().padLeft(4, '0')}-${tanggal?.month.toString().padLeft(2, '0')}-${tanggal?.day.toString().padLeft(2, '0')}",
        "nilai_pasar": nilaiPasar,
        "nilai_liquidasi": nilaiLiquidasi,
        "nilai_pengikatan": nilaiPengikatan,
        "pengikatan": pengikatan,
        "lokasi": lokasi,
        "titik_koordinat": titikKoordinat,
        "deskripsi_panjang": deskripsiPanjang,
        "agunanId": agunanId,
        "agunan": agunan == null ? null : agunan?.toJson(),
      };
}

class Agunan {
  Agunan({
    this.id,
    this.kodeAgunan,
    this.jenisAgunan,
    this.isTanah,
    this.isLos,
    this.isKendaraan,
    this.debiturId,
    this.debitur,
  });

  int? id;
  int? kodeAgunan;
  String? jenisAgunan;
  bool? isTanah;
  bool? isLos;
  bool? isKendaraan;
  int? debiturId;
  Debitur? debitur;

  factory Agunan.fromJson(Map<String, dynamic> json) => Agunan(
        id: json["id"],
        kodeAgunan: json["kode_agunan"],
        jenisAgunan: json["jenis_agunan"],
        isTanah: json["is_tanah"],
        isLos: json["is_los"],
        isKendaraan: json["is_kendaraan"],
        debiturId: json["debiturId"],
        debitur:
            json["debitur"] == null ? null : Debitur.fromJson(json["debitur"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_agunan": kodeAgunan,
        "jenis_agunan": jenisAgunan,
        "is_tanah": isTanah,
        "is_los": isLos,
        "is_kendaraan": isKendaraan,
        "debiturId": debiturId,
        "debitur": debitur == null ? null : debitur?.toJson(),
      };
}

class Debitur {
  Debitur({
    this.id,
    this.peminjam1,
  });

  int? id;
  String? peminjam1;

  factory Debitur.fromJson(Map<String, dynamic> json) => Debitur(
        id: json["id"],
        peminjam1: json["peminjam1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "peminjam1": peminjam1,
      };
}
