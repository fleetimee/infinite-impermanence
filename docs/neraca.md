## Sekilas Neraca

Neraca adalah laporan dalam bentuk daftar yang disusun secara sistematis yang 
menyajikan informasi perbandingan apa yang dimiliki bank ( aktiva ) yang sekaligus 
menunjukan penggunaan dana atau investasi bank ( pasiva ) pada suatu periode tertentu.

## Cara Penggunaan

Untuk memulai penginputan Neraca Debitur, Pilih Menu `neraca`, kemudian buka dropdown nya sampai muncul tombol input 

![image](https://user-images.githubusercontent.com/45744788/199665918-02dd1ae8-36ae-45f4-af55-f7e4df3ba670.png)

Disitu juga akan tertera keterangan sudah input nya atau belom, Jika sudah maka menu akan berubah menjadi `lihat` dan `edit`.
Serta indikator diatas akan berubah menjadi hijau dan progress bar akan bertambah sebanyak 10%.

![image](https://user-images.githubusercontent.com/45744788/199666175-151ab76e-4515-42e9-b38b-78054278f822.png)


## Input Neraca

![image](https://user-images.githubusercontent.com/45744788/199667618-59e65b66-986b-4c25-b733-bbd2e9c5e261.png)

Berikut field yang harus diinputkan untuk melengkapi Data Neraca debitur :

- `Tanggal` : Pilih tanggal penginputan

### Kas dan Bank
- `Kas on Hand` : Masukkan jumlah uang yang ada di kas (Input 0 Jika tidak ada)
- `Tabungan` : Masukkan jumlah uang yang ada di tabungan (Input 0 Jika tidak ada)

Kemudian tekan tombol `Hitung` untuk menghitung totalnya.


### Piutang
- `Piutang` : Masukkan jumlah piutang yang ada. (Input 0 Jika tidak ada)

### Persediaan
- `Persediaan` : Masukkan jumlah persediaan yang ada. (Input 0 Jika tidak ada)

### Hutang Usaha
- `Hutang Usaha` : Masukkan jumlah hutang usaha yang ada. (Input 0 Jika tidak ada)

### Hutang Bank
- `Hutang Bank` : Masukkan jumlah hutang bank yang ada. (Input 0 Jika tidak ada)

### Aktiva Tetap
- `Peralatan / Mesin` : Masukkan total valuasi peralatan / mesin yang ada. (Input 0 Jika tidak ada)
- `Kendaraan` : Masukkan total valuasi kendaraan yang ada. (Input 0 Jika tidak ada) 
- `Tanah dan Bangunan`: Masukkan total valuasi Tanah dan Bangunan yang ada. (Input 0 Jika tidak ada)

Kemudian tekan tombol `Hitung` untuk menghitung totalnya.


Jika sudah terisi semua klik tombol `simpan`, maka tampilan akan kembali ke detail debitur
dan progress akan terisi sebanyak 10% serta tombol input berubah menjadi `lihat` dan `edit` yang berarti 
Data Neraca sudah sukses diinput 🎉

!> Developer note: Pastikan field sudah terisi semua, sebelum klik `simpan`

## Lihat Neraca

Untuk melihat neraca yang sudah diinputkan tadi bisa melalui 2 cara yaitu :
- Klik tombol `lihat` di section `neraca`
- Langsung lewat `printing centre` dengan cara klik tombol `READY` di section `neraca`

?> Pastikan sudah di-input jika ingin mencetak Neraca, karena jika belum ya gak akan bisa juga sih 🤣

![image](https://user-images.githubusercontent.com/45744788/199674160-9de59f02-18d7-4e77-8db4-10a211431389.png)

## Edit Neraca

!> Developer note: Jika isian Rugi laba dst sudah terisi, maka ulangi edit Rugi Laba Dst setelah diedit Neraca.

!> Contoh : Field Neraca untuk Kas on Hand berubah di Neraca, karena Nilai Neraca yang terbaru dibutuhkan 
untuk perhitungan Rugi Laba maka anda harus mengedit Rugi Laba Dst setelah Neraca di edit.

!> Setelah menginputkan value yang baru jangan lupa di klik tombol `Hitung` untuk menghitung totalnya yang terupdate.

Jika ada yang keliru penginputan nya (why ?? 😭) bisa di edit dengan cara klik tombol `edit` di section `neraca`.

Karena field sudah terisi semua (karena sudah diinput sebelumnya) maka tinggal di edit saja yang salah.

Kalo sudah klik tombol `update` untuk melakukan perubahan.
