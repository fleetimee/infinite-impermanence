// ignore_for_file: prefer_null_aware_operators, unnecessary_null_in_if_null_operators

// 🎯 Dart imports:
import 'dart:convert';

DebiturInsight debiturInsightFromJson(String str) =>
    DebiturInsight.fromJson(json.decode(str));

String debiturInsightToJson(DebiturInsight data) => json.encode(data.toJson());

class DebiturInsight {
  DebiturInsight({
    this.id,
    this.noDebitur,
    this.peminjam1,
    this.ktp1,
    this.peminjam2,
    this.peminjam3,
    this.peminjam4,
    this.ktp2,
    this.pemilikAgunan1,
    this.noKtp1,
    this.pemilikAgunan2,
    this.noKtp2,
    this.alamat1,
    this.alamat2,
    this.alamat3,
    this.alamat4,
    this.tempatLahir,
    this.tanggalLahir,
    this.noHp,
    this.umur,
    this.npwp,
    this.statusKeluarga,
    this.jumlahTanggungan,
    this.lamanyaBerusaha,
    this.lokasiUsaha,
    this.jumlahKaryawan,
    this.jenisUsaha,
    this.bidangUsaha,
    this.pendidikan,
    this.pekerjaan1,
    this.pekerjaan2,
    this.noSkpk,
    this.tglSekarang,
    this.deskripsiDebitur,
    this.progress,
    this.userId,
    this.user,
    this.pengajuan,
    this.createdBy,
    this.ijinLegitimasi,
    this.syaratLain,
    this.asuransi,
    this.inputNeraca,
    this.inputRugiLaba,
    this.inputKeuangan,
    this.analisaKeuangan,
    this.analisaKarakter,
    this.analisaBisnis,
    this.analisaJenisUsaha,
    this.agunan,
    this.analisaAgunan,
    this.upload,
  });

  int? id;
  String? noDebitur;
  String? peminjam1;
  String? ktp1;
  String? peminjam2;
  String? peminjam3;
  String? peminjam4;
  String? ktp2;
  String? pemilikAgunan1;
  String? noKtp1;
  String? pemilikAgunan2;
  String? noKtp2;
  String? alamat1;
  String? alamat2;
  String? alamat3;
  String? alamat4;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? noHp;
  int? umur;
  String? npwp;
  String? statusKeluarga;
  int? jumlahTanggungan;
  int? lamanyaBerusaha;
  String? lokasiUsaha;
  int? jumlahKaryawan;
  String? jenisUsaha;
  String? bidangUsaha;
  String? pendidikan;
  String? pekerjaan1;
  String? pekerjaan2;
  String? noSkpk;
  DateTime? tglSekarang;
  String? deskripsiDebitur;
  String? progress;
  String? userId;
  User? user;
  List<Pengajuan>? pengajuan;
  dynamic createdBy;
  IjinLegitimasi? ijinLegitimasi;
  Asuransi? asuransi;
  InputNeraca? inputNeraca;
  InputRugiLaba? inputRugiLaba;
  InputKeuangan? inputKeuangan;
  AnalisaKeuangan? analisaKeuangan;
  AnalisaKarakter? analisaKarakter;
  AnalisaBisnis? analisaBisnis;
  AnalisaJenisUsaha? analisaJenisUsaha;
  List<Agunan>? agunan;
  List<SyaratLain>? syaratLain;
  AnalisaAgunan? analisaAgunan;
  List<Upload>? upload;

