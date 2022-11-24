## Pendahuluan

Pada section ini merupakan referensi kumpulan perhitungan yang dilakukan oleh aplikasi ini.

<!-- tabs:start -->

#### **Keterangan Neraca**

## Keterangan Neraca

```link-preview
https://docs.google.com/spreadsheets/d/1GVi1LWD_Agzt1jity-GR054ZJ96Z-wJYgSQC2RztsY0/edit#gid=67255475
```


Pada Keterangan Neraca bisa dilihat hitungannya hanya hanya penjumlahan simpel saja.


#### **Laporan Keuangan**

## Laporan Keuangan 

<!-- [keterangan neraca](https://docs.google.com/spreadsheets/d/1GVi1LWD_Agzt1jity-GR054ZJ96Z-wJYgSQC2RztsY0/edit#gid=1312808746 ':include :type=iframe width=100% height=800px') -->

### Hitung Perkiraan Neraca

Pada section ini valuenya diambil dari Keterangan Neraca yang sudah diinputkan sebelumnya

#### Hitung Jumlah Aktiva Lancar

$$
\begin{align}
Jumlah Aktiva Lancar &= Kas + Bank + Piutang Dagang + Persediaan \\
&= 1000000 + 1000000 + 1000000 + 1000000  \\
&= 4000000
\end{align}
$$

#### Hitung Jumlah Aktiva Tetap

$$
\begin{align}
Jumlah Aktiva Tetap &= Tanah dan Bangunan + Kendaraan + Mesin  \\
&= 1000000 + 1000000 + 1000000   \\
&= 3000000
\end{align}
$$

#### Hitung Jumlah Aktiva

$$
\begin{align}
Jumlah Aktiva &= Jumlah Aktiva Lancar + Jumlah Aktiva Tetap \\
&= 4000000 + 3000000 \\
&= 7000000
\end{align}
$$

#### Hitung Jumlah Hutang

$$
\begin{align}
Jumlah Hutang &= Hutang Dagang + Hutang Bank + Hutang Lainnya \\
&= 1000000 + 1000000 + 1000000 \\
&= 3000000
\end{align}
$$

#### Hitung Modal

$$
\begin{align}
Modal &= Jumlah Aktiva - Jumlah Hutang \\
&= 7000000 - 3000000 \\
&= 4000000
\end{align}
$$


#### Hitung Jumlah Modal
$$
\begin{align}
Jumlah Modal &= Modal
\end{align}
$$


#### Hitung Jumlah Pasiva
$$
\begin{align}
Jumlah Pasiva &= Jumlah Hutang + Jumlah Modal \\
&= 3000000 + 4000000 \\
&= 7000000
\end{align}
$$


### Hitung Perkiraaan Laba Rugi

#### Hitung Harga Pokok Penjualan

##### Hitung HPP
$$
\begin{align}
Harga Pokok Penjualan &= Omzet * Persentase Harga Pokok Penjualan \\
&= 10000000 * 0.5 \\
&= 5000000
\end{align}
$$

##### Hitung Laba Kotor
$$
\begin{align}
Laba Kotor &= Omzet - Harga Pokok Penjualan \\
&= 10000000 - 5000000 \\
&= 5000000
\end{align}
$$

#### Hitung Perkiraan Biaya

##### Hitung Total Biaya
$$
\begin{align}
Total Biaya &= Biaya Tenaga Kerja + Biaya Operasional + Biaya Lainnya \\
&= 1000000 + 1000000 + 1000000 \\
&= 3000000
\end{align}
$$

##### Hitung Laba Sebelum Pajak (EBIT)
$$
\begin{align}
Laba Sebelum Pajak &= Laba Kotor - Total Biaya \\
&= 5000000 - 3000000 \\
&= 2000000
\end{align}
$$

##### Hitung Perkiraan Pajak 
$$
\begin{align}
Perkiraan Pajak &= 0.05 * Laba Sebelum Pajak \\
&= 0.05 * 2000000 \\
&= 100000
\end{align}
$$

##### Hitung Laba Setelah Pajak (EAT)
$$
\begin{align}
Laba Setelah Pajak &= Laba Sebelum Pajak - Perkiraan Pajak \\
&= 2000000 - 100000 \\
&= 1900000
\end{align}
$$

#### Perkiraan Penghasilan Bersih

##### Hitung Perkiraan Penghasilan Bersih
$$
\begin{align}
Perkiraan Rata Rata Per Bulan &= Laba Setelah Pajak \\
&= 1900000
\end{align}
$$

##### Hitung Sisa Penghasilan
$$
\begin{align}
Sisa Penghasilan &= Perkiraan Penghasilan Bersih - Biaya Hidup \\
&= 1900000 - 1000000 \\
&= 900000
\end{align}
$$


#### **Input Keuangan**
## Input Keuangan

Tabel di bawah ini merupakan simulasi kredit yang diinputkan ke aplikasi ini.

<!-- [keterangan neraca](https://docs.google.com/spreadsheets/d/1SJs6FhtwjygQY_OIjjo-tRZtBQUbkdVNeFdSOsIuieM/edit?usp=sharing ':include :type=iframe width=100% height=800px') -->

### Hitung Angsuran

```dart
    final parseBungaPerTahun = double.parse(bungaPerTahun.text);
    final parseBungaPerTahunAsDecimal = parseBungaPerTahun / 100;
    final parseAngsuranPerBulanKredit = int.parse(angsuranPerBulan.text);
    final parseKreditYangDiminta =
        double.parse(kreditYangDiusulkan.text.replaceAll('.', ''));

    final hitungAwal = Finance.pmt(
          rate: parseBungaPerTahunAsDecimal / 12,
          nper: parseAngsuranPerBulanKredit,
          pv: parseKreditYangDiminta,
        ) *
        -1 %
        5;

    final hitungKedua = Finance.pmt(
          rate: parseBungaPerTahunAsDecimal / 12,
          nper: parseAngsuranPerBulanKredit,
          pv: parseKreditYangDiminta,
        ) *
        -1;

    final ifBenar = hitungKedua - hitungAwal + 5;
    final ifSalah = hitungKedua - hitungAwal;

    if (hitungAwal > 2) {
      totalAngsuran.text = ifBenar.toStringAsFixed(0);
    } else {
      totalAngsuran.text = ifSalah.toStringAsFixed(0);
    }
```

Rumus diatas menggunakan rumus PMT (Present Value of an Annuity) untuk menghitung angsuran per bulan. Rumus ini diambil dari [sini](https://www.investopedia.com/terms/p/pmt.asp). 

### Hitung Asumsi

#### Asumsi Penjualan Yad
$$
\begin{align}
Asumsi Penjualan Yad &= Jumlah Penjualan Kini * 1.15 \\
&= 10000000 * 1.15 \\
&= 11500000
\end{align}
$$

#### Asumsi HPP Yad
$$
\begin{align}
Asumsi HPP Yad &= HPP Kini * 1.15 \\
&= 5000000 * 1.15 \\
&= 5750000
\end{align}
$$

#### Asumsi Upah Yad
$$
\begin{align}
Asumsi Upah Yad &= Upah Kini * 1.15 \\
&= 1000000 * 1.15 \\
&= 1150000
\end{align}
$$

#### Asumsi Operasional Yad
$$
\begin{align}
Asumsi Operasional Yad &= Operasional Kini * 1.15 \\
&= 1000000 * 1.15 \\
&= 1150000
\end{align}
$$

#### Asumsi Biaya Hidup Yad
$$
\begin{align}
Asumsi Biaya Hidup Yad &= Biaya Hidup Kini * 1 \\
&= 1000000 * 1 \\
&= 1000000
\end{align}
$$

#### **Analisa Keuangan**

## Analisa Keuangan
<!-- [keterangan neraca](https://docs.google.com/spreadsheets/d/1GVi1LWD_Agzt1jity-GR054ZJ96Z-wJYgSQC2RztsY0/edit#gid=131998037 ':include :type=iframe width=100% height=800px') -->

### Hitung Data Keuangan 

#### Hitung Jumlah Aset
$$
\begin{align}
Jumlah Aset &= Jumlah Aktiva - Tanah dan Bangunan \\
&= 10000000 - 5000000 \\
&= 5000000
\end{align}
$$

#### Hitung Jumlah Aset Keseluruhan
$$
\begin{align}
Jumlah Aset Keseluruhan &= Jumlah Aset + Kredit Yang Diusulkan \\
&= 5000000 + 10000000 \\
&= 15000000
\end{align}
$$


### Hitung Angsuran 
$$
\begin{align}
Total Angsuran &= Angsuran \\
&= 1000000
\end{align}
$$

### Hitung Asumsi Keuangan 

#### Persentase Biaya Bahan Kini
$$
\begin{align}
Persentase Biaya Bahan Kini &= HPP Kini / Jumlah Penjualan Kini \\
&= 5000000 / 10000000 \\
&= 0.5
\end{align}
$$

#### Persentase Biaya Bahan Yad
$$
\begin{align}
Persentase Biaya Bahan Yad &= HPP Yad / Jumlah Penjualan Yad \\
&= 5750000 / 11500000 \\
&= 0.5
\end{align}
$$

#### Persentase Biaya Upah Kini
$$
\begin{align}
Persentase Biaya Upah Kini &= Upah Kini / Jumlah Penjualan Kini \\
&= 1000000 / 10000000 \\
&= 0.1
\end{align}
$$

#### Persentase Biaya Upah Yad
$$
\begin{align}
Persentase Biaya Upah Yad &= Upah Yad / Jumlah Penjualan Yad \\
&= 1150000 / 11500000 \\
&= 0.1
\end{align}
$$

#### Persentase Biaya Operasional Kini
$$
\begin{align}
Persentase Biaya Operasional Kini &= Operasional Kini / Jumlah Penjualan Kini \\
&= 1000000 / 10000000 \\
&= 0.1
\end{align}
$$

#### Persentase Biaya Operasional Yad
$$ 
\begin{align}
Persentase Biaya Operasional Yad &= Operasional Yad / Jumlah Penjualan Yad \\
&= 1150000 / 11500000 \\
&= 0.1
\end{align}
$$

#### Persentase Biaya Hidup Kini
$$
\begin{align}
Persentase Biaya Hidup Kini &= Biaya Hidup Kini / Jumlah Penjualan Kini \\
&= 1000000 / 10000000 \\
&= 0.1
\end{align}
$$

#### Persentase Biaya Hidup Yad
$$
\begin{align}
Persentase Biaya Hidup Yad &= Biaya Hidup Yad / Jumlah Penjualan Yad \\
&= 1000000 / 10000000 \\
&= 0.1
\end{align}
$$

#### Hitung Laba Kini
$$
\begin{align}
Laba Kini &= Jumlah Penjualan Kini - Biaya Bahan Kini - Biaya Upah Kini - Biaya Operasional Kini - Biaya Hidup Kini  \\
&= 10000000 - 5000000 - 1000000 - 1000000 - 1000000 \\
&= 2000000
\end{align}
$$

#### Hitung Laba Yad
$$
\begin{align}
Laba Yad &= Jumlah Penjualan Yad - Biaya Bahan Yad - Biaya Upah Yad - Biaya Operasional Yad - Biaya Hidup Yad  \\
&= 11500000 - 5750000 - 1150000 - 1150000 - 1000000 \\
&= 2000000
\end{align}
$$

#### Persentase Laba Kini
$$
\begin{align}
Persentase Laba Kini &= Laba Kini / Jumlah Penjualan Kini \\
&= 2000000 / 10000000 \\
&= 0.2
\end{align}
$$

#### Persentase Laba Yad
$$
\begin{align}
Persentase Laba Yad &= Laba Yad / Jumlah Penjualan Yad \\
&= 2000000 / 11500000 \\
&= 0.2
\end{align}
$$

### Analisa Ratio

#### Hitung Ratio Profit Kini
$$
\begin{align}
Ratio Profit &= Laba Usaha Kini /  Jumlah Penjualan Kini * 100  \\
&= 2000000 /  10000000 * 100  \\
&= 20
\end{align}
$$

#### Hitung Ratio Profit Yad
$$
\begin{align}
Ratio Profit &= Laba Usaha Yad /  Jumlah Penjualan Yad * 100  \\
&= 2000000 /  11500000 * 100  \\
&= 17.39
\end{align}
$$

#### Hitung Roe Kini
$$
\begin{align}
Persentase Modal &= Jumlah Modal / 100 \\
&= 10000000 / 100 \\
&= 100000 
\newline
\newline
% Line break
Hitung Pertama &= Laba Usaha Kini - Angsuran  \\
&= 2000000 - 1000000 \\
&= 1000000
\newline
\newline
Hitung Kedua &= Hitung Pertama / Persentase Modal \\
&= 1000000 / 100000 \\
&= 10
\newline
\newline
Hasil &= Hitung Kedua * 24 \\
&= 10 * 24 \\
&= 240
\end{align}
$$

#### Hitung Roe Yad
$$
\begin{align}
Persentase Modal &= Jumlah Modal / 100 \\
&= 10000000 / 100 \\
&= 100000
\newline
\newline
Hitung Pertama &= Laba Usaha Yad - Angsuran  \\
&= 2000000 - 1000000 \\
&= 1000000
\newline
\newline
Hitung Kedua &= Hitung Pertama / Persentase Modal \\
&= 1000000 / 100000 \\
&= 10
\newline
\newline
Hasil &= Hitung Kedua * 24 \\
&= 10 * 24 \\
&= 240
\end{align}
$$

#### Keterangan Roe
$$
\begin{align}
if \; Roe Yad \; > 10 \; then \; Hasil \; &= \; Baik \\
else \; Hasil \; &= \; Jelek \\
&= 240 > 10 \\
&= Baik
\end{align}
$$

#### Hitung Roa Kini
$$
\begin{align}
Persentase Jumlah Aset Keseluruhan &= Jumlah Aset Keseluruhan / 100 \\
&= 15000000 / 100 \\
&= 150000
\newline
\newline
Hitung Pertama &= Laba Usaha Kini - Angsuran Bank Lain  \\
&= 2000000 - 0 \\
&= 2000000
\newline
\newline
Hitung Kedua &= Hitung Pertama / Persentase Jumlah Aset Keseluruhan \\
&= 2000000 / 150000 \\
&= 13.33
\newline
\newline
Hasil &= Hitung Kedua * 12 \\
&= 13.33 * 12 \\
&= 159.96
\end{align}
$$

#### Hitung Roa Yad
$$
\begin{align}
Persentase Jumlah Aset Keseluruhan &= Jumlah Aset Keseluruhan / 100 \\
&= 15000000 / 100 \\
&= 150000
\newline
\newline
Hitung Pertama &= Laba Usaha Yad - Angsuran Bank BPD DIY  \\
&= 2000000 - 1000000 \\
&= 1000000
\newline
\newline
Hitung Kedua &= Hitung Pertama / Persentase Jumlah Aset Keseluruhan \\
&= 1000000 / 150000 \\
&= 6.67
\newline
\newline
Hasil &= Hitung Kedua * 12 \\
&= 6.67 * 24 \\
&= 160.0
\end{align}
$$


#### Keterangan Roa
$$
\begin{align}
if \; Roa Yad \; > 8 \; then \; Hasil \; &= \; Baik \\
else \; Hasil \; &= \; Jelek \\
&= 160 > 8 \\
&= Baik
\end{align}
$$


#### Hitung Der Kini
$$
\begin{align}
Persentase Modal &= Jumlah Modal / 100 \\
&= 10000000 / 100 \\
&= 100000
\newline
\newline
Hasil &= Jumlah Hutang / Persentase Modal \\
&= 0 / 100000 \\
&= 0
\end{align}
$$


#### Hitung Der Yad
$$
\begin{align}
Persentase Modal &= Jumlah Modal / 100 \\
&= 10000000 / 100 \\
&= 100000
\newline
\newline
Hitung Pertama &= Jumlah Hutang + Kredit Yang Diusulan (Plafond) \\
&= 0 + 10000000 \\
&= 10000000
\newline
\newline
Hasil &= Hitung Pertama / Persentase Modal \\
&= 10000000 / 100000 \\
&= 100
\end{align}
$$

#### Keterangan Der
$$
\begin{align}
if \; Der Yad \; <= 200 \; then \; Hasil \; &= \; DITERIMA \\
else \; Hasil \; &= \; DITOLAK \\
&= 100 < 200 \\
&= DITERIMA
\end{align}
$$

#### Hitung Dsc Kini
$$
\begin{align}
Hasil &= Laba Usaha Kini / Total Angsuran \\
&= 2000000 / 1000000 \\
&= 2
\end{align}
$$

#### Hitung Dsc Yad
$$
\begin{align}
Hasil &= Laba Usaha Yad / Total Angsuran \\
&= 2000000 / 1000000 \\
&= 2
\end{align}
$$

#### Keterangan Dsc
$$
\begin{align}
if \; Dsc Yad \; >= 1.3 \; then \; Hasil \; &= \; DITERIMA \\
else \; Hasil \; &= \; DITOLAK \\
&= 2 >= 1.3 \\
&= DITERIMA
\end{align}
$$

### Summary

#### Hitung Pinjaman Maksimal
$$
\begin{align}
Pinjaman Maksimal &= Laba Yad / 1.3 * Jangka Waktu * 0.80 \\
&= 2000000 / 1.3 * 24 * 0.80 \\
&= 1538461.54
\end{align}
$$

#### Perhitungan Investasi / Modal Kerja

##### Hitung Biaya Per Bulan
$$
\begin{align}
Biaya Per Bulan &= Biaya Hpp Yad + Biaya Upah Yad + Biaya Operasinal Yad + Biaya Hidup Yad \\
&= 1000000 + 1000000 + 1000000 + 1000000 \\
&= 4000000
\end{align}
$$

##### Hitung Kebutuhan Investasi / Modal Kerja
$$
\begin{align}
Kebutuhan Investasi / Modal Kerja &= Biaya Per Bulan * Trade Cycle \\
&= 4000000 * 2 \\
&= 8000000
\end{align}
$$


##### Hitung Kebutuhan Kredit 
$$
\begin{align}
Kebutuhan Kredit &= Kebutuhan Investasi / Modal Kerja * 0.90 \\
&= 8000000 * 0.90 \\
&= 7200000
\end{align}
$$

#### Cek Apakah Kredit Dapat Diterima
$$
\begin{align}
if \; Pinjaman Maksimal \; < Kredit Yang Diusulkan (Plafond) \; then \; Hasil \; &= \; DITERIMA \\
else \; Hasil \; &= \; DITOLAK \\
&= 1538461.54 < 10000000 \\
&= DITERIMA
\end{align}
$$

#### Hitung CRR Keuangan
$$
\begin{align}
DscYad &= Laba Usaha Yad / Total Angsuran \\
&= 2000000 / 1000000 \\
&= 2
\newline
\newline
if \; DscYad \; >= 3.95 \; then \; Hasil \; &= \; 95.0 \\
else if \; Pinjaman Diterima = DITOLAK \; then \; Hasil \; &= \; 0.0 \\
else if \ DscYad < 1.3 \; then \; Hasil \; &= \; 0.0 \\
else \; Hitung Pertama \; &= \; DscYad - 1.3 \\
&= 2 - 1.3 \\
&= 0.7
\newline
\newline
Hitung Kedua &= (3 - 1.3) \\
&= 1.7
\newline
\newline
Hitung Ketiga &= Hitung Pertama / Hitung Kedua \\
&= 0.7 / 1.7 \\
&= 0.4117647058823529
\newline
\newline
Hasil &= Hitung Ketiga * 35 + 60 \\
&= 0.4117647058823529 * 35 + 60 \\
&= 95.0
\end{align}
$$











<!-- tabs:end -->




