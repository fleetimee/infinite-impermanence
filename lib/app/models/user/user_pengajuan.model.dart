// To parse this JSON data, do
//
//     final userPengajuan = userPengajuanFromJson(jsonString);

import 'dart:convert';

UserPengajuan userPengajuanFromJson(String str) =>
    UserPengajuan.fromJson(json.decode(str));

String userPengajuanToJson(UserPengajuan data) => json.encode(data.toJson());

class UserPengajuan {
  UserPengajuan({
    this.id,
    this.roles,
    this.pengajuan,
    this.createdBy,
    this.updatedBy,
  });

  String? id;
  List<dynamic>? roles;
  List<Pengajuan>? pengajuan;
  dynamic createdBy;
  dynamic updatedBy;

  factory UserPengajuan.fromJson(Map<String, dynamic> json) => UserPengajuan(
        id: json["id"],
        roles: json["roles"] == null
            ? null
            : List<dynamic>.from(json["roles"].map((x) => x)),
        pengajuan: json["pengajuan"] == null
            ? null
            : List<Pengajuan>.from(
                json["pengajuan"].map((x) => Pengajuan.fromJson(x))),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
        "pengajuan": pengajuan == null
            ? null
            : List<dynamic>.from(pengajuan!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
      };
}

class Pengajuan {
  Pengajuan({
    this.id,
    this.status,
    this.tglSubmit,
    this.tglReview,
    this.debiturId,
  });

  String? id;
  String? status;
  DateTime? tglSubmit;
  DateTime? tglReview;
  int? debiturId;

  factory Pengajuan.fromJson(Map<String, dynamic> json) => Pengajuan(
        id: json["id"],
        status: json["status"],
        tglSubmit: json["tgl_submit"] == null
            ? null
            : DateTime.parse(json["tgl_submit"]),
        tglReview: json["tgl_review"] == null
            ? null
            : DateTime.parse(json["tgl_review"]),
        debiturId: json["debiturId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "tgl_submit": tglSubmit == null
            ? null
            : "${tglSubmit?.year.toString().padLeft(4, '0')}-${tglSubmit?.month.toString().padLeft(2, '0')}-${tglSubmit?.day.toString().padLeft(2, '0')}",
        "tgl_review": tglReview == null
            ? null
            : "${tglReview?.year.toString().padLeft(4, '0')}-${tglReview?.month.toString().padLeft(2, '0')}-${tglReview?.day.toString().padLeft(2, '0')}",
        "debiturId": debiturId,
      };
}
