// To parse this JSON data, do
//
//     final listDebitur = listDebiturFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

// 🎯 Dart imports:
import 'dart:convert';

ListDebitur listDebiturFromJson(String str) =>
    ListDebitur.fromJson(json.decode(str));

String listDebiturToJson(ListDebitur data) => json.encode(data.toJson());

class ListDebitur {
  ListDebitur({
    this.data,
    this.count,
    this.total,
    this.page,
    this.pageCount,
  });

  List<Datum>? data;
  int? count;
  int? total;
  int? page;
  int? pageCount;

  factory ListDebitur.fromJson(Map<String, dynamic> json) => ListDebitur(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        count: json["count"] ?? null,
        total: json["total"] ?? null,
        page: json["page"] ?? null,
        pageCount: json["pageCount"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count ?? null,
        "total": total ?? null,
        "page": page ?? null,
        "pageCount": pageCount ?? null,
      };
}

class Datum {
  Datum({
    this.id,
    this.peminjam1,
    this.bidangUsaha,
    this.umur,
    this.tglSekarang,
    this.createdBy,
  });

  int? id;
  String? peminjam1;
  String? bidangUsaha;
  int? umur;
  DateTime? tglSekarang;
  dynamic createdBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? null,
        peminjam1: json["peminjam1"] ?? null,
        bidangUsaha: json["bidang_usaha"] ?? null,
        umur: json["umur"] ?? null,
        tglSekarang: json["tgl_sekarang"] == null
            ? null
            : DateTime.parse(json["tgl_sekarang"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "peminjam1": peminjam1 ?? null,
        "bidang_usaha": bidangUsaha ?? null,
        "umur": umur ?? null,
        "tgl_sekarang": tglSekarang == null
            ? null
            : "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "createdBy": createdBy,
      };
}
