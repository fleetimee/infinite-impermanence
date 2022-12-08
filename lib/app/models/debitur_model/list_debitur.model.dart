// To parse this JSON data, do
//
//     final listDebitur = listDebiturFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

// 🎯 Dart imports:
import 'dart:convert';

import 'package:akm/app/models/debtor.dart';

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
    this.jenisUsaha,
    this.ktp1,
    this.umur,
    this.tglSekarang,
    this.progress,
    this.userId,
    this.user,
    this.inputKeuangan,
    this.createdBy,
  });

  int? id;
  String? peminjam1;
  String? bidangUsaha;
  String? jenisUsaha;
  String? ktp1;
  int? umur;
  DateTime? tglSekarang;
  String? progress;
  String? userId;
  // this is from debtor sebelah
  User? user;
  dynamic createdBy;
  InputKeuangan? inputKeuangan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? null,
        peminjam1: json["peminjam1"] ?? null,
        bidangUsaha: json["bidang_usaha"] ?? null,
        jenisUsaha: json["jenis_usaha"] ?? null,
        ktp1: json["ktp1"] ?? null,
        umur: json["umur"] ?? null,
        tglSekarang: json["tgl_sekarang"] == null
            ? null
            : DateTime.parse(json["tgl_sekarang"]),
        progress: json["progress"] ?? null,
        userId: json["userId"] ?? null,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        createdBy: json["createdBy"],
        inputKeuangan: json["inputKeuangan"] == null
            ? null
            : InputKeuangan.fromJson(json["inputKeuangan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "peminjam1": peminjam1 ?? null,
        "bidang_usaha": bidangUsaha ?? null,
        "jenis_usaha": jenisUsaha ?? null,
        "ktp1": ktp1 ?? null,
        "umur": umur ?? null,
        "tgl_sekarang": tglSekarang == null
            ? null
            : "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "progress": progress ?? null,
        "userId": userId ?? null,
        "user": user == null ? null : user?.toJson(),
        "createdBy": createdBy,
        "inputKeuangan": inputKeuangan == null ? null : inputKeuangan?.toJson(),
      };
}

class InputKeuangan {
  InputKeuangan({
    this.id,
    this.kreditDiusulkan,
    this.digunakanUntuk,
  });

  int? id;
  String? kreditDiusulkan;
  String? digunakanUntuk;

  factory InputKeuangan.fromJson(Map<String, dynamic> json) => InputKeuangan(
        id: json["id"] ?? null,
        kreditDiusulkan: json["kredit_diusulkan"] ?? null,
        digunakanUntuk: json["digunakan_untuk"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "kredit_diusulkan": kreditDiusulkan ?? null,
        "digunakan_untuk": digunakanUntuk ?? null,
      };
}
