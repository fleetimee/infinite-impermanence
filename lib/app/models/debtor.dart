// 🎯 Dart imports:
import 'dart:convert';

List<Debtor> debtorFromJson(String str) =>
    List<Debtor>.from(json.decode(str).map((x) => Debtor.fromJson(x)));

String debtorToJson(List<Debtor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Debtor {
  Debtor({
    this.id,
    this.noDebitur,
    this.peminjam1,
    this.ktp1,
    this.peminjam2,
    this.ktp2,
    this.pemilikAgunan1,
    this.noKtp1,
    this.pemilikAgunan2,
    this.noKtp2,
    this.alamat1,
    this.alamat2,
    this.tempatLahir,
    this.tanggalLahir,
    this.umur,
    this.statusKeluarga,
    this.jumlahTanggungan,
    this.lamanyaBerusaha,
    this.lokasiUsaha,
    this.jenisUsaha,
    this.bidangUsaha,
    this.pendidikan,
    this.pekerjaan1,
    this.pekerjaan2,
    this.noSkpk,
    this.tglSekarang,
    this.deskripsiDebitur,
    this.nonfixed,
    this.fixed,
    this.createdBy,
  });

  int? id;
  String? noDebitur;
  String? peminjam1;
  String? ktp1;
  String? peminjam2;
  String? ktp2;
  String? pemilikAgunan1;
  String? noKtp1;
  String? pemilikAgunan2;
  String? noKtp2;
  String? alamat1;
  String? alamat2;
  String? tempatLahir;
  DateTime? tanggalLahir;
  int? umur;
  String? statusKeluarga;
  int? jumlahTanggungan;

  int? lamanyaBerusaha;
  String? lokasiUsaha;
  String? jenisUsaha;
  String? bidangUsaha;
  String? pendidikan;
  String? pekerjaan1;
  String? pekerjaan2;
  String? noSkpk;
  DateTime? tglSekarang;
  String? deskripsiDebitur;
  List<dynamic>? nonfixed;
  List<dynamic>? fixed;
  int? createdBy;

  factory Debtor.fromJson(Map<String, dynamic> json) => Debtor(
        id: json["id"],
        noDebitur: json["no_debitur"],
        peminjam1: json["peminjam1"],
        ktp1: json["ktp1"],
        peminjam2: json["peminjam2"],
        ktp2: json["ktp2"],
        pemilikAgunan1: json["pemilik_agunan_1"],
        noKtp1: json["no_ktp1"],
        pemilikAgunan2: json["pemilik_agunan_2"],
        noKtp2: json["no_ktp2"],
        alamat1: json["alamat_1"],
        alamat2: json["alamat_2"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        umur: json["umur"],
        statusKeluarga: json["status_keluarga"],
        jumlahTanggungan: json["jumlah_tanggungan"],
        lamanyaBerusaha: json["lamanya_berusaha"],
        lokasiUsaha: json["lokasi_usaha"],
        jenisUsaha: json["jenis_usaha"],
        bidangUsaha: json["bidang_usaha"],
        pendidikan: json["pendidikan"],
        pekerjaan1: json["pekerjaan1"],
        pekerjaan2: json["pekerjaan2"],
        noSkpk: json["no_skpk"],
        tglSekarang: DateTime.parse(json["tgl_sekarang"]),
        deskripsiDebitur: json["deskripsi_debitur"],
        nonfixed: List<dynamic>.from(json["nonfixed"].map((x) => x)),
        fixed: List<dynamic>.from(json["fixed"].map((x) => x)),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_debitur": noDebitur,
        "peminjam1": peminjam1,
        "ktp1": ktp1,
        "peminjam2": peminjam2,
        "ktp2": ktp2,
        "pemilik_agunan_1": pemilikAgunan1,
        "no_ktp1": noKtp1,
        "pemilik_agunan_2": pemilikAgunan2,
        "no_ktp2": noKtp2,
        "alamat_1": alamat1,
        "alamat_2": alamat2,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "umur": umur,
        "status_keluarga": statusKeluarga,
        "jumlah_tanggungan": jumlahTanggungan,
        "lamanya_berusaha": lamanyaBerusaha,
        "lokasi_usaha": lokasiUsaha,
        "jenis_usaha": jenisUsaha,
        "bidang_usaha": bidangUsaha,
        "pendidikan": pendidikan,
        "pekerjaan1": pekerjaan1,
        "pekerjaan2": pekerjaan2,
        "no_skpk": noSkpk,
        "tgl_sekarang":
            "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "deskripsi_debitur": deskripsiDebitur,
        "nonfixed": List<dynamic>.from(nonfixed!.map((x) => x)),
        "fixed": List<dynamic>.from(fixed!.map((x) => x)),
        "createdBy": createdBy,
      };

  @override
  String toString() => toJson().toString();
}
