import 'dart:convert';

// To parse this JSON data, do
//
//     final debitur = debiturFromJson(jsonString);

// ignore_for_file: file_names

List<Debitur> debiturFromJson(String str) =>
    List<Debitur>.from(json.decode(str).map((x) => Debitur.fromJson(x)));

String debiturToJson(List<Debitur> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Debitur {
  Debitur({
    required this.id,
    required this.noDebitur,
    required this.nik,
    required this.namaDebitur,
    required this.alamat,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.pekerjaan,
    required this.instansi,
    required this.agama,
    required this.gender,
    required this.noTelp,
    required this.noSeluler,
    required this.email,
    required this.namaIbu,
    required this.relationship,
    required this.namaPasangan,
    required this.pekerjaanPasangan,
    required this.tglLahirPasangan,
    required this.tempatLahirPasangan,
    required this.nikPasangan,
    required this.totalIncome,
    required this.bidangUsaha,
    required this.jumlahTanggungan,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
    required this.kelurahan,
    required this.rt,
    required this.rw,
    required this.kodePos,
    required this.nonfixed,
    required this.fixed,
  });

  int id;
  String noDebitur;
  String nik;
  String namaDebitur;
  String alamat;
  String tempatLahir;
  DateTime tanggalLahir;
  String pekerjaan;
  String instansi;
  String agama;
  String gender;
  String noTelp;
  String noSeluler;
  String email;
  String namaIbu;
  String relationship;
  String? namaPasangan;
  String? pekerjaanPasangan;
  DateTime? tglLahirPasangan;
  String? tempatLahirPasangan;
  int? nikPasangan;
  String totalIncome;
  String bidangUsaha;
  int jumlahTanggungan;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String kelurahan;
  int rt;
  int rw;
  int kodePos;
  List<Nonfixed> nonfixed;
  List<Fixed> fixed;

  factory Debitur.fromJson(Map<String, dynamic> json) => Debitur(
        id: json["id"],
        noDebitur: json["no_debitur"],
        nik: json["nik"],
        namaDebitur: json["nama_debitur"],
        alamat: json["alamat"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        pekerjaan: json["pekerjaan"],
        instansi: json["instansi"],
        agama: json["agama"],
        gender: json["gender"],
        noTelp: json["no_telp"],
        noSeluler: json["no_seluler"],
        email: json["email"],
        namaIbu: json["nama_ibu"],
        relationship: json["relationship"],
        namaPasangan: json["nama_pasangan"],
        pekerjaanPasangan: json["pekerjaan_pasangan"],
        tglLahirPasangan: DateTime.parse(json["tgl_lahir_pasangan"]),
        tempatLahirPasangan: json["tempat_lahir_pasangan"],
        nikPasangan: json["nik_pasangan"],
        totalIncome: json["total_income"],
        bidangUsaha: json["bidang_usaha"],
        jumlahTanggungan: json["jumlah_tanggungan"],
        provinsi: json["provinsi"],
        kabupaten: json["kabupaten"],
        kecamatan: json["kecamatan"],
        kelurahan: json["kelurahan"],
        rt: json["rt"],
        rw: json["rw"],
        kodePos: json["kode_pos"],
        nonfixed: List<Nonfixed>.from(
            json["nonfixed"].map((x) => Nonfixed.fromJson(x))),
        fixed: List<Fixed>.from(json["fixed"].map((x) => Fixed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_debitur": noDebitur,
        "nik": nik,
        "nama_debitur": namaDebitur,
        "alamat": alamat,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "pekerjaan": pekerjaan,
        "instansi": instansi,
        "agama": agama,
        "gender": gender,
        "no_telp": noTelp,
        "no_seluler": noSeluler,
        "email": email,
        "nama_ibu": namaIbu,
        "relationship": relationship,
        "nama_pasangan": namaPasangan,
        "pekerjaan_pasangan": pekerjaanPasangan,
        "tgl_lahir_pasangan":
            "${tglLahirPasangan?.year.toString().padLeft(4, '0')}-${tglLahirPasangan!.month.toString().padLeft(2, '0')}-${tglLahirPasangan?.day.toString().padLeft(2, '0')}",
        "tempat_lahir_pasangan": tempatLahirPasangan,
        "nik_pasangan": nikPasangan,
        "total_income": totalIncome,
        "bidang_usaha": bidangUsaha,
        "jumlah_tanggungan": jumlahTanggungan,
        "provinsi": provinsi,
        "kabupaten": kabupaten,
        "kecamatan": kecamatan,
        "kelurahan": kelurahan,
        "rt": rt,
        "rw": rw,
        "kode_pos": kodePos,
        "nonfixed": List<dynamic>.from(nonfixed.map((x) => x.toJson())),
        "fixed": List<dynamic>.from(fixed.map((x) => x.toJson())),
      };
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.username,
  });

  int id;
  String username;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}

class Fixed {
  Fixed({
    required this.id,
    required this.jenisPengajuan,
    required this.plafonFasilitas,
    required this.jenisPenggunaan,
    required this.tujuanPenggunaan,
    required this.jangkaWaktu,
    required this.penghasilanPemohon,
    required this.potonganGaji,
    required this.sisaPenghasilan,
    required this.namaPejabatPenanggungJawab,
    required this.jabatanPejabatPenanggungJawab,
    required this.namaPejabatPemotongGaji,
    required this.jabatanPejabatPemotongGaji,
    required this.noRekening,
    required this.plafonKredit,
    required this.tanggalMulaiKredit,
    required this.jangkaWaktuKredit,
    required this.isApproved,
  });

  int id;
  String jenisPengajuan;
  String plafonFasilitas;
  String jenisPenggunaan;
  String tujuanPenggunaan;
  String jangkaWaktu;
  String penghasilanPemohon;
  String potonganGaji;
  String sisaPenghasilan;
  String namaPejabatPenanggungJawab;
  String jabatanPejabatPenanggungJawab;
  String namaPejabatPemotongGaji;
  String jabatanPejabatPemotongGaji;
  String noRekening;
  String plafonKredit;
  DateTime tanggalMulaiKredit;
  String jangkaWaktuKredit;
  bool isApproved;

  factory Fixed.fromJson(Map<String, dynamic> json) => Fixed(
        id: json["id"],
        jenisPengajuan: json["jenis_pengajuan"],
        plafonFasilitas: json["plafon_fasilitas"],
        jenisPenggunaan: json["jenis_penggunaan"],
        tujuanPenggunaan: json["tujuan_penggunaan"],
        jangkaWaktu: json["jangka_waktu"],
        penghasilanPemohon: json["penghasilan_pemohon"],
        potonganGaji: json["potongan_gaji"],
        sisaPenghasilan: json["sisa_penghasilan"],
        namaPejabatPenanggungJawab: json["nama_pejabat_penanggung_jawab"],
        jabatanPejabatPenanggungJawab: json["jabatan_pejabat_penanggung_jawab"],
        namaPejabatPemotongGaji: json["nama_pejabat_pemotong_gaji"],
        jabatanPejabatPemotongGaji: json["jabatan_pejabat_pemotong_gaji"],
        noRekening: json["no_rekening"],
        plafonKredit: json["plafon_kredit"],
        tanggalMulaiKredit: DateTime.parse(json["tanggal_mulai_kredit"]),
        jangkaWaktuKredit: json["jangka_waktu_kredit"],
        isApproved: json["is_approved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_pengajuan": jenisPengajuan,
        "plafon_fasilitas": plafonFasilitas,
        "jenis_penggunaan": jenisPenggunaan,
        "tujuan_penggunaan": tujuanPenggunaan,
        "jangka_waktu": jangkaWaktu,
        "penghasilan_pemohon": penghasilanPemohon,
        "potongan_gaji": potonganGaji,
        "sisa_penghasilan": sisaPenghasilan,
        "nama_pejabat_penanggung_jawab": namaPejabatPenanggungJawab,
        "jabatan_pejabat_penanggung_jawab": jabatanPejabatPenanggungJawab,
        "nama_pejabat_pemotong_gaji": namaPejabatPemotongGaji,
        "jabatan_pejabat_pemotong_gaji": jabatanPejabatPemotongGaji,
        "no_rekening": noRekening,
        "plafon_kredit": plafonKredit,
        "tanggal_mulai_kredit":
            "${tanggalMulaiKredit.year.toString().padLeft(4, '0')}-${tanggalMulaiKredit.month.toString().padLeft(2, '0')}-${tanggalMulaiKredit.day.toString().padLeft(2, '0')}",
        "jangka_waktu_kredit": jangkaWaktuKredit,
        "is_approved": isApproved,
      };
}

class Nonfixed {
  Nonfixed({
    required this.id,
    required this.jenisPengajuan,
    required this.plafonFasilitas,
    required this.jenisPenggunaan,
    required this.tujuanPenggunaan,
    required this.jangkaWaktu,
    required this.noRekening,
    required this.plafonKredit,
    required this.tanggalMulaiKredit,
    required this.jangkaWaktuKredit,
    required this.isApproved,
  });

  int id;
  String jenisPengajuan;
  String plafonFasilitas;
  String jenisPenggunaan;
  String tujuanPenggunaan;
  String jangkaWaktu;
  String noRekening;
  String plafonKredit;
  DateTime tanggalMulaiKredit;
  String jangkaWaktuKredit;
  bool isApproved;

  factory Nonfixed.fromJson(Map<String, dynamic> json) => Nonfixed(
        id: json["id"],
        jenisPengajuan: json["jenis_pengajuan"],
        plafonFasilitas: json["plafon_fasilitas"],
        jenisPenggunaan: json["jenis_penggunaan"],
        tujuanPenggunaan: json["tujuan_penggunaan"],
        jangkaWaktu: json["jangka_waktu"],
        noRekening: json["no_rekening"],
        plafonKredit: json["plafon_kredit"],
        tanggalMulaiKredit: DateTime.parse(json["tanggal_mulai_kredit"]),
        jangkaWaktuKredit: json["jangka_waktu_kredit"],
        isApproved: json["is_approved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_pengajuan": jenisPengajuan,
        "plafon_fasilitas": plafonFasilitas,
        "jenis_penggunaan": jenisPenggunaan,
        "tujuan_penggunaan": tujuanPenggunaan,
        "jangka_waktu": jangkaWaktu,
        "no_rekening": noRekening,
        "plafon_kredit": plafonKredit,
        "tanggal_mulai_kredit":
            "${tanggalMulaiKredit.year.toString().padLeft(4, '0')}-${tanggalMulaiKredit.month.toString().padLeft(2, '0')}-${tanggalMulaiKredit.day.toString().padLeft(2, '0')}",
        "jangka_waktu_kredit": jangkaWaktuKredit,
        "is_approved": isApproved,
      };
}
