// To parse this JSON data, do
//
//     final userPengajuan = userPengajuanFromJson(jsonString);

// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';

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
  List<PengajuanDetail>? pengajuan;
  dynamic createdBy;
  dynamic updatedBy;

  factory UserPengajuan.fromJson(Map<String, dynamic> json) => UserPengajuan(
        id: json["id"],
        roles: json["roles"] == null
            ? null
            : List<dynamic>.from(json["roles"].map((x) => x)),
        pengajuan: json["pengajuan"] == null
            ? null
            : List<PengajuanDetail>.from(
                json["pengajuan"].map((x) => PengajuanDetail.fromJson(x))),
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
    this.user,
    this.debitur,
    this.checkReviewer,
    this.tglReview,
    this.debiturId,
  });

  String? id;
  String? status;
  DateTime? tglSubmit;
  DateTime? tglReview;
  List<User>? user;
  Debitur? debitur;
  dynamic checkReviewer;

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
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
        debitur:
            json["debitur"] == null ? null : Debitur.fromJson(json["debitur"]),
        checkReviewer: json["checkReviewer"],
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

class User {
  User({
    this.id,
    this.email,
    this.phoneNumber,
    this.displayName,
    this.photoUrl,
    this.createdAt,
  });

  String? id;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? photoUrl;
  DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        displayName: json["displayName"],
        photoUrl: json["photoURL"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "displayName": displayName,
        "photoURL": photoUrl,
        // ignore: prefer_null_aware_operators
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
      };
}
