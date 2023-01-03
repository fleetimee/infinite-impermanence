// To parse this JSON data, do
//
//     final userDropdown = userDropdownFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

// 🎯 Dart imports:
import 'dart:convert';

UserDropdown userDropdownFromJson(String str) =>
    UserDropdown.fromJson(json.decode(str));

String userDropdownToJson(UserDropdown data) => json.encode(data.toJson());

class UserDropdown {
  UserDropdown({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory UserDropdown.fromJson(Map<String, dynamic> json) => UserDropdown(
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.uid,
    this.email,
    this.emailVerified,
    this.displayName,
    this.disabled,
    this.metadata,
    this.passwordHash,
    this.passwordSalt,
    this.customClaims,
    this.tokensValidAfterTime,
    this.providerData,
  });

  String? uid;
  String? email;
  bool? emailVerified;
  String? displayName;
  bool? disabled;
  Metadata? metadata;
  String? passwordHash;
  String? passwordSalt;
  CustomClaims? customClaims;
  String? tokensValidAfterTime;
  List<ProviderDatum>? providerData;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uid: json["uid"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        displayName: json["displayName"],
        disabled: json["disabled"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        passwordHash: json["passwordHash"],
        passwordSalt: json["passwordSalt"],
        customClaims: json["customClaims"] == null
            ? null
            : CustomClaims.fromJson(json["customClaims"]),
        tokensValidAfterTime: json["tokensValidAfterTime"],
        providerData: json["providerData"] == null
            ? null
            : List<ProviderDatum>.from(
                json["providerData"].map((x) => ProviderDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "emailVerified": emailVerified,
        "displayName": displayName,
        "disabled": disabled,
        "metadata": metadata == null ? null : metadata?.toJson(),
        "passwordHash": passwordHash,
        "passwordSalt": passwordSalt,
        "customClaims": customClaims == null ? null : customClaims?.toJson(),
        "tokensValidAfterTime": tokensValidAfterTime,
        "providerData": providerData == null
            ? null
            : List<dynamic>.from(providerData!.map((x) => x.toJson())),
      };
}

class CustomClaims {
  CustomClaims({
    this.admin,
    this.analis,
    this.reviewer,
    this.pengutus,
  });

  bool? admin;
  bool? analis;
  bool? reviewer;
  bool? pengutus;

  factory CustomClaims.fromJson(Map<String, dynamic> json) => CustomClaims(
        admin: json["admin"],
        analis: json["analis"],
        reviewer: json["reviewer"],
        pengutus: json["pengutus"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "analis": analis,
        "reviewer": reviewer,
        "pengutus": pengutus,
      };
}

class Metadata {
  Metadata({
    this.lastSignInTime,
    this.creationTime,
    this.lastRefreshTime,
  });

  String? lastSignInTime;
  String? creationTime;
  String? lastRefreshTime;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        lastSignInTime: json["lastSignInTime"],
        creationTime: json["creationTime"],
        lastRefreshTime: json["lastRefreshTime"],
      );

  Map<String, dynamic> toJson() => {
        "lastSignInTime": lastSignInTime,
        "creationTime": creationTime,
        "lastRefreshTime": lastRefreshTime,
      };
}

class ProviderDatum {
  ProviderDatum({
    this.uid,
    this.displayName,
    this.email,
    this.providerId,
    this.photoUrl,
  });

  String? uid;
  String? displayName;
  String? email;
  String? providerId;
  String? photoUrl;

  factory ProviderDatum.fromJson(Map<String, dynamic> json) => ProviderDatum(
        uid: json["uid"],
        displayName: json["displayName"],
        email: json["email"],
        providerId: json["providerId"],
        photoUrl: json["photoURL"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "displayName": displayName,
        "email": email,
        "providerId": providerId,
        "photoURL": photoUrl,
      };
}
