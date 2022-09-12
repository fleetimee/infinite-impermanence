// To parse this JSON data, do
//
//     final inputNeraca = inputNeracaFromJson(jsonString);

// 🎯 Dart imports:
import 'dart:convert';

InputNeraca inputNeracaFromJson(String str) =>
    InputNeraca.fromJson(json.decode(str));

String inputNeracaToJson(InputNeraca data) => json.encode(data.toJson());

class InputNeraca {
  InputNeraca({
    this.id,
    this.tanggalInput,
    this.kasOnHand,
    this.tabungan,
    this.jumlahKasDanTabungan,
    this.jumlahPiutang,
    this.jumlahPersediaan,
    this.hutangUsaha,
    this.hutangBank,
    this.peralatan,
    this.kendaraan,
    this.tanahDanBangunan,
    this.aktivaTetap,
    this.debitur,
  });

  int? id;
  DateTime? tanggalInput;
  String? kasOnHand;
  String? tabungan;
  String? jumlahKasDanTabungan;
  String? jumlahPiutang;
  String? jumlahPersediaan;
  String? hutangUsaha;
  String? hutangBank;
  String? peralatan;
  String? kendaraan;
  String? tanahDanBangunan;
  String? aktivaTetap;
  Debitur? debitur;

  factory InputNeraca.fromJson(Map<String, dynamic> json) => InputNeraca(
        id: json["id"],
        tanggalInput: DateTime.parse(json["tanggal_input"]),
        kasOnHand: json["kas_on_hand"],
        tabungan: json["tabungan"],
        jumlahKasDanTabungan: json["jumlah_kas_dan_tabungan"],
        jumlahPiutang: json["jumlah_piutang"],
        jumlahPersediaan: json["jumlah_persediaan"],
        hutangUsaha: json["hutang_usaha"],
        hutangBank: json["hutang_bank"],
        peralatan: json["peralatan"],
        kendaraan: json["kendaraan"],
        tanahDanBangunan: json["tanah_dan_bangunan"],
        aktivaTetap: json["aktiva_tetap"],
        debitur: Debitur.fromJson(json["debitur"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_input":
            "${tanggalInput?.year.toString().padLeft(4, '0')}-${tanggalInput?.month.toString().padLeft(2, '0')}-${tanggalInput!.day.toString().padLeft(2, '0')}",
        "kas_on_hand": kasOnHand,
        "tabungan": tabungan,
        "jumlah_kas_dan_tabungan": jumlahKasDanTabungan,
        "jumlah_piutang": jumlahPiutang,
        "jumlah_persediaan": jumlahPersediaan,
        "hutang_usaha": hutangUsaha,
        "hutang_bank": hutangBank,
        "peralatan": peralatan,
        "kendaraan": kendaraan,
        "tanah_dan_bangunan": tanahDanBangunan,
        "aktiva_tetap": aktivaTetap,
        "debitur": debitur?.toJson(),
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