  factory DebiturInsight.fromJson(Map<String, dynamic> json) => DebiturInsight(
        id: json["id"],
        noDebitur: json["no_debitur"],
        peminjam1: json["peminjam1"],
        ktp1: json["ktp1"],
        peminjam2: json["peminjam2"],
        peminjam3: json["peminjam3"],
        peminjam4: json["peminjam4"],
        ktp2: json["ktp2"],
        pemilikAgunan1: json["pemilik_agunan_1"],
        noKtp1: json["no_ktp1"],
        pemilikAgunan2: json["pemilik_agunan_2"],
        noKtp2: json["no_ktp2"],
        alamat1: json["alamat_1"],
        alamat2: json["alamat_2"],
        alamat3: json["alamat_3"],
        alamat4: json["alamat_4"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        noHp: json["no_hp"] ?? null,
        umur: json["umur"],
        npwp: json["npwp"] ?? null,
        statusKeluarga: json["status_keluarga"],
        jumlahTanggungan: json["jumlah_tanggungan"],
        lamanyaBerusaha: json["lamanya_berusaha"],
        lokasiUsaha: json["lokasi_usaha"],
        jumlahKaryawan: json["jumlah_karyawan"] ?? null,
        jenisUsaha: json["jenis_usaha"],
        bidangUsaha: json["bidang_usaha"],
        pendidikan: json["pendidikan"],
        pekerjaan1: json["pekerjaan1"],
        pekerjaan2: json["pekerjaan2"],
        noSkpk: json["no_skpk"],
        tglSekarang: json["tgl_sekarang"] == null
            ? null
            : DateTime.parse(json["tgl_sekarang"]),
        deskripsiDebitur: json["deskripsi_debitur"],
        progress: json["progress"] ?? null,
        userId: json["userId"] ?? null,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        pengajuan: json["pengajuan"] == null
            ? null
            : List<Pengajuan>.from(
                json["pengajuan"].map((x) => Pengajuan.fromJson(x))),
        createdBy: json["createdBy"],
        ijinLegitimasi: json["ijinLegitimasi"] == null
            ? null
            : IjinLegitimasi.fromJson(json["ijinLegitimasi"]),
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
        analisaKarakter: json["analisaKarakter"] == null
            ? null
            : AnalisaKarakter.fromJson(json["analisaKarakter"]),
        analisaBisnis: json["analisaBisnis"] == null
            ? null
            : AnalisaBisnis.fromJson(json["analisaBisnis"]),
        analisaJenisUsaha: json["analisaJenisUsaha"] == null
            ? null
            : AnalisaJenisUsaha.fromJson(json["analisaJenisUsaha"]),
        agunan: json["agunan"] == null
            ? null
            : List<Agunan>.from(json["agunan"].map((x) => Agunan.fromJson(x))),
        syaratLain: json["syaratLain"] == null
            ? null
            : List<SyaratLain>.from(
                json["syaratLain"].map((x) => SyaratLain.fromJson(x))),
        asuransi: json["asuransi"] == null
            ? null
            : Asuransi.fromJson(json["asuransi"]),
        analisaAgunan: json["analisaAgunan"] == null
            ? null
            : AnalisaAgunan.fromJson(json["analisaAgunan"]),
        upload: json["upload"] == null
            ? null
            : List<Upload>.from(json["upload"].map((x) => Upload.fromJson(x))),
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
        "alamat_3": alamat3,
        "alamat_4": alamat4,
        "tempat_lahir": tempatLahir,
        "no_hp": noHp ?? null,
        "tanggal_lahir": tanggalLahir == null
            ? null
            : "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "npwp": npwp ?? null,
        "umur": umur,
        "status_keluarga": statusKeluarga,
        "jumlah_tanggungan": jumlahTanggungan,
        "lamanya_berusaha": lamanyaBerusaha,
        "lokasi_usaha": lokasiUsaha,
        "jumlah_karyawan": jumlahKaryawan ?? null,
        "jenis_usaha": jenisUsaha,
        "bidang_usaha": bidangUsaha,
        "pendidikan": pendidikan,
        "pekerjaan1": pekerjaan1,
        "pekerjaan2": pekerjaan2,
        "no_skpk": noSkpk,
        "tgl_sekarang": tglSekarang == null
            ? null
            : "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "deskripsi_debitur": deskripsiDebitur,
        "progress": progress ?? null,
        "userId": userId ?? null,
        "user": user == null ? null : user?.toJson(),
        "pengajuan": pengajuan == null
            ? null
            : List<dynamic>.from(pengajuan!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "ijinLegitimasi":
            ijinLegitimasi == null ? null : ijinLegitimasi?.toJson(),
        "inputNeraca": inputNeraca == null ? null : inputNeraca?.toJson(),
        "inputRugiLaba": inputRugiLaba == null ? null : inputRugiLaba?.toJson(),
        "inputKeuangan": inputKeuangan == null ? null : inputKeuangan?.toJson(),
        "analisaKeuangan":
            analisaKeuangan == null ? null : analisaKeuangan?.toJson(),
        "analisaKarakter":
            analisaKarakter == null ? null : analisaKarakter?.toJson(),
        "analisaBisnis": analisaBisnis == null ? null : analisaBisnis?.toJson(),
        "analisaJenisUsaha":
            analisaJenisUsaha == null ? null : analisaJenisUsaha?.toJson(),
        "asuransi": asuransi == null ? null : asuransi?.toJson(),
        "agunan": agunan == null
            ? null
            : List<dynamic>.from(agunan!.map((x) => x.toJson())),
        "syaratLain": syaratLain == null
            ? null
            : List<dynamic>.from(syaratLain!.map((x) => x.toJson())),
        "analisaAgunan": analisaAgunan == null ? null : analisaAgunan?.toJson(),
        "upload": upload == null
            ? null
            : List<dynamic>.from(upload!.map((x) => x.toJson())),
      };
}

class Pengajuan {
  Pengajuan({
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

  factory Pengajuan.fromJson(Map<String, dynamic> json) => Pengajuan(
        id: json["id"] ?? null,
        status: json["status"] ?? null,
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
        debiturId: json["debiturId"] ?? null,
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "status": status ?? null,
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
        "debiturId": debiturId ?? null,
        "user": user == null
            ? null
            : List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.id,
    this.email,
    this.phoneNumber,
    this.password,
    this.displayName,
    this.photoUrl,
    this.createdAt,
  });

  String? id;
  String? email;
  String? phoneNumber;
  String? password;
  String? displayName;
  String? photoUrl;
  DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? null,
        email: json["email"] ?? null,
        phoneNumber: json["phoneNumber"] ?? null,
        password: json["password"] ?? null,
        displayName: json["displayName"] ?? null,
        photoUrl: json["photoURL"] ?? null,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "email": email ?? null,
        "phoneNumber": phoneNumber ?? null,
        "password": password ?? null,
        "displayName": displayName ?? null,
        "photoURL": photoUrl ?? null,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
      };
}

class Upload {
  Upload({
    this.id,
    this.keterangan,
    this.file,
    this.createdDate,
    this.updatedDate,
    this.debiturId,
  });

  int? id;
  String? keterangan;
  String? file;
  DateTime? createdDate;
  DateTime? updatedDate;
  int? debiturId;

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
        id: json["id"] ?? null,
        keterangan: json["keterangan"] ?? null,
        file: json["file"] ?? null,
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        debiturId: json["debiturId"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "keterangan": keterangan ?? null,
        "file": file ?? null,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "updatedDate":
            updatedDate == null ? null : updatedDate?.toIso8601String(),
        "debiturId": debiturId ?? null,
      };
}

class Asuransi {
  Asuransi({
    this.id,
    this.namaPerusahaan,
    this.premi,
    this.totalAsuransi,
    this.debiturId,
  });

  int? id;
  String? namaPerusahaan;
  String? premi;
  String? totalAsuransi;
  int? debiturId;

  factory Asuransi.fromJson(Map<String, dynamic> json) => Asuransi(
        id: json["id"] ?? null,
        namaPerusahaan: json["nama_perusahaan"] ?? null,
        premi: json["premi"] ?? null,
        totalAsuransi: json["total_asuransi"] ?? null,
        debiturId: json["debiturId"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "nama_perusahaan": namaPerusahaan ?? null,
        "premi": premi ?? null,
        "total_asuransi": totalAsuransi ?? null,
        "debiturId": debiturId ?? null,
      };
}

class IjinLegitimasi {
  IjinLegitimasi({
    this.id,
    this.jenisIjin,
    this.keteranganIjin,
    this.debiturId,
  });

  int? id;
  String? jenisIjin;
  String? keteranganIjin;
  int? debiturId;

  factory IjinLegitimasi.fromJson(Map<String, dynamic> json) => IjinLegitimasi(
        id: json["id"] ?? null,
        jenisIjin: json["jenis_ijin"] ?? null,
        keteranganIjin: json["keterangan_ijin"] ?? null,
        debiturId: json["debiturId"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "jenis_ijin": jenisIjin ?? null,
        "keterangan_ijin": keteranganIjin ?? null,
        "debiturId": debiturId ?? null,
      };
}

class AnalisaAgunan {
  AnalisaAgunan({
    this.id,
    this.totalAgunan,
    this.totalCrrAgunan,
    this.ratioAgunan,
    this.debiturId,
  });

  int? id;
  String? totalAgunan;
  String? totalCrrAgunan;
  String? ratioAgunan;
  int? debiturId;

  factory AnalisaAgunan.fromJson(Map<String, dynamic> json) => AnalisaAgunan(
        id: json["id"] ?? null,
        totalAgunan: json["total_agunan"] ?? null,
        totalCrrAgunan: json["total_crr_agunan"] ?? null,
        ratioAgunan: json["ratio_agunan"] ?? null,
        debiturId: json["debiturId"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "total_agunan": totalAgunan ?? null,
        "total_crr_agunan": totalCrrAgunan ?? null,
        "ratio_agunan": ratioAgunan ?? null,
        "debiturId": debiturId ?? null,
      };
}

class SyaratLain {
  SyaratLain({
    this.id,
    this.keterangan,
    this.debiturId,
  });

  int? id;
  String? keterangan;
  int? debiturId;

  factory SyaratLain.fromJson(Map<String, dynamic> json) => SyaratLain(
        id: json["id"] ?? null,
        keterangan: json["keterangan"] ?? null,
        debiturId: json["debiturId"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "keterangan": keterangan ?? null,
        "debiturId": debiturId ?? null,
      };
}

class Agunan {
  Agunan({
    this.id,
    this.kodeAgunan,
    this.jenisAgunan,
    this.isTanah,
    this.isLos,
    this.isKendaraan,
    this.debiturId,
    this.formTanah,
    this.formKendaraan,
    this.formLos,
    this.formPeralatan,
    this.formCash,
    this.formLainnya,
    this.formTanahBangunan,
  });

  int? id;
  int? kodeAgunan;
  String? jenisAgunan;
  bool? isTanah;
  bool? isLos;
  bool? isKendaraan;
  int? debiturId;
  List<FormTanah>? formTanah;
  List<FormTanahBangunan>? formTanahBangunan;
  List<FormKendaraan>? formKendaraan;
  List<FormLo>? formLos;
  List<FormCommon>? formPeralatan;
  List<FormCommon>? formCash;
  List<FormCommon>? formLainnya;

  factory Agunan.fromJson(Map<String, dynamic> json) => Agunan(
        id: json["id"],
        kodeAgunan: json["kode_agunan"],
        jenisAgunan: json["jenis_agunan"],
        isTanah: json["is_tanah"],
        isLos: json["is_los"],
        isKendaraan: json["is_kendaraan"],
        debiturId: json["debiturId"],
        formTanah: json["form_tanah"] == null
            ? null
            : List<FormTanah>.from(
                json["form_tanah"].map((x) => FormTanah.fromJson(x))),
        formKendaraan: json["form_kendaraan"] == null
            ? null
            : List<FormKendaraan>.from(
                json["form_kendaraan"].map((x) => FormKendaraan.fromJson(x))),
        formLos: json["form_los"] == null
            ? null
            : List<FormLo>.from(
                json["form_los"].map((x) => FormLo.fromJson(x))),
        formPeralatan: json["form_peralatan"] == null
            ? null
            : List<FormCommon>.from(
                json["form_peralatan"].map((x) => FormCommon.fromJson(x))),
        formCash: json["form_cash"] == null
            ? null
            : List<FormCommon>.from(
                json["form_cash"].map((x) => FormCommon.fromJson(x))),
        formLainnya: json["form_lainnya"] == null
            ? null
            : List<FormCommon>.from(
                json["form_lainnya"].map((x) => FormCommon.fromJson(x))),
        formTanahBangunan: json["form_tanah_bangunan"] == null
            ? null
            : List<FormTanahBangunan>.from(json["form_tanah_bangunan"]
                .map((x) => FormTanahBangunan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_agunan": kodeAgunan,
        "jenis_agunan": jenisAgunan,
        "is_tanah": isTanah,
        "is_los": isLos,
        "is_kendaraan": isKendaraan,
        "debiturId": debiturId,
        "form_tanah": formTanah == null
            ? null
            : List<dynamic>.from(formTanah!.map((x) => x.toJson())),
        "form_kendaraan": formKendaraan == null
            ? null
            : List<dynamic>.from(formKendaraan!.map((x) => x.toJson())),
        "form_los": formLos == null
            ? null
            : List<dynamic>.from(formLos!.map((x) => x.toJson())),
        "form_peralatan": formPeralatan == null
            ? null
            : List<dynamic>.from(formPeralatan!.map((x) => x.toJson())),
        "form_cash": formCash == null
            ? null
            : List<dynamic>.from(formCash!.map((x) => x.toJson())),
        "form_lainnya": formLainnya == null
            ? null
            : List<dynamic>.from(formLainnya!.map((x) => x.toJson())),
        "form_tanah_bangunan": formTanahBangunan == null
            ? null
            : List<dynamic>.from(formTanahBangunan!.map((x) => x.toJson())),
      };
}

class FormCommon {
  FormCommon({
    this.id,
    this.deskripsiPanjang,
    this.nilaiPasar,
    this.nilaiLiquidasi,
    this.nilaiPengikatan,
    this.pengikatan,
    this.agunanId,
    this.namaAsuransiPenjamin,
  });

  int? id;
  String? deskripsiPanjang;
  String? nilaiPasar;
  String? nilaiLiquidasi;
  String? nilaiPengikatan;
  String? pengikatan;
  int? agunanId;
  String? namaAsuransiPenjamin;

  factory FormCommon.fromJson(Map<String, dynamic> json) => FormCommon(
        id: json["id"],
        deskripsiPanjang: json["deskripsi_panjang"],
        nilaiPasar: json["nilai_pasar"],
        nilaiLiquidasi: json["nilai_liquidasi"],
        nilaiPengikatan: json["nilai_pengikatan"],
        pengikatan: json["pengikatan"],
        agunanId: json["agunanId"],
        namaAsuransiPenjamin: json["nama_asuransi_penjamin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deskripsi_panjang": deskripsiPanjang,
        "nilai_pasar": nilaiPasar,
        "nilai_liquidasi": nilaiLiquidasi,
        "nilai_pengikatan": nilaiPengikatan,
        "pengikatan": pengikatan,
        "agunanId": agunanId,
        "nama_asuransi_penjamin": namaAsuransiPenjamin,
      };
}

class FormKendaraan {
  FormKendaraan({
    this.id,
    this.jenis,
    this.merk,
    this.type,
    this.warna,
    this.tahun,
    this.noPolisi,
    this.noRangka,
    this.noMesin,
    this.noBpkb,
    this.namaPemilik,
    this.kondisi,
    this.nilaiPasar,
    this.nilaiLiquidasi,
    this.nilaiPengikatan,
    this.pengikatan,
    this.deskripsiPanjang,
    this.agunanId,
  });

  int? id;
  String? jenis;
  String? merk;
  String? type;
  String? warna;
  int? tahun;
  String? noPolisi;
  String? noRangka;
  String? noMesin;
  String? noBpkb;
  String? namaPemilik;
  String? kondisi;
  String? nilaiPasar;
  String? nilaiLiquidasi;
  String? nilaiPengikatan;
  String? pengikatan;
  String? deskripsiPanjang;
  int? agunanId;

  factory FormKendaraan.fromJson(Map<String, dynamic> json) => FormKendaraan(
        id: json["id"],
        jenis: json["jenis"],
        merk: json["merk"],
        type: json["type"],
        warna: json["warna"],
        tahun: json["tahun"],
        noPolisi: json["no_polisi"],
        noRangka: json["no_rangka"],
        noMesin: json["no_mesin"],
        noBpkb: json["no_bpkb"],
        namaPemilik: json["nama_pemilik"],
        kondisi: json["kondisi"],
        nilaiPasar: json["nilai_pasar"],
        nilaiLiquidasi: json["nilai_liquidasi"],
        nilaiPengikatan: json["nilai_pengikatan"],
        pengikatan: json["pengikatan"],
        deskripsiPanjang: json["deskripsi_panjang"],
        agunanId: json["agunanId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis": jenis,
        "merk": merk,
        "type": type,
        "warna": warna,
        "tahun": tahun,
        "no_polisi": noPolisi,
        "no_rangka": noRangka,
        "no_mesin": noMesin,
        "no_bpkb": noBpkb,
        "nama_pemilik": namaPemilik,
        "kondisi": kondisi,
        "nilai_pasar": nilaiPasar,
        "nilai_liquidasi": nilaiLiquidasi,
        "nilai_pengikatan": nilaiPengikatan,
        "pengikatan": pengikatan,
        "deskripsi_panjang": deskripsiPanjang,
        "agunanId": agunanId,
      };
}

class FormLo {
  FormLo({
    this.id,
    this.deskripsiPendek,
    this.namaPemilik,
    this.komponen,
    this.tempatLahir,
    this.tanggalLahir,
    this.alamatPemilik,
    this.tempatDasaran,
    this.noRegistrasi,
    this.luasLos,
    this.jenisDagangan,
    this.waktuBuka,
    this.waktuTutup,
    this.berlakuSampai,
    this.nilaiPasar,
    this.nilaiLiquidasi,
    this.nilaiPengikatan,
    this.lokasiPasar,
    this.titikKoordinat,
    this.pengikatan,
    this.deskripsiPanjang,
    this.agunanId,
  });

  int? id;
  String? deskripsiPendek;
  String? namaPemilik;
  String? komponen;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? alamatPemilik;
  String? tempatDasaran;
  String? noRegistrasi;
  int? luasLos;
  String? jenisDagangan;
  String? waktuBuka;
  String? waktuTutup;
  DateTime? berlakuSampai;
  int? nilaiPasar;
  int? nilaiLiquidasi;
  int? nilaiPengikatan;
  String? lokasiPasar;
  String? titikKoordinat;
  String? pengikatan;
  String? deskripsiPanjang;
  int? agunanId;

  factory FormLo.fromJson(Map<String, dynamic> json) => FormLo(
        id: json["id"],
        deskripsiPendek: json["deskripsi_pendek"],
        namaPemilik: json["nama_pemilik"],
        komponen: json["komponen"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        alamatPemilik: json["alamat_pemilik"],
        tempatDasaran: json["tempat_dasaran"],
        noRegistrasi: json["no_registrasi"],
        luasLos: json["luas_los"],
        jenisDagangan: json["jenis_dagangan"],
        waktuBuka: json["waktu_buka"],
        waktuTutup: json["waktu_tutup"],
        berlakuSampai: json["berlaku_sampai"] == null
            ? null
            : DateTime.parse(json["berlaku_sampai"]),
        nilaiPasar: json["nilai_pasar"],
        nilaiLiquidasi: json["nilai_liquidasi"],
        nilaiPengikatan: json["nilai_pengikatan"],
        lokasiPasar: json["lokasi_pasar"],
        titikKoordinat: json["titik_koordinat"],
        pengikatan: json["pengikatan"],
        deskripsiPanjang: json["deskripsi_panjang"],
        agunanId: json["agunanId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deskripsi_pendek": deskripsiPendek,
        "nama_pemilik": namaPemilik,
        "komponen": komponen,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir == null
            ? null
            : "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "alamat_pemilik": alamatPemilik,
        "tempat_dasaran": tempatDasaran,
        "no_registrasi": noRegistrasi,
        "luas_los": luasLos,
        "jenis_dagangan": jenisDagangan,
        "waktu_buka": waktuBuka,
        "waktu_tutup": waktuTutup,
        "berlaku_sampai": berlakuSampai == null
            ? null
            : "${berlakuSampai?.year.toString().padLeft(4, '0')}-${berlakuSampai?.month.toString().padLeft(2, '0')}-${berlakuSampai?.day.toString().padLeft(2, '0')}",
        "nilai_pasar": nilaiPasar,
        "nilai_liquidasi": nilaiLiquidasi,
        "nilai_pengikatan": nilaiPengikatan,
        "lokasi_pasar": lokasiPasar,
        "titik_koordinat": titikKoordinat,
        "pengikatan": pengikatan,
        "deskripsi_panjang": deskripsiPanjang,
        "agunanId": agunanId,
      };
}

class FormTanah {
  FormTanah({
    this.id,
    this.deskripsiPendek,
    this.namaPemilik,
    this.buktiKepemilikan,
    this.luasTanah,
    this.tanggal,
    this.nilaiPasar,
    this.nilaiLiquidasi,
    this.nilaiPengikatan,
    this.pengikatan,
    this.lokasi,
    this.titikKoordinat,
    this.deskripsiPanjang,
    this.agunanId,
  });

  int? id;
  String? deskripsiPendek;
  String? namaPemilik;
  String? buktiKepemilikan;
  int? luasTanah;
  DateTime? tanggal;

  String? nilaiPasar;
  String? nilaiLiquidasi;
  String? nilaiPengikatan;
  String? pengikatan;
  String? lokasi;
  String? titikKoordinat;
  String? deskripsiPanjang;
  int? agunanId;

  factory FormTanah.fromJson(Map<String, dynamic> json) => FormTanah(
        id: json["id"],
        deskripsiPendek: json["deskripsi_pendek"],
        namaPemilik: json["nama_pemilik"],
        buktiKepemilikan: json["bukti_kepemilikan"],
        luasTanah: json["luas_tanah"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        nilaiPasar: json["nilai_pasar"],
        nilaiLiquidasi: json["nilai_liquidasi"],
        nilaiPengikatan: json["nilai_pengikatan"],
        pengikatan: json["pengikatan"],
        lokasi: json["lokasi"],
        titikKoordinat: json["titik_koordinat"],
        deskripsiPanjang: json["deskripsi_panjang"],
        agunanId: json["agunanId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deskripsi_pendek": deskripsiPendek,
        "nama_pemilik": namaPemilik,
        "bukti_kepemilikan": buktiKepemilikan,
        "luas_tanah": luasTanah,
        "tanggal": tanggal == null
            ? null
            : "${tanggal?.year.toString().padLeft(4, '0')}-${tanggal?.month.toString().padLeft(2, '0')}-${tanggal?.day.toString().padLeft(2, '0')}",
        "nilai_pasar": nilaiPasar,
        "nilai_liquidasi": nilaiLiquidasi,
        "nilai_pengikatan": nilaiPengikatan,
        "pengikatan": pengikatan,
        "lokasi": lokasi,
        "titik_koordinat": titikKoordinat,
        "deskripsi_panjang": deskripsiPanjang,
        "agunanId": agunanId,
      };
}

class FormTanahBangunan {
  FormTanahBangunan({
    this.id,
    this.deskripsiPendek,
    this.namaPemilik,
    this.buktiKepemilikan,
    this.luasTanah,
    this.tanggal,
    this.nilaiPasarTanah,
    this.nilaiLiquidasiTanah,
    this.nilaiPasarBangunan,
    this.nilaiLiquidasiBangunan,
    this.nilaiPasar,
    this.nilaiLiquidasi,
    this.nilaiPengikatan,
    this.pengikatan,
    this.lokasi,
    this.titikKoordinat,
    this.deskripsiPanjang,
    this.agunanId,
  });

  int? id;
  String? deskripsiPendek;
  String? namaPemilik;
  String? buktiKepemilikan;
  int? luasTanah;
  DateTime? tanggal;
  String? nilaiPasarTanah;
  String? nilaiLiquidasiTanah;
  String? nilaiPasarBangunan;
  String? nilaiLiquidasiBangunan;
  String? nilaiPasar;
  String? nilaiLiquidasi;
  String? nilaiPengikatan;
  String? pengikatan;
  String? lokasi;
  String? titikKoordinat;
  String? deskripsiPanjang;
  int? agunanId;

  factory FormTanahBangunan.fromJson(Map<String, dynamic> json) =>
      FormTanahBangunan(
        id: json["id"],
        deskripsiPendek: json["deskripsi_pendek"],
        namaPemilik: json["nama_pemilik"],
        buktiKepemilikan: json["bukti_kepemilikan"],
        luasTanah: json["luas_tanah"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        nilaiPasarTanah: json["nilai_pasar_tanah"] ?? null,
        nilaiLiquidasiTanah: json["nilai_liquidasi_tanah"] ?? null,
        nilaiPasarBangunan: json["nilai_pasar_bangunan"] ?? null,
        nilaiLiquidasiBangunan: json["nilai_liquidasi_bangunan"] ?? null,
        nilaiPasar: json["nilai_pasar"],
        nilaiLiquidasi: json["nilai_liquidasi"],
        nilaiPengikatan: json["nilai_pengikatan"],
        pengikatan: json["pengikatan"],
        lokasi: json["lokasi"],
        titikKoordinat: json["titik_koordinat"],
        deskripsiPanjang: json["deskripsi_panjang"],
        agunanId: json["agunanId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deskripsi_pendek": deskripsiPendek,
        "nama_pemilik": namaPemilik,
        "bukti_kepemilikan": buktiKepemilikan,
        "luas_tanah": luasTanah,
        "tanggal": tanggal == null
            ? null
            : "${tanggal?.year.toString().padLeft(4, '0')}-${tanggal?.month.toString().padLeft(2, '0')}-${tanggal?.day.toString().padLeft(2, '0')}",
        "nilai_pasar_tanah": nilaiPasarTanah ?? null,
        "nilai_liquidasi_tanah": nilaiLiquidasiTanah ?? null,
        "nilai_pasar_bangunan": nilaiPasarBangunan ?? null,
        "nilai_liquidasi_bangunan": nilaiLiquidasiBangunan ?? null,
        "nilai_pasar": nilaiPasar,
        "nilai_liquidasi": nilaiLiquidasi,
        "nilai_pengikatan": nilaiPengikatan,
        "pengikatan": pengikatan,
        "lokasi": lokasi,
        "titik_koordinat": titikKoordinat,
        "deskripsi_panjang": deskripsiPanjang,
        "agunanId": agunanId,
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

class AnalisaJenisUsaha {
  AnalisaJenisUsaha({
    this.id,
    this.totalCrrUsaha,
  });

  int? id;
  int? totalCrrUsaha;

  factory AnalisaJenisUsaha.fromJson(Map<String, dynamic> json) =>
      AnalisaJenisUsaha(
        id: json["id"],
        totalCrrUsaha: json["total_crr_usaha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_crr_usaha": totalCrrUsaha,
      };
}

class AnalisaKarakter {
  AnalisaKarakter({
    this.id,
    this.nilaiUmur,
    this.scoreUmur,
    this.crrUmur,
    this.scorePendidikan,
    this.crrPendidikan,
    this.nilaiLamanyaBerusaha,
    this.scoreLamanyaBerusaha,
    this.crrLamanyaBerusaha,
    this.scoreUlet,
    this.keteranganUlet,
    this.crrUlet,
    this.scoreKaku,
    this.keteranganKaku,
    this.crrKaku,
    this.scoreKreatif,
    this.keteranganKreatif,
    this.crrKreatif,
    this.scoreKejujuran,
    this.keteranganKejujuran,
    this.crrKejujuran,
    this.deskripsiKarakter,
    this.totalCrrKarakter,
  });

  int? id;
  int? nilaiUmur;
  String? scoreUmur;
  String? crrUmur;
  String? scorePendidikan;
  String? crrPendidikan;
  int? nilaiLamanyaBerusaha;
  String? scoreLamanyaBerusaha;
  String? crrLamanyaBerusaha;
  String? scoreUlet;
  String? keteranganUlet;
  String? crrUlet;
  String? scoreKaku;
  String? keteranganKaku;
  String? crrKaku;
  String? scoreKreatif;
  String? keteranganKreatif;
  String? crrKreatif;
  String? scoreKejujuran;
  String? keteranganKejujuran;
  String? crrKejujuran;
  String? deskripsiKarakter;
  String? totalCrrKarakter;

  factory AnalisaKarakter.fromJson(Map<String, dynamic> json) =>
      AnalisaKarakter(
        id: json["id"],
        nilaiUmur: json["nilai_umur"],
        scoreUmur: json["score_umur"],
        crrUmur: json["crr_umur"],
        scorePendidikan: json["score_pendidikan"],
        crrPendidikan: json["crr_pendidikan"],
        nilaiLamanyaBerusaha: json["nilai_lamanya_berusaha"],
        scoreLamanyaBerusaha: json["score_lamanya_berusaha"],
        crrLamanyaBerusaha: json["crr_lamanya_berusaha"],
        scoreUlet: json["score_ulet"],
        keteranganUlet: json["keterangan_ulet"],
        crrUlet: json["crr_ulet"],
        scoreKaku: json["score_kaku"],
        keteranganKaku: json["keterangan_kaku"],
        crrKaku: json["crr_kaku"],
        scoreKreatif: json["score_kreatif"],
        keteranganKreatif: json["keterangan_kreatif"],
        crrKreatif: json["crr_kreatif"],
        scoreKejujuran: json["score_kejujuran"],
        keteranganKejujuran: json["keterangan_kejujuran"],
        crrKejujuran: json["crr_kejujuran"],
        deskripsiKarakter: json["deskripsi_karakter"],
        totalCrrKarakter: json["total_crr_karakter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nilai_umur": nilaiUmur,
        "score_umur": scoreUmur,
        "crr_umur": crrUmur,
        "score_pendidikan": scorePendidikan,
        "crr_pendidikan": crrPendidikan,
        "nilai_lamanya_berusaha": nilaiLamanyaBerusaha,
        "score_lamanya_berusaha": scoreLamanyaBerusaha,
        "crr_lamanya_berusaha": crrLamanyaBerusaha,
        "score_ulet": scoreUlet,
        "keterangan_ulet": keteranganUlet,
        "crr_ulet": crrUlet,
        "score_kaku": scoreKaku,
        "keterangan_kaku": keteranganKaku,
        "crr_kaku": crrKaku,
        "score_kreatif": scoreKreatif,
        "keterangan_kreatif": keteranganKreatif,
        "crr_kreatif": crrKreatif,
        "score_kejujuran": scoreKejujuran,
        "keterangan_kejujuran": keteranganKejujuran,
        "crr_kejujuran": crrKejujuran,
        "deskripsi_karakter": deskripsiKarakter,
        "total_crr_karakter": totalCrrKarakter,
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
        totalCrrKeuangan: json["total_crr_keuangan"] == null
            ? null
            : json["total_crr_keuangan"].toDouble(),
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
