// To parse this JSON data, do
//
//     final agunanInput = agunanInputFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

// 🎯 Dart imports:
import 'dart:convert';

AgunanInput agunanInputFromJson(String str) =>
    AgunanInput.fromJson(json.decode(str));

String agunanInputToJson(AgunanInput data) => json.encode(data.toJson());

class AgunanInput {
  AgunanInput({
    this.bulk,
  });

  List<Bulk>? bulk;

  factory AgunanInput.fromJson(Map<String, dynamic> json) => AgunanInput(
        bulk: json["bulk"] == null
            ? null
            : List<Bulk>.from(json["bulk"].map((x) => Bulk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bulk": bulk == null
            ? null
            : List<dynamic>.from(bulk!.map((x) => x.toJson())),
      };
}

class Bulk {
  Bulk({
    this.kodeAgunan,
    this.jenisAgunan,
    this.isTanah,
    this.isLos,
    this.isKendaraan,
  });

  int? kodeAgunan;
  String? jenisAgunan;
  bool? isTanah;
  bool? isLos;
  bool? isKendaraan;

  factory Bulk.fromJson(Map<String, dynamic> json) => Bulk(
        kodeAgunan: json["kode_agunan"] ?? null,
        jenisAgunan: json["jenis_agunan"] ?? null,
        isTanah: json["is_tanah"] ?? null,
        isLos: json["is_los"] ?? null,
        isKendaraan: json["is_kendaraan"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "kode_agunan": kodeAgunan ?? null,
        "jenis_agunan": jenisAgunan ?? null,
        "is_tanah": isTanah ?? null,
        "is_los": isLos ?? null,
        "is_kendaraan": isKendaraan ?? null,
      };
}
