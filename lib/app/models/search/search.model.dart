// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

import 'package:akm/app/models/auth/auth.model.dart';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
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

  factory Search.fromJson(Map<String, dynamic> json) => Search(
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
    this.noKtp1,
    this.jenisUsaha,
    this.bidangUsaha,
    this.tglSekarang,
    this.userId,
    this.user,
    this.createdBy,
    this.inputKeuangan,
  });

  int? id;
  String? peminjam1;
  String? noKtp1;
  String? jenisUsaha;
  String? bidangUsaha;
  DateTime? tglSekarang;
  String? userId;

  User? user;
  dynamic createdBy;
  dynamic inputKeuangan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? null,
        peminjam1: json["peminjam1"] ?? null,
        noKtp1: json["no_ktp1"] ?? null,
        jenisUsaha: json["jenis_usaha"] ?? null,
        bidangUsaha: json["bidang_usaha"] ?? null,
        tglSekarang: json["tgl_sekarang"] == null
            ? null
            : DateTime.parse(json["tgl_sekarang"]),
        userId: json["userId"] ?? null,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        createdBy: json["createdBy"],
        inputKeuangan: json["inputKeuangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "peminjam1": peminjam1 ?? null,
        "no_ktp1": noKtp1 ?? null,
        "jenis_usaha": jenisUsaha ?? null,
        "bidang_usaha": bidangUsaha ?? null,
        "tgl_sekarang": tglSekarang == null
            ? null
            : "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "userId": userId ?? null,
        "user": user == null ? null : user?.toJson(),
        "createdBy": createdBy,
        "inputKeuangan": inputKeuangan,
      };
}
