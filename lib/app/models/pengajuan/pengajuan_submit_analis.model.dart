// To parse this JSON data, do
//
//     final pengajuanAnalis = pengajuanAnalisFromJson(jsonString);

import 'dart:convert';

PengajuanAnalis pengajuanAnalisFromJson(String str) =>
    PengajuanAnalis.fromJson(json.decode(str));

String pengajuanAnalisToJson(PengajuanAnalis data) =>
    json.encode(data.toJson());

class PengajuanAnalis {
  PengajuanAnalis({
    this.status,
    this.tglSubmit,
    this.tglReview,
    this.user,
    this.debiturId,
  });

  String? status;
  DateTime? tglSubmit;
  DateTime? tglReview;
  List<User>? user;
  int? debiturId;

  factory PengajuanAnalis.fromJson(Map<String, dynamic> json) =>
      PengajuanAnalis(
        status: json["status"],
        tglSubmit: json["tgl_submit"] == null
            ? null
            : DateTime.parse(json["tgl_submit"]),
        tglReview: json["tgl_review"] == null
            ? null
            : DateTime.parse(json["tgl_review"]),
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
        debiturId: json["debiturId"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "tgl_submit": tglSubmit == null
            ? null
            : "${tglSubmit?.year.toString().padLeft(4, '0')}-${tglSubmit?.month.toString().padLeft(2, '0')}-${tglSubmit?.day.toString().padLeft(2, '0')}",
        "tgl_review": tglReview == null
            ? null
            : "${tglReview?.year.toString().padLeft(4, '0')}-${tglReview?.month.toString().padLeft(2, '0')}-${tglReview?.day.toString().padLeft(2, '0')}",
        "user": user == null
            ? null
            : List<dynamic>.from(user!.map((x) => x.toJson())),
        "debiturId": debiturId,
      };
}

class User {
  User({
    this.id,
  });

  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
