?> Untuk melihat perhitungan Keuangan lebih detail lihat `disini`

## Cara Penggunaan

!> Untuk Membuka menu Keuangan, terlebih dulu input [Rugi Laba](rugi_laba.md)

Untuk memulai penginputan Keuangan Debitur, Pilih Menu `Keuangan`, kemudian buka dropdown nya sampai muncul tombol input 

![image](https://user-images.githubusercontent.com/45744788/199882239-f823fd59-a007-42cf-8a01-25fba8887dc6.png)

Disitu juga akan tertera keterangan sudah input nya atau belum, Jika sudah maka menu akan berubah menjadi `lihat` dan `edit`.
Serta indikator diatas akan berubah menjadi hijau dan progress bar akan bertambah sebanyak 10%.

![image](https://user-images.githubusercontent.com/45744788/199902957-e9ad48d7-da89-4d55-8a67-1837d46b1d0b.png)


## Input Keuangan

!> Untuk melihat rumus rumus perhitungan Keuangan lebih detail lihat `disini`

Setelah menu `Keuangan` di klik, maka akan muncul halaman input Keuangan seperti dibawah ini : 

![image](https://user-images.githubusercontent.com/45744788/199882520-db7e400a-fdf6-481c-824e-e939b02bebe8.png)

Berikut field yang harus diinputkan untuk melengkapi Data Keuangan debitur :

### Data Keuangan

!> Section yang paling penting disini, so proceed with caution

- `Kredit Diusulkan / Plafon`: Inputan ini berfungsi untuk menentukan jumlah kredit yang diusulkan oleh debitur.
- `Jangka Waktu`: Inputan ini berfungsi untuk menentukan jangka waktu kredit yang diusulkan oleh debitur.
- `Bunga Kredit`: Dalam persen, self explanatory.
- `Provisi`: 0%.
- `Sistem Angsuran`: Pilih sistem angsuran.
- `Digunakan Untuk`: Pilihan untuk tujuan debitur (Modal Kerja. Investasi).
- `Angsuran`: Terisi otomatis (Untuk detail hitungannya bisa lihat `disini`)

Jika semuanya sudah di cek lalu klik tombol `Hitung Angsuran Tetap` maka hasil otomatis akan terhitung

![image](https://user-images.githubusercontent.com/45744788/199886810-02fd9b44-6a9d-47d5-8780-1789d4c22b85.png)

Untuk melanjutkan ke step selanjutnya silahkan swipe kiri layar anda, atau klik tab diatas

### Asumsi Keuangan


> Untuk field keuangan kini semua datanya diambil dari Rugi Laba yang telah diinput

#### Keuangan Kini
- `Penjualan per bulan / Omzet`: Terisi otomatis, diambil dari `omzet` di `Rugi Laba`.
- `Biaya Bahan`: Terisi otomatis, diambil dari `Harga Pokok Penjualan` di `Rugi Laba`.
- `Biaya Upah`: Terisi otomatis, diambil dari `Biaya Tenaga Kerja` di `Rugi Laba`.
- `Biaya Operasional`: Terisi otomatis, diambil dari `Biaya Operasional` di `Rugi Laba`.
- `Biaya Hidup`: Terisi otomatis, diambil dari `Biaya Hidup` di `Rugi Laba`.

#### Asumsi (Keuangan Yang Akan Datang)

!> Untuk melihat rumus rumus perhitungan Asumsi Keuangan lebih detail lihat `disini`

- `Penjualan YAD`: Terisi otomatis setelah tombol `Hitung Asumsi` di tekan.
- `Biaya Bahan YAD`: Terisi otomatis setelah tombol `Hitung Asumsi` di tekan.
- `Biaya Upah YAD`: Terisi otomatis setelah tombol `Hitung Asumsi` di tekan.
- `Biaya Operasional YAD`: Terisi otomatis setelah tombol `Hitung Asumsi` di tekan.
- `Biaya Hidup YAD`: Terisi otomatis setelah tombol `Hitung Asumsi` di tekan.

Jika semuanya sudah di cek lalu klik tombol `Hitung Asumsi` maka hasil otomatis akan terhitung

![image](https://user-images.githubusercontent.com/45744788/199891398-4766add0-af74-45a5-97e4-f653521534ea.png)


Untuk melanjutkan ke step selanjutnya silahkan swipe kiri layar anda, atau klik tab diatas

### Interest

?> Yay kita sudah sampai di bagian terakhir

- `Bunga Kredit`: Terisi otomatis, diambil dari `Bunga Kredit` di `Data Keuangan`.
- `Jangka Waktu`: Terisi otomatis, diambil dari `Jangka Waktu` di `Data Keuangan`.
- `Trade Cycle`: Diisi manual, Trade Cycle adalah lamanya perputaran uang perusahaan dihitung dari kas menjadi bahan baku, proses produksi, barang jadi, penjualan, piutang sampai kembali menjadi kas.

Dari ketiga subsection Keuangan diatas jika semuanya sudah terisi, dan pastikan semua field terisi dengan benar, Selanjutnya klik tombol `Simpan` untuk menyimpan data Input Keuangan.

![image](https://user-images.githubusercontent.com/45744788/199892461-d7b90551-f924-4bf3-ae30-40a740816027.png)

Jika sukses akan ada Snackbar hijau dan aplikasi akan kembali ke detail debitur dengan progress bar yang bertambah ke 10% serta Tombol `input` hilang digantikan tombol `lihat` dan `edit`

Selamat Sudah Menginput Keuangan 🎉🎉🎉