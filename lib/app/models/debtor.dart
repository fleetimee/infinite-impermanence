// To parse this JSON data, do
//
//     final debtor = debtorFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

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
    this.inputNeraca,
    this.inputRugiLaba,
    this.inputKeuangan,
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
  InputNeraca? inputNeraca;
  InputRugiLaba? inputRugiLaba;
  InputKeuangan? inputKeuangan;
  dynamic createdBy;

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
        inputNeraca: InputNeraca.fromJson(json["inputNeraca"]),
        inputRugiLaba: json["inputRugiLaba"] == null
            ? null
            : InputRugiLaba.fromJson(json["inputRugiLaba"]),
        inputKeuangan: json["inputKeuangan"] == null
            ? null
            : InputKeuangan.fromJson(json["inputKeuangan"]),
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
        "inputNeraca": inputNeraca?.toJson(),
        "inputRugiLaba": inputRugiLaba == null ? null : inputRugiLaba?.toJson(),
        "inputKeuangan": inputKeuangan == null ? null : inputKeuangan?.toJson(),
        "createdBy": createdBy,
      };
}

class InputKeuangan {
  InputKeuangan({
    this.id,
    this.kreditDiusulkan,
    this.angsuran,
    this.bungaPerTahun,
    this.provisi,
    this.sistemAngsuran,
    this.digunakanUntuk,
    this.angsuranRp,
    this.hpp,
    this.penjualanKini,
    this.biayaBahanKini,
    this.biayaOperasionalKini,
    this.biayaUpahKini,
    this.biayaHidupKini,
    this.penjualanAsumsi,
    this.biayaBahanAsumsi,
    this.biayaOperasionalAsumsi,
    this.biayaUpahAsumsi,
    this.biayaHidupAsumsi,
    this.tradeCycle,
  });

  int? id;
  String? kreditDiusulkan;
  int? angsuran;
  int? bungaPerTahun;
  int? provisi;
  String? sistemAngsuran;
  String? digunakanUntuk;
  String? angsuranRp;
  int? hpp;
  String? penjualanKini;
  String? biayaBahanKini;
  String? biayaOperasionalKini;
  String? biayaUpahKini;
  String? biayaHidupKini;
  String? penjualanAsumsi;
  String? biayaBahanAsumsi;
  String? biayaOperasionalAsumsi;
  String? biayaUpahAsumsi;
  String? biayaHidupAsumsi;
  int? tradeCycle;

  factory InputKeuangan.fromJson(Map<String, dynamic> json) => InputKeuangan(
        id: json["id"],
        kreditDiusulkan: json["kredit_diusulkan"],
        angsuran: json["angsuran"],
        bungaPerTahun: json["bunga_per_tahun"],
        provisi: json["provisi"],
        sistemAngsuran: json["sistem_angsuran"],
        digunakanUntuk: json["digunakan_untuk"],
        angsuranRp: json["angsuran_rp"],
        hpp: json["hpp"],
        penjualanKini: json["penjualan_kini"],
        biayaBahanKini: json["biaya_bahan_kini"],
        biayaOperasionalKini: json["biaya_operasional_kini"],
        biayaUpahKini: json["biaya_upah_kini"],
        biayaHidupKini: json["biaya_hidup_kini"],
        penjualanAsumsi: json["penjualan_asumsi"],
        biayaBahanAsumsi: json["biaya_bahan_asumsi"],
        biayaOperasionalAsumsi: json["biaya_operasional_asumsi"],
        biayaUpahAsumsi: json["biaya_upah_asumsi"],
        biayaHidupAsumsi: json["biaya_hidup_asumsi"],
        tradeCycle: json["trade_cycle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kredit_diusulkan": kreditDiusulkan,
        "angsuran": angsuran,
        "bunga_per_tahun": bungaPerTahun,
        "provisi": provisi,
        "sistem_angsuran": sistemAngsuran,
        "digunakan_untuk": digunakanUntuk,
        "angsuran_rp": angsuranRp,
        "hpp": hpp,
        "penjualan_kini": penjualanKini,
        "biaya_bahan_kini": biayaBahanKini,
        "biaya_operasional_kini": biayaOperasionalKini,
        "biaya_upah_kini": biayaUpahKini,
        "biaya_hidup_kini": biayaHidupKini,
        "penjualan_asumsi": penjualanAsumsi,
        "biaya_bahan_asumsi": biayaBahanAsumsi,
        "biaya_operasional_asumsi": biayaOperasionalAsumsi,
        "biaya_upah_asumsi": biayaUpahAsumsi,
        "biaya_hidup_asumsi": biayaHidupAsumsi,
        "trade_cycle": tradeCycle,
      };
}

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
  String? aktivaTetap;

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
        aktivaTetap: json["aktiva_tetap"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_input":
            "${tanggalInput?.year.toString().padLeft(4, '0')}-${tanggalInput?.month.toString().padLeft(2, '0')}-${tanggalInput?.day.toString().padLeft(2, '0')}",
        "kas_on_hand": kasOnHand,
        "tabungan": tabungan,
        "jumlah_kas_dan_tabungan": jumlahKasDanTabungan,
        "jumlah_piutang": jumlahPiutang,
        "jumlah_persediaan": jumlahPersediaan,
        "hutang_usaha": hutangUsaha,
        "hutang_bank": hutangBank,
        "aktiva_tetap": aktivaTetap,
      };
}

