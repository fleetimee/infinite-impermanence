// To parse this JSON data, do
//
//     final rugiLabaInput = rugiLabaInputFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

// 🎯 Dart imports:
import 'dart:convert';

RugiLabaInput rugiLabaInputFromJson(String str) =>
    RugiLabaInput.fromJson(json.decode(str));

String rugiLabaInputToJson(RugiLabaInput data) => json.encode(data.toJson());

class RugiLabaInput {
  RugiLabaInput({
    this.id,
    this.kas,
    this.bank,
    this.piutang,
    this.persediaan,
    this.jumlahAktivaLancar,
    this.peralatan,
    this.kendaraan,
    this.tanahDanBangunan,
    this.jumlahAktivaTetap,
    this.sumAktiva,
    this.hutangUsaha,
    this.hutangBank,
    this.hutangLainnya,
    this.jumlahHutang,
    this.jumlahModal,
    this.sumPasiva,
    this.omzet,
    this.hargaPokok,
    this.labaKotor,
    this.biayaTenagaKerja,
    this.biayaOperasional,
    this.biayaLainnya,
    this.totalBiaya,
    this.labaSebelumPajak,
    this.perkiraanPajak,
    this.labaSetelahPajak,
    this.penghasilan,
    this.biayaHidup,
    this.sisaPenghasilan,
    this.neraca,
    this.debitur,
  });

  int? id;
  String? kas;
  String? bank;
  String? piutang;
  String? persediaan;
  String? jumlahAktivaLancar;
  String? peralatan;
  String? kendaraan;
  String? tanahDanBangunan;
  String? jumlahAktivaTetap;
  String? sumAktiva;
  String? hutangUsaha;
  String? hutangBank;
  String? hutangLainnya;
  String? jumlahHutang;
  String? jumlahModal;
  String? sumPasiva;
  String? omzet;
  String? hargaPokok;
  String? labaKotor;
  String? biayaTenagaKerja;
  String? biayaOperasional;
  String? biayaLainnya;
  String? totalBiaya;
  String? labaSebelumPajak;
  String? perkiraanPajak;
  String? labaSetelahPajak;
  String? penghasilan;
  String? biayaHidup;
  String? sisaPenghasilan;
  Neraca? neraca;
  Debitur? debitur;

