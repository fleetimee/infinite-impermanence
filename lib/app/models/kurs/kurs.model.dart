// To parse this JSON data, do
//
//     final kurs = kursFromJson(jsonString);

import 'dart:convert';

List<Kurs> kursFromJson(String str) =>
    List<Kurs>.from(json.decode(str).map((x) => Kurs.fromJson(x)));

String kursToJson(List<Kurs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kurs {
  Kurs({
    this.lastUpdated,
    this.mataUang,
    this.eRate,
    this.ttCounter,
    this.bankNotes,
  });

  String? lastUpdated;
  String? mataUang;
  ERate? eRate;
  TtCounter? ttCounter;
  BankNotes? bankNotes;

  factory Kurs.fromJson(Map<String, dynamic> json) => Kurs(
        lastUpdated: json["last_updated"],
        mataUang: json["mata_uang"],
        eRate: json["eRate"] == null ? null : ERate.fromJson(json["eRate"]),
        ttCounter: json["TTCounter"] == null
            ? null
            : TtCounter.fromJson(json["TTCounter"]),
        bankNotes: json["BankNotes"] == null
            ? null
            : BankNotes.fromJson(json["BankNotes"]),
      );

  Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "mata_uang": mataUang,
        "eRate": eRate?.toJson(),
        "TTCounter": ttCounter?.toJson(),
        "BankNotes": bankNotes?.toJson(),
      };
}

class BankNotes {
  BankNotes({
    this.bankNotesBeli,
    this.bankNotesJual,
  });

  String? bankNotesBeli;
  String? bankNotesJual;

  factory BankNotes.fromJson(Map<String, dynamic> json) => BankNotes(
        bankNotesBeli: json["BankNotes_beli"],
        bankNotesJual: json["BankNotes_jual"],
      );

  Map<String, dynamic> toJson() => {
        "BankNotes_beli": bankNotesBeli,
        "BankNotes_jual": bankNotesJual,
      };
}

class ERate {
  ERate({
    this.eRateBeli,
    this.eRateJual,
  });

  String? eRateBeli;
  String? eRateJual;

  factory ERate.fromJson(Map<String, dynamic> json) => ERate(
        eRateBeli: json["eRate_beli"],
        eRateJual: json["eRate_jual"],
      );

  Map<String, dynamic> toJson() => {
        "eRate_beli": eRateBeli,
        "eRate_jual": eRateJual,
      };
}

class TtCounter {
  TtCounter({
    this.ttCounterBeli,
    this.ttCounterJual,
  });

  String? ttCounterBeli;
  String? ttCounterJual;

  factory TtCounter.fromJson(Map<String, dynamic> json) => TtCounter(
        ttCounterBeli: json["TTCounter_beli"],
        ttCounterJual: json["TTCounter_jual"],
      );

  Map<String, dynamic> toJson() => {
        "TTCounter_beli": ttCounterBeli,
        "TTCounter_jual": ttCounterJual,
      };
}
