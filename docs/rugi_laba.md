?> Untuk melihat perhitungan Rugi Laba lebih detail lihat `disini`

## Sekilas Rugi Laba

Laporan laba rugi merupakan laporan yang menyajikan informasi pengeluaran, pendapatan, serta laba atau rugi yang dihasilkan perusahaan selama periode tertentu. Melalui laporan laba rugi ini, bisa memperlihatkan kinerja keuangan dari suatu usaha atau perusahaan.

## Cara Penggunaan

!> Untuk Membuka menu Rugi Laba, terlebih dulu input [Neraca](neraca.md)

!> Tabel Rugi Laba bisa digeser ke kanan dan ke kiri untuk melihat data yang tidak terlihat

Untuk memulai penginputan Rugi Laba Debitur, Pilih Menu `Rugi Laba`, kemudian buka dropdown nya sampai muncul tombol input 

![image](https://user-images.githubusercontent.com/45744788/199829692-1083dc7c-33c5-41fd-8429-dc2baa65afc8.png)

Disitu juga akan tertera keterangan sudah input nya atau belom, Jika sudah maka menu akan berubah menjadi `lihat` dan `edit`.
Serta indikator diatas akan berubah menjadi hijau dan progress bar akan bertambah sebanyak 10%.

![image](https://user-images.githubusercontent.com/45744788/199679832-23a70373-c5d0-4564-8081-7a66134af793.png)

## Input Rugi Laba

Setelah menu `Rugi Laba` di klik, maka akan muncul halaman input Rugi Laba seperti dibawah ini : 

![image](https://user-images.githubusercontent.com/45744788/199829933-2bd0be1c-9746-49ba-ba7f-c0a5eaa49569.png)

Berikut field yang harus diinputkan untuk melengkapi Data Neraca debitur :

### Perkiraan Neraca

?> Kebanyakan data neraca sudah terisi otomatis, namun jika ada yang belum terisi maka bisa diisi manual.

#### Aktiva

##### Aktiva Lancar
- `Kas` : Terisi otomatis dari data Neraca
- `Tabungan` : Terisi otomatis dari data Neraca
- `Piutang Usaha` : Terisi otomatis dari data Neraca
- `Persediaan` : Terisi otomatis dari data Neraca
- `Jumlah Aktiva Lancar` : Terisi otomatis dari perhitungan data Aktiva Lancar

##### Aktiva Tetap

- `Peralatan dan Mesin`: Terisi otomatis dari data Neraca
- `Kendaraan` : Terisi otomatis dari data Neraca
- `Tanah dan Bangunan` : Terisi otomatis dari data Neraca
- `Jumlah Aktiva Tetap` : Terisi otomatis dari perhitungan data Aktiva Tetap

Untuk `Jumlah Aktiva` akan terisi otomatis dari perhitungan data Aktiva Lancar dan Aktiva Tetap

#### Pasiva

##### Hutang
- `Hutang Usaha` : Terisi otomatis dari data Neraca
- `Hutang Bank` : Terisi otomatis dari data Neraca
- `Hutang Lainnya` : Bisa diisi secara manual, hutang lainnya meliputi Hutang dari Bank Lain.
- `Jumlah Hutang` : Terisi otomatis dari perhitungan data Hutang

##### Modal
- `Modal` : Terisi otomatis dari Jumlah Aktiva 
- `Jumlah Modal` : Terisi otomatis dari perhitungan data Modal

Untuk `Jumlah Pasiva` akan terisi otomatis dari perhitungan data Hutang dan Modal

Jika semuanya sudah di cek lalu klik tombol `Hitung` / `Perkiraan Neraca` maka hasil otomatis akan terhitung

![image](https://user-images.githubusercontent.com/45744788/199869334-ca77103c-916d-4c84-8fd2-640877170129.png)


Untuk perhitungan perkiraan neraca sudah selesai sampai disini 🎉

### Perkiraan Laba Rugi

?> Disini banyak yang diisi jadi perhatikan ya adick adick 😁

#### Perkiraan Penjualan

- `Omzet Penjualan` : Bisa diisi secara manual, berisi omzet penjualan dari usaha debitur selama periode yang diinputkan
- `Persetase Harga Pokok Penjualan` : Bisa diisi secara manual, berisi persentase harga pokok penjualan dari omzet penjualan, diisi dalam persen (0-100)
- `Harga Pokok Penjualan` : Terisi otomatis dari perhitungan data Omzet Penjualan dan Persentase Harga Pokok Penjualan
- `Laba Kotor` : Terisi otomatis dari perhitungan data Omzet Penjualan dan Harga Pokok Penjualan

Jika kedua field (`omzet` & `persentase`) diatas sudah diisi gunakan tombol `hitung` untuk mendapatkan hasil.

#### Perkiraan Biaya

!> Untuk melihat rumus rumus hitungannya bisa lihat `disini`

- `Biaya Tenaga Kerja` : Bisa diisi secara manual, berisi biaya tenaga kerja (gaji karyawan) dari usaha debitur selama periode yang diinputkan.
- `Biaya Operasionals` : Bisa diisi secara manual, berisi biaya operasional dari usaha debitur selama periode yang diinputkan.
- `Biaya Lainnya` : Bisa diisi secara manual, berisi biaya lainnya dari usaha debitur selama periode yang diinputkan.
- `Total Biaya` : Terisi otomatis dari perhitungan data Biaya Tenaga Kerja, Biaya Operasionals, dan Biaya Lainnya
- `Laba sebelum pajak` : Terisi otomatis dari perhitungan data Laba Kotor dan Total Biaya
- `Perkiraan Pajak` : Terisi otomatis dari perhitungan data Laba Sebelum Pajak
- `Laba setelah Pajak` : Terisi otomatis dari perhitungan data Laba Sebelum Pajak dan Perkiraan Pajak

Jika semua field diatas sudah diisi gunakan tombol `hitung` untuk mendapatkan hasil.