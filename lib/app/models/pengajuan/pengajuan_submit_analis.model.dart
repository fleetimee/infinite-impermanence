// To parse this JSON data, do
//
//     final pengajuanAnalis = pengajuanAnalisFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

PengajuanAnalis pengajuanAnalisFromJson(String str) =>
    PengajuanAnalis.fromJson(json.decode(str));

String pengajuanAnalisToJson(PengajuanAnalis data) =>
    json.encode(data.toJson());

class PengajuanAnalis {
  PengajuanAnalis({
    this.id,
    this.status,
    this.tglSubmit,
    this.bahasanAnalis,
    this.tglReview,
    this.debiturId,
    this.user,
    this.debitur,
    this.checkReviewer,
    this.checkPengutus,
  });

  String? id;
  String? status;
  DateTime? tglSubmit;
  List<String>? bahasanAnalis;
  DateTime? tglReview;
  int? debiturId;
  List<User>? user;
  Debitur? debitur;
  Check? checkReviewer;
  Check? checkPengutus;

  factory PengajuanAnalis.fromJson(Map<String, dynamic> json) =>
      PengajuanAnalis(
        id: json["id"],
        status: json["status"],
        tglSubmit: json["tgl_submit"] == null
            ? null
            : DateTime.parse(json["tgl_submit"]),
        bahasanAnalis: json["bahasan_analis"] == null
            ? null
            : List<String>.from(json["bahasan_analis"].map((x) => x)),
        tglReview: json["tgl_review"] == null
            ? null
            : DateTime.parse(json["tgl_review"]),
        debiturId: json["debiturId"],
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
        debitur:
            json["debitur"] == null ? null : Debitur.fromJson(json["debitur"]),
        checkReviewer: json["checkReviewer"] == null
            ? null
            : Check.fromJson(json["checkReviewer"]),
        checkPengutus: json["checkPengutus"] == null
            ? null
            : Check.fromJson(json["checkPengutus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "tgl_submit": tglSubmit == null
            ? null
            : "${tglSubmit?.year.toString().padLeft(4, '0')}-${tglSubmit?.month.toString().padLeft(2, '0')}-${tglSubmit?.day.toString().padLeft(2, '0')}",
        "bahasan_analis": bahasanAnalis == null
            ? null
            : List<dynamic>.from(bahasanAnalis!.map((x) => x)),
        "tgl_review": tglReview == null
            ? null
            : "${tglReview?.year.toString().padLeft(4, '0')}-${tglReview?.month.toString().padLeft(2, '0')}-${tglReview?.day.toString().padLeft(2, '0')}",
        "debiturId": debiturId,
        "user": user == null
            ? null
            : List<dynamic>.from(user!.map((x) => x.toJson())),
        "debitur": debitur == null ? null : debitur?.toJson(),
        "checkReviewer": checkReviewer == null ? null : checkReviewer?.toJson(),
        "checkPengutus": checkPengutus == null ? null : checkPengutus?.toJson(),
      };
}

class Check {
  Check({
    this.id,
    this.isKeuanganApproved,
    this.isKarakterApproved,
    this.isAgunanApproved,
    this.isBisnisApproved,
    this.isJenisUsahaApproved,
    this.pengajuanId,
  });

  int? id;
  bool? isKeuanganApproved;
  bool? isKarakterApproved;
  bool? isAgunanApproved;
  bool? isBisnisApproved;
  bool? isJenisUsahaApproved;
  String? pengajuanId;

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        id: json["id"],
        isKeuanganApproved: json["is_keuangan_approved"],
        isKarakterApproved: json["is_karakter_approved"],
        isAgunanApproved: json["is_agunan_approved"],
        isBisnisApproved: json["is_bisnis_approved"],
        isJenisUsahaApproved: json["is_jenis_usaha_approved"],
        pengajuanId: json["pengajuanId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_keuangan_approved": isKeuanganApproved,
        "is_karakter_approved": isKarakterApproved,
        "is_agunan_approved": isAgunanApproved,
        "is_bisnis_approved": isBisnisApproved,
        "is_jenis_usaha_approved": isJenisUsahaApproved,
        "pengajuanId": pengajuanId,
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
    this.fcmToken,
    this.createdAt,
  });

  String? id;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? photoUrl;
  String? fcmToken;

  DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        displayName: json["displayName"],
        photoUrl: json["photoURL"],
        fcmToken: json["fcmToken"],
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
        "fcmToken": fcmToken,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
      };
}
