> [!WARNING] Untuk Membuka menu Jenis Agunan, terlebih dulu input [Keuangan](keuangan.md)

## Sekilas Jenis Agunan

Modul ini digunakan untuk menentukan Jenis Agunan yang dimiliki oleh debitur, Kalo jumlah plafonnya <= 100 Juta maka otomatis akan masuk ke agunan lainnya, jika lebih dari 100 Juta maka akan muncul pilihan jenis agunan yang lebih lengkap diantaranya adalah :

> Jika > 100 Juta
- Tanah
- Tanah dan Bangunan
- Kendaraan
- Mesin dan Peralatan
- Cash Colalteral
- Kios Pasar

Pilihan diatas bisa dipilih lebih dari satu

> Jika <= 100 Juta 
- Lainnya

## Cara Penggunaan

Untuk memulai penginputan Jenis Agunan Debitur, Pilih Menu `Pilih Jenis Agunan`, kemudian buka dropdown nya sampai muncul tombol input 

![image](https://user-images.githubusercontent.com/45744788/200155712-19cbc487-3f57-4e9b-9a5d-31d3e571c107.png)

Disitu juga akan tertera keterangan sudah input nya atau belum, Jika sudah maka menu akan berubah menjadi `lihat` dan `edit`.
Serta indikator diatas akan berubah menjadi hijau dan progress bar akan bertambah sebanyak 10%.

![image](https://user-images.githubusercontent.com/45744788/199930363-d039db53-931c-4723-8350-799fe1d536ae.png)

## Input Jenis Agunan

Setelah menu `Pilih Jenis Agunan` di klik, maka akan muncul halaman Pilih Jenis Agunan seperti dibawah ini : 

> [!NOTE] Ini untuk case yang jumlah plafonnya > 100 Juta, Checkbox 'Lainnya` dimatikan.

![image](https://user-images.githubusercontent.com/45744788/200155723-855ae424-05fe-429c-a046-ea46e2de840a.png)

Untuk melanjutkan penginputan, pilih satu atau banyak jenis agunan yang dimiliki debitur 

![image](https://user-images.githubusercontent.com/45744788/200157109-c0b821ac-5e04-42a1-b37c-85bea1533883.png)

kemudian klik `Submit` untuk menyimpannya.

![image](https://user-images.githubusercontent.com/45744788/200157383-5922114e-2c37-4ef0-a866-d9c3c37149da.png)


Jika sukses akan ada Snackbar hijau dan aplikasi akan kembali ke detail debitur serta Tombol `input` hilang digantikan tombol `lihat` untuk melihat jenis agunan yang sudah diinput.

> [!NOTE] Untuk case yang jumlah plafonnya <= 100 Juta, Stepnya sama seperti diatas tetapi hanya checkbox 'Lainnya` saja yang diaktifkan.