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
    this.analisaKeuangan,
    this.analisaBisnis,
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
  AnalisaKeuangan? analisaKeuangan;
  AnalisaBisnis? analisaBisnis;
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
        inputNeraca: json["inputNeraca"] == null
            ? null
            : InputNeraca.fromJson(json["inputNeraca"]),
        inputRugiLaba: json["inputRugiLaba"] == null
            ? null
            : InputRugiLaba.fromJson(json["inputRugiLaba"]),
        inputKeuangan: json["inputKeuangan"] == null
            ? null
            : InputKeuangan.fromJson(json["inputKeuangan"]),
        analisaKeuangan: json["analisaKeuangan"] == null
            ? null
            : AnalisaKeuangan.fromJson(json["analisaKeuangan"]),
        analisaBisnis: json["analisaBisnis"] == null
            ? null
            : AnalisaBisnis.fromJson(json["analisaBisnis"]),
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
        "inputNeraca": inputNeraca == null ? null : inputNeraca!.toJson(),
        "inputRugiLaba": inputRugiLaba == null ? null : inputRugiLaba?.toJson(),
        "inputKeuangan": inputKeuangan == null ? null : inputKeuangan?.toJson(),
        "analisaKeuangan":
            analisaKeuangan == null ? null : analisaKeuangan?.toJson(),
        "analisaBisnis": analisaBisnis == null ? null : analisaBisnis?.toJson(),
        "createdBy": createdBy,
      };
}

class AnalisaBisnis {
  AnalisaBisnis({
    this.id,
    this.nilaiOmzet,
    this.keteranganOmzet,
    this.nilaiHargaBersaing,
    this.keteranganHargaBersaing,
    this.nilaiPersaingan,
    this.keteranganPersaingan,
    this.nilaiLokasiUsaha,
    this.keteranganLokasiUsaha,
    this.nilaiProduktivitas,
    this.keteranganProduktivitas,
    this.nilaiKualitas,
    this.keteranganKualitas,
    this.deskripsiBisnis,
    this.hasilCrrBisnis,
  });

  int? id;
  int? nilaiOmzet;
  String? keteranganOmzet;
  int? nilaiHargaBersaing;
  String? keteranganHargaBersaing;
  int? nilaiPersaingan;
  String? keteranganPersaingan;
  int? nilaiLokasiUsaha;
  String? keteranganLokasiUsaha;
  int? nilaiProduktivitas;
  String? keteranganProduktivitas;
  int? nilaiKualitas;
  String? keteranganKualitas;
  String? deskripsiBisnis;
  int? hasilCrrBisnis;

  factory AnalisaBisnis.fromJson(Map<String, dynamic> json) => AnalisaBisnis(
        id: json["id"],
        nilaiOmzet: json["nilai_omzet"],
        keteranganOmzet: json["keterangan_omzet"],
        nilaiHargaBersaing: json["nilai_harga_bersaing"],
        keteranganHargaBersaing: json["keterangan_harga_bersaing"],
        nilaiPersaingan: json["nilai_persaingan"],
        keteranganPersaingan: json["keterangan_persaingan"],
        nilaiLokasiUsaha: json["nilai_lokasi_usaha"],
        keteranganLokasiUsaha: json["keterangan_lokasi_usaha"],
        nilaiProduktivitas: json["nilai_produktivitas"],
        keteranganProduktivitas: json["keterangan_produktivitas"],
        nilaiKualitas: json["nilai_kualitas"],
        keteranganKualitas: json["keterangan_kualitas"],
        deskripsiBisnis: json["deskripsi_bisnis"],
        hasilCrrBisnis: json["hasil_crr_bisnis"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nilai_omzet": nilaiOmzet,
        "keterangan_omzet": keteranganOmzet,
        "nilai_harga_bersaing": nilaiHargaBersaing,
        "keterangan_harga_bersaing": keteranganHargaBersaing,
        "nilai_persaingan": nilaiPersaingan,
        "keterangan_persaingan": keteranganPersaingan,
        "nilai_lokasi_usaha": nilaiLokasiUsaha,
        "keterangan_lokasi_usaha": keteranganLokasiUsaha,
        "nilai_produktivitas": nilaiProduktivitas,
        "keterangan_produktivitas": keteranganProduktivitas,
        "nilai_kualitas": nilaiKualitas,
        "keterangan_kualitas": keteranganKualitas,
        "deskripsi_bisnis": deskripsiBisnis,
        "hasil_crr_bisnis": hasilCrrBisnis,
      };
}

class AnalisaKeuangan {
  AnalisaKeuangan({
    this.id,
    this.totalAset,
    this.jumlahAsetKini,
    this.totalAngsuranKeseluruhan,
    this.persenOmzetKini,
    this.persenOmzetYad,
    this.persenBiayaBahanKini,
    this.persenBiayaBahanYad,
    this.persenBiayaOperasiKini,
    this.persenBiayaOperasiYad,
    this.persenBiayaUpahKini,
    this.persenBiayaUpahYad,
    this.persenBiayaHidupKini,
    this.persenBiayaHidupYad,
    this.totalLabaUsahaKini,
    this.totalLabaUsahaYad,
    this.persenLabaUsahaKini,
    this.persenLabaUsahaYad,
    this.persenRatioKini,
    this.persenRatioYad,
    this.persenRoeKini,
    this.persenRoeYad,
    this.keteranganRoe,
    this.persenRoaKini,
    this.persenRoaYad,
    this.keteranganRoa,
    this.persenDerKini,
    this.persenDerYad,
    this.keteranganDer,
    this.persenDscKini,
    this.persenDscYad,
    this.keteranganDsc,
    this.kreditDisetujuin,
    this.pinjamanMaksimal,
    this.perhitunganModalKerja,
    this.kebutuhanInvestasi,
    this.kebutuhanKredit,
    this.totalCrrKeuangan,
  });

