// To parse this JSON data, do
//
//     final pengajuanDetail = pengajuanDetailFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

PengajuanDetail pengajuanDetailFromJson(String str) =>
    PengajuanDetail.fromJson(json.decode(str));

String pengajuanDetailToJson(PengajuanDetail data) =>
    json.encode(data.toJson());

class PengajuanDetail {
  PengajuanDetail({
    this.id,
    this.status,
    this.tglSubmit,
    this.tglReview,
    this.tglPemutusan,
    this.bahasanAnalis,
    this.bahasanReviewer,
    this.bahasanPengutus,
    this.debiturId,
    this.user,
    this.debitur,
    this.checkReviewer,
    this.checkPengutus,
  });

  String? id;
  String? status;
  DateTime? tglSubmit;
  DateTime? tglReview;
  DateTime? tglPemutusan;
  List<String>? bahasanAnalis;
  List<String>? bahasanReviewer;
  List<String>? bahasanPengutus;
  int? debiturId;
  List<User>? user;
  Debitur? debitur;
  Check? checkReviewer;
  Check? checkPengutus;

  factory PengajuanDetail.fromJson(Map<String, dynamic> json) =>
      PengajuanDetail(
        id: json["id"],
        status: json["status"],
        tglSubmit: json["tgl_submit"] == null
            ? null
            : DateTime.parse(json["tgl_submit"]),
        tglReview: json["tgl_review"] == null
            ? null
            : DateTime.parse(json["tgl_review"]),
        tglPemutusan: json["tgl_pemutusan"] == null
            ? null
            : DateTime.parse(json["tgl_pemutusan"]),
        bahasanAnalis: json["bahasan_analis"] == null
            ? null
            : List<String>.from(json["bahasan_analis"].map((x) => x)),
        bahasanReviewer: json["bahasan_reviewer"] == null
            ? null
            : List<String>.from(json["bahasan_reviewer"].map((x) => x)),
        bahasanPengutus: json["bahasan_pengutus"] == null
            ? null
            : List<String>.from(json["bahasan_pengutus"].map((x) => x)),
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
        "tgl_review": tglReview == null
            ? null
            : "${tglReview?.year.toString().padLeft(4, '0')}-${tglReview?.month.toString().padLeft(2, '0')}-${tglReview?.day.toString().padLeft(2, '0')}",
        "tgl_pemutusan": tglPemutusan == null
            ? null
            : "${tglPemutusan?.year.toString().padLeft(4, '0')}-${tglPemutusan?.month.toString().padLeft(2, '0')}-${tglPemutusan?.day.toString().padLeft(2, '0')}",
        "bahasan_analis": bahasanAnalis == null
            ? null
            : List<dynamic>.from(bahasanAnalis!.map((x) => x)),
        "bahasan_reviewer": bahasanReviewer == null
            ? null
            : List<dynamic>.from(bahasanReviewer!.map((x) => x)),
        "bahasan_pengutus": bahasanPengutus == null
            ? null
            : List<dynamic>.from(bahasanPengutus!.map((x) => x)),
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
    this.alamat1,
    this.peminjam1,
  });

  int? id;
  String? noDebitur;
  String? alamat1;

  String? peminjam1;

  factory Debitur.fromJson(Map<String, dynamic> json) => Debitur(
        id: json["id"],
        noDebitur: json["no_debitur"],
        peminjam1: json["peminjam1"],
        alamat1: json["alamat_1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_debitur": noDebitur,
        "peminjam1": peminjam1,
        "alamat_1": alamat1,
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
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
      };
}
