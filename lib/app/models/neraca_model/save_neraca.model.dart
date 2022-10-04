// To parse this JSON data, do
//
//     final neracaInput = neracaInputFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

NeracaInput neracaInputFromJson(String str) =>
    NeracaInput.fromJson(json.decode(str));

String neracaInputToJson(NeracaInput data) => json.encode(data.toJson());

class NeracaInput {
  NeracaInput({
    this.id,
    this.tanggalInput,
    this.kasOnHand,
    this.tabungan,
    this.jumlahKasDanTabungan,
    this.jumlahPiutang,
    this.jumlahPersediaan,
    this.hutangUsaha,
    this.hutangBank,
    this.peralatan,
    this.kendaraan,
    this.tanahBangunan,
    this.aktivaTetap,
    this.debitur,
    this.inputRugiLaba,
  });

  int? id;
  DateTime? tanggalInput;
  String? kasOnHand;
  String? tabungan;
  String? jumlahKasDanTabungan;
  String? jumlahPiutang;
  String? jumlahPersediaan;
  String? hutangUsaha;
  String? hutangBank;
  String? peralatan;
  String? kendaraan;
  String? tanahBangunan;
  String? aktivaTetap;
  Debitur? debitur;
  dynamic inputRugiLaba;

  factory NeracaInput.fromJson(Map<String, dynamic> json) => NeracaInput(
        id: json["id"] ?? null,
        tanggalInput: json["tanggal_input"] == null
            ? null
            : DateTime.parse(json["tanggal_input"]),
        kasOnHand: json["kas_on_hand"] ?? null,
        tabungan: json["tabungan"] ?? null,
        jumlahKasDanTabungan: json["jumlah_kas_dan_tabungan"] ?? null,
        jumlahPiutang: json["jumlah_piutang"] ?? null,
        jumlahPersediaan: json["jumlah_persediaan"] ?? null,
        hutangUsaha: json["hutang_usaha"] ?? null,
        hutangBank: json["hutang_bank"] ?? null,
        peralatan: json["peralatan"],
        kendaraan: json["kendaraan"],
        tanahBangunan: json["tanah_bangunan"],
        aktivaTetap: json["aktiva_tetap"] ?? null,
        debitur:
            json["debitur"] == null ? null : Debitur.fromJson(json["debitur"]),
        inputRugiLaba: json["inputRugiLaba"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "tanggal_input": tanggalInput == null
            ? null
            : "${tanggalInput?.year.toString().padLeft(4, '0')}-${tanggalInput?.month.toString().padLeft(2, '0')}-${tanggalInput?.day.toString().padLeft(2, '0')}",
        "kas_on_hand": kasOnHand ?? null,
        "tabungan": tabungan ?? null,
        "jumlah_kas_dan_tabungan": jumlahKasDanTabungan ?? null,
        "jumlah_piutang": jumlahPiutang ?? null,
        "jumlah_persediaan": jumlahPersediaan ?? null,
        "hutang_usaha": hutangUsaha ?? null,
        "hutang_bank": hutangBank ?? null,
        "peralatan": peralatan,
        "kendaraan": kendaraan,
        "tanah_bangunan": tanahBangunan,
        "aktiva_tetap": aktivaTetap ?? null,
        "debitur": debitur == null ? null : debitur?.toJson(),
        "inputRugiLaba": inputRugiLaba,
      };
}

class Debitur {
  Debitur({
    this.id,
    this.noDebitur,
    this.peminjam1,
  });

  int? id;
  String? noDebitur;
  String? peminjam1;

  factory Debitur.fromJson(Map<String, dynamic> json) => Debitur(
        id: json["id"] ?? null,
        noDebitur: json["no_debitur"] ?? null,
        peminjam1: json["peminjam1"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "no_debitur": noDebitur ?? null,
        "peminjam1": peminjam1 ?? null,
      };
}