  int? id;
  String? totalAset;
  String? jumlahAsetKini;
  String? totalAngsuranKeseluruhan;
  String? persenOmzetKini;
  String? persenOmzetYad;
  String? persenBiayaBahanKini;
  String? persenBiayaBahanYad;
  String? persenBiayaOperasiKini;
  String? persenBiayaOperasiYad;
  String? persenBiayaUpahKini;
  String? persenBiayaUpahYad;
  String? persenBiayaHidupKini;
  String? persenBiayaHidupYad;
  String? totalLabaUsahaKini;
  String? totalLabaUsahaYad;
  String? persenLabaUsahaKini;
  String? persenLabaUsahaYad;
  String? persenRatioKini;
  String? persenRatioYad;
  String? persenRoeKini;
  String? persenRoeYad;
  String? keteranganRoe;
  String? persenRoaKini;
  String? persenRoaYad;
  String? keteranganRoa;
  String? persenDerKini;
  String? persenDerYad;
  String? keteranganDer;
  String? persenDscKini;
  String? persenDscYad;
  String? keteranganDsc;
  bool? kreditDisetujuin;
  String? pinjamanMaksimal;
  String? perhitunganModalKerja;
  String? kebutuhanInvestasi;
  String? kebutuhanKredit;
  double? totalCrrKeuangan;

