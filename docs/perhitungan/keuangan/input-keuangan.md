## Input Keuangan

Tabel di bawah ini merupakan simulasi kredit yang diinputkan ke aplikasi ini.

[keterangan neraca](https://docs.google.com/spreadsheets/d/1SJs6FhtwjygQY_OIjjo-tRZtBQUbkdVNeFdSOsIuieM/edit?usp=sharing ':include :type=iframe width=100% height=800px')

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