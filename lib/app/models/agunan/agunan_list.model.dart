// To parse this JSON data, do
//
//     final agunanInputList = agunanInputListFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

List<AgunanInputList> agunanInputListFromJson(String str) =>
    List<AgunanInputList>.from(
        json.decode(str).map((x) => AgunanInputList.fromJson(x)));

String agunanInputListToJson(List<AgunanInputList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgunanInputList {
  AgunanInputList({
    this.id,
    this.kodeAgunan,
    this.jenisAgunan,
    this.isTanah,
    this.isLos,
    this.isKendaraan,
    this.debiturId,
    this.debitur,
    this.formTanah,
    this.formKendaraan,
    this.formPeralatan,
    this.formCash,
    this.formLos,
    this.formLainnya,
  });

  int? id;
  int? kodeAgunan;
  String? jenisAgunan;
  bool? isTanah;
  bool? isLos;
  bool? isKendaraan;
  int? debiturId;
  Debitur? debitur;
  List<dynamic>? formTanah;
  List<dynamic>? formKendaraan;
  List<dynamic>? formPeralatan;
  List<dynamic>? formCash;
  List<dynamic>? formLos;
  List<dynamic>? formLainnya;

  factory AgunanInputList.fromJson(Map<String, dynamic> json) =>
      AgunanInputList(
        id: json["id"] ?? null,
        kodeAgunan: json["kode_agunan"] ?? null,
        jenisAgunan: json["jenis_agunan"] ?? null,
        isTanah: json["is_tanah"] ?? null,
        isLos: json["is_los"] ?? null,
        isKendaraan: json["is_kendaraan"] ?? null,
        debiturId: json["debiturId"] ?? null,
        debitur:
            json["debitur"] == null ? null : Debitur.fromJson(json["debitur"]),
        formTanah: json["form_tanah"] == null
            ? null
            : List<dynamic>.from(json["form_tanah"].map((x) => x)),
        formKendaraan: json["form_kendaraan"] == null
            ? null
            : List<dynamic>.from(json["form_kendaraan"].map((x) => x)),
        formPeralatan: json["form_peralatan"] == null
            ? null
            : List<dynamic>.from(json["form_peralatan"].map((x) => x)),
        formCash: json["form_cash"] == null
            ? null
            : List<dynamic>.from(json["form_cash"].map((x) => x)),
        formLos: json["form_los"] == null
            ? null
            : List<dynamic>.from(json["form_los"].map((x) => x)),
        formLainnya: json["form_lainnya"] == null
            ? null
            : List<dynamic>.from(json["form_lainnya"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "kode_agunan": kodeAgunan ?? null,
        "jenis_agunan": jenisAgunan ?? null,
        "is_tanah": isTanah ?? null,
        "is_los": isLos ?? null,
        "is_kendaraan": isKendaraan ?? null,
        "debiturId": debiturId ?? null,
        "debitur": debitur == null ? null : debitur?.toJson(),
        "form_tanah": formTanah == null
            ? null
            : List<dynamic>.from(formTanah!.map((x) => x)),
        "form_kendaraan": formKendaraan == null
            ? null
            : List<dynamic>.from(formKendaraan!.map((x) => x)),
        "form_peralatan": formPeralatan == null
            ? null
            : List<dynamic>.from(formPeralatan!.map((x) => x)),
        "form_cash": formCash == null
            ? null
            : List<dynamic>.from(formCash!.map((x) => x)),
        "form_los":
            formLos == null ? null : List<dynamic>.from(formLos!.map((x) => x)),
        "form_lainnya": formLainnya == null
            ? null
            : List<dynamic>.from(formLainnya!.map((x) => x)),
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
        id: json["id"] ?? null,
        peminjam1: json["peminjam1"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "peminjam1": peminjam1 ?? null,
      };
}