  factory AnalisaKeuangan.fromJson(Map<String, dynamic> json) =>
      AnalisaKeuangan(
        id: json["id"],
        totalAset: json["total_aset"],
        jumlahAsetKini: json["jumlah_aset_kini"],
        totalAngsuranKeseluruhan: json["total_angsuran_keseluruhan"],
        persenOmzetKini: json["persen_omzet_kini"],
        persenOmzetYad: json["persen_omzet_yad"],
        persenBiayaBahanKini: json["persen_biaya_bahan_kini"],
        persenBiayaBahanYad: json["persen_biaya_bahan_yad"],
        persenBiayaOperasiKini: json["persen_biaya_operasi_kini"],
        persenBiayaOperasiYad: json["persen_biaya_operasi_yad"],
        persenBiayaUpahKini: json["persen_biaya_upah_kini"],
        persenBiayaUpahYad: json["persen_biaya_upah_yad"],
        persenBiayaHidupKini: json["persen_biaya_hidup_kini"],
        persenBiayaHidupYad: json["persen_biaya_hidup_yad"],
        totalLabaUsahaKini: json["total_laba_usaha_kini"],
        totalLabaUsahaYad: json["total_laba_usaha_yad"],
        persenLabaUsahaKini: json["persen_laba_usaha_kini"],
        persenLabaUsahaYad: json["persen_laba_usaha_yad"],
        persenRatioKini: json["persen_ratio_kini"],
        persenRatioYad: json["persen_ratio_yad"],
        persenRoeKini: json["persen_roe_kini"],
        persenRoeYad: json["persen_roe_yad"],
        keteranganRoe: json["keterangan_roe"],
        persenRoaKini: json["persen_roa_kini"],
        persenRoaYad: json["persen_roa_yad"],
        keteranganRoa: json["keterangan_roa"],
        persenDerKini: json["persen_der_kini"],
        persenDerYad: json["persen_der_yad"],
        keteranganDer: json["keterangan_der"],
        persenDscKini: json["persen_dsc_kini"],
        persenDscYad: json["persen_dsc_yad"],
        keteranganDsc: json["keterangan_dsc"],
        kreditDisetujuin: json["kredit_disetujuin"],
        pinjamanMaksimal: json["pinjaman_maksimal"],
        perhitunganModalKerja: json["perhitungan_modal_kerja"],
        kebutuhanInvestasi: json["kebutuhan_investasi"],
        kebutuhanKredit: json["kebutuhan_kredit"],
        totalCrrKeuangan: json["total_crr_keuangan"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_aset": totalAset,
        "jumlah_aset_kini": jumlahAsetKini,
        "total_angsuran_keseluruhan": totalAngsuranKeseluruhan,
        "persen_omzet_kini": persenOmzetKini,
        "persen_omzet_yad": persenOmzetYad,
        "persen_biaya_bahan_kini": persenBiayaBahanKini,
        "persen_biaya_bahan_yad": persenBiayaBahanYad,
        "persen_biaya_operasi_kini": persenBiayaOperasiKini,
        "persen_biaya_operasi_yad": persenBiayaOperasiYad,
        "persen_biaya_upah_kini": persenBiayaUpahKini,
        "persen_biaya_upah_yad": persenBiayaUpahYad,
        "persen_biaya_hidup_kini": persenBiayaHidupKini,
        "persen_biaya_hidup_yad": persenBiayaHidupYad,
        "total_laba_usaha_kini": totalLabaUsahaKini,
        "total_laba_usaha_yad": totalLabaUsahaYad,
        "persen_laba_usaha_kini": persenLabaUsahaKini,
        "persen_laba_usaha_yad": persenLabaUsahaYad,
        "persen_ratio_kini": persenRatioKini,
        "persen_ratio_yad": persenRatioYad,
        "persen_roe_kini": persenRoeKini,
        "persen_roe_yad": persenRoeYad,
        "keterangan_roe": keteranganRoe,
        "persen_roa_kini": persenRoaKini,
        "persen_roa_yad": persenRoaYad,
        "keterangan_roa": keteranganRoa,
        "persen_der_kini": persenDerKini,
        "persen_der_yad": persenDerYad,
        "keterangan_der": keteranganDer,
        "persen_dsc_kini": persenDscKini,
        "persen_dsc_yad": persenDscYad,
        "keterangan_dsc": keteranganDsc,
        "kredit_disetujuin": kreditDisetujuin,
        "pinjaman_maksimal": pinjamanMaksimal,
        "perhitungan_modal_kerja": perhitunganModalKerja,
        "kebutuhan_investasi": kebutuhanInvestasi,
        "kebutuhan_kredit": kebutuhanKredit,
        "total_crr_keuangan": totalCrrKeuangan,
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
        tanahDanBangunan: json["tanah_bangunan"],
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
        "peralatan": peralatan,
        "kendaraan": kendaraan,
        "tanah_bangunan": tanahDanBangunan,
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

  factory InputRugiLaba.fromJson(Map<String, dynamic> json) => InputRugiLaba(
        id: json["id"],
        kas: json["kas"],
        bank: json["bank"],
        piutang: json["piutang"],
        persediaan: json["persediaan"],
        jumlahAktivaLancar: json["jumlah_aktiva_lancar"],
        peralatan: json["peralatan"],
        kendaraan: json["kendaraan"],
        tanahDanBangunan: json["tanah_bangunan"],
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
        "peralatan": peralatan,
        "kendaraan": kendaraan,
        "tanah_bangunan": tanahDanBangunan,
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