class InputRugiLaba {
  InputRugiLaba({
    this.id,
    this.kas,
    this.bank,
    this.piutang,
    this.persediaan,
    this.jumlahAktivaLancar,
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
  });

  int? id;
  String? kas;
  String? bank;
  String? piutang;
  String? persediaan;
  String? jumlahAktivaLancar;
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

  factory InputRugiLaba.fromJson(Map<String, dynamic> json) => InputRugiLaba(
        id: json["id"],
        kas: json["kas"],
        bank: json["bank"],
        piutang: json["piutang"],
        persediaan: json["persediaan"],
        jumlahAktivaLancar: json["jumlah_aktiva_lancar"],
        jumlahAktivaTetap: json["jumlah_aktiva_tetap"],
        sumAktiva: json["sum_aktiva"],
        hutangUsaha: json["hutang_usaha"],
        hutangBank: json["hutang_bank"],
        hutangLainnya: json["hutang_lainnya"],
        jumlahHutang: json["jumlah_hutang"],
        jumlahModal: json["jumlah_modal"],
        sumPasiva: json["sum_pasiva"],
        omzet: json["omzet"],
        hargaPokok: json["harga_pokok"],
        labaKotor: json["laba_kotor"],
        biayaTenagaKerja: json["biaya_tenaga_kerja"],
        biayaOperasional: json["biaya_operasional"],
        biayaLainnya: json["biaya_lainnya"],
        totalBiaya: json["total_biaya"],
        labaSebelumPajak: json["laba_sebelum_pajak"],
        perkiraanPajak: json["perkiraan_pajak"],
        labaSetelahPajak: json["laba_setelah_pajak"],
        penghasilan: json["penghasilan"],
        biayaHidup: json["biaya_hidup"],
        sisaPenghasilan: json["sisa_penghasilan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kas": kas,
        "bank": bank,
        "piutang": piutang,
        "persediaan": persediaan,
        "jumlah_aktiva_lancar": jumlahAktivaLancar,
        "jumlah_aktiva_tetap": jumlahAktivaTetap,
        "sum_aktiva": sumAktiva,
        "hutang_usaha": hutangUsaha,
        "hutang_bank": hutangBank,
        "hutang_lainnya": hutangLainnya,
        "jumlah_hutang": jumlahHutang,
        "jumlah_modal": jumlahModal,
        "sum_pasiva": sumPasiva,
        "omzet": omzet,
        "harga_pokok": hargaPokok,
        "laba_kotor": labaKotor,
        "biaya_tenaga_kerja": biayaTenagaKerja,
        "biaya_operasional": biayaOperasional,
        "biaya_lainnya": biayaLainnya,
        "total_biaya": totalBiaya,
        "laba_sebelum_pajak": labaSebelumPajak,
        "perkiraan_pajak": perkiraanPajak,
        "laba_setelah_pajak": labaSetelahPajak,
        "penghasilan": penghasilan,
        "biaya_hidup": biayaHidup,
        "sisa_penghasilan": sisaPenghasilan,
      };
}