  factory RugiLabaInput.fromJson(Map<String, dynamic> json) => RugiLabaInput(
        id: json["id"] ?? null,
        kas: json["kas"] ?? null,
        bank: json["bank"] ?? null,
        piutang: json["piutang"] ?? null,
        persediaan: json["persediaan"] ?? null,
        jumlahAktivaLancar: json["jumlah_aktiva_lancar"] ?? null,
        peralatan: json["peralatan"],
        kendaraan: json["kendaraan"],
        tanahDanBangunan: json["tanah_bangunan"],
        jumlahAktivaTetap: json["jumlah_aktiva_tetap"] ?? null,
        sumAktiva: json["sum_aktiva"] ?? null,
        hutangUsaha: json["hutang_usaha"] ?? null,
        hutangBank: json["hutang_bank"] ?? null,
        hutangLainnya: json["hutang_lainnya"] ?? null,
        jumlahHutang: json["jumlah_hutang"] ?? null,
        jumlahModal: json["jumlah_modal"] ?? null,
        sumPasiva: json["sum_pasiva"] ?? null,
        omzet: json["omzet"] ?? null,
        hargaPokok: json["harga_pokok"] ?? null,
        labaKotor: json["laba_kotor"] ?? null,
        biayaTenagaKerja: json["biaya_tenaga_kerja"] ?? null,
        biayaOperasional: json["biaya_operasional"] ?? null,
        biayaLainnya: json["biaya_lainnya"] ?? null,
        totalBiaya: json["total_biaya"] ?? null,
        labaSebelumPajak: json["laba_sebelum_pajak"] ?? null,
        perkiraanPajak: json["perkiraan_pajak"] ?? null,
        labaSetelahPajak: json["laba_setelah_pajak"] ?? null,
        penghasilan: json["penghasilan"] ?? null,
        biayaHidup: json["biaya_hidup"] ?? null,
        sisaPenghasilan: json["sisa_penghasilan"] ?? null,
        neraca: json["neraca"] == null ? null : Neraca.fromJson(json["neraca"]),
        debitur:
            json["debitur"] == null ? null : Debitur.fromJson(json["debitur"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "kas": kas ?? null,
        "bank": bank ?? null,
        "piutang": piutang ?? null,
        "persediaan": persediaan ?? null,
        "jumlah_aktiva_lancar": jumlahAktivaLancar ?? null,
        "peralatan": peralatan,
        "kendaraan": kendaraan,
        "tanah_bangunan": tanahDanBangunan,
        "jumlah_aktiva_tetap": jumlahAktivaTetap ?? null,
        "sum_aktiva": sumAktiva ?? null,
        "hutang_usaha": hutangUsaha ?? null,
        "hutang_bank": hutangBank ?? null,
        "hutang_lainnya": hutangLainnya ?? null,
        "jumlah_hutang": jumlahHutang ?? null,
        "jumlah_modal": jumlahModal ?? null,
        "sum_pasiva": sumPasiva ?? null,
        "omzet": omzet ?? null,
        "harga_pokok": hargaPokok ?? null,
        "laba_kotor": labaKotor ?? null,
        "biaya_tenaga_kerja": biayaTenagaKerja ?? null,
        "biaya_operasional": biayaOperasional ?? null,
        "biaya_lainnya": biayaLainnya ?? null,
        "total_biaya": totalBiaya ?? null,
        "laba_sebelum_pajak": labaSebelumPajak ?? null,
        "perkiraan_pajak": perkiraanPajak ?? null,
        "laba_setelah_pajak": labaSetelahPajak ?? null,
        "penghasilan": penghasilan ?? null,
        "biaya_hidup": biayaHidup ?? null,
        "sisa_penghasilan": sisaPenghasilan ?? null,
        "neraca": neraca == null ? null : neraca?.toJson(),
        "debitur": debitur == null ? null : debitur?.toJson(),
      };
}

class Debitur {
  Debitur({
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

  factory Debitur.fromJson(Map<String, dynamic> json) => Debitur(
        id: json["id"] ?? null,
        noDebitur: json["no_debitur"] ?? null,
        peminjam1: json["peminjam1"] ?? null,
        ktp1: json["ktp1"] ?? null,
        peminjam2: json["peminjam2"] ?? null,
        ktp2: json["ktp2"] ?? null,
        pemilikAgunan1: json["pemilik_agunan_1"] ?? null,
        noKtp1: json["no_ktp1"] ?? null,
        pemilikAgunan2: json["pemilik_agunan_2"] ?? null,
        noKtp2: json["no_ktp2"] ?? null,
        alamat1: json["alamat_1"] ?? null,
        alamat2: json["alamat_2"] ?? null,
        tempatLahir: json["tempat_lahir"] ?? null,
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        umur: json["umur"] ?? null,
        statusKeluarga: json["status_keluarga"] ?? null,
        jumlahTanggungan: json["jumlah_tanggungan"] ?? null,
        lamanyaBerusaha: json["lamanya_berusaha"] ?? null,
        lokasiUsaha: json["lokasi_usaha"] ?? null,
        jenisUsaha: json["jenis_usaha"] ?? null,
        bidangUsaha: json["bidang_usaha"] ?? null,
        pendidikan: json["pendidikan"] ?? null,
        pekerjaan1: json["pekerjaan1"] ?? null,
        pekerjaan2: json["pekerjaan2"] ?? null,
        noSkpk: json["no_skpk"] ?? null,
        tglSekarang: json["tgl_sekarang"] == null
            ? null
            : DateTime.parse(json["tgl_sekarang"]),
        deskripsiDebitur: json["deskripsi_debitur"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "no_debitur": noDebitur ?? null,
        "peminjam1": peminjam1 ?? null,
        "ktp1": ktp1 ?? null,
        "peminjam2": peminjam2 ?? null,
        "ktp2": ktp2 ?? null,
        "pemilik_agunan_1": pemilikAgunan1 ?? null,
        "no_ktp1": noKtp1 ?? null,
        "pemilik_agunan_2": pemilikAgunan2 ?? null,
        "no_ktp2": noKtp2 ?? null,
        "alamat_1": alamat1 ?? null,
        "alamat_2": alamat2 ?? null,
        "tempat_lahir": tempatLahir ?? null,
        "tanggal_lahir": tanggalLahir == null
            ? null
            : "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "umur": umur ?? null,
        "status_keluarga": statusKeluarga ?? null,
        "jumlah_tanggungan": jumlahTanggungan ?? null,
        "lamanya_berusaha": lamanyaBerusaha ?? null,
        "lokasi_usaha": lokasiUsaha ?? null,
        "jenis_usaha": jenisUsaha ?? null,
        "bidang_usaha": bidangUsaha ?? null,
        "pendidikan": pendidikan ?? null,
        "pekerjaan1": pekerjaan1 ?? null,
        "pekerjaan2": pekerjaan2 ?? null,
        "no_skpk": noSkpk ?? null,
        "tgl_sekarang": tglSekarang == null
            ? null
            : "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "deskripsi_debitur": deskripsiDebitur ?? null,
      };
}

class Neraca {
  Neraca({
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

  factory Neraca.fromJson(Map<String, dynamic> json) => Neraca(
        id: json["id"] ?? null,
        tanggalInput: json["tanggal_input"] == null
            ? null
            : DateTime.parse(json["tanggal_input"]),
        kasOnHand: json["kas_on_hand"] ?? null,
        tabungan: json["tabungan"] ?? null,
        jumlahKasDanTabungan: json["jumlah_kas_dan_tabungan"] ?? null,
        jumlahPiutang: json["jumlah_piutang"] ?? null,
        jumlahPersediaan: json["jumlah_persediaan"] ?? null,
        hutangUsaha: json["hutang_usaha"] ?? null,
        hutangBank: json["hutang_bank"] ?? null,
        peralatan: json["peralatan"] ?? null,
        kendaraan: json["kendaraan"] ?? null,
        tanahDanBangunan: json["tanah_bangunan"] ?? null,
        aktivaTetap: json["aktiva_tetap"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "tanggal_input": tanggalInput == null
            ? null
            : "${tanggalInput?.year.toString().padLeft(4, '0')}-${tanggalInput?.month.toString().padLeft(2, '0')}-${tanggalInput?.day.toString().padLeft(2, '0')}",
        "kas_on_hand": kasOnHand ?? null,
        "tabungan": tabungan ?? null,
        "jumlah_kas_dan_tabungan": jumlahKasDanTabungan ?? null,
        "jumlah_piutang": jumlahPiutang ?? null,
        "jumlah_persediaan": jumlahPersediaan ?? null,
        "hutang_usaha": hutangUsaha ?? null,
        "hutang_bank": hutangBank ?? null,
        "peralatan": peralatan ?? null,
        "kendaraan": kendaraan ?? null,
        "tanah_bangunan": tanahDanBangunan ?? null,
        "aktiva_tetap": aktivaTetap ?? null,
      };
}
