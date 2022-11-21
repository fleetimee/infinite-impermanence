## Pendahuluan

![image](https://user-images.githubusercontent.com/45744788/202955145-a1366f3f-3438-441c-8f61-b914e08197d9.png)

Secara garis besar di tampilan ini merupakah jantung dari aplikasi ini. Di sini kita bisa melihat data debitur secara detail. Di sini juga kita bisa melakukan penginputan debitur sesuai dengan kebutuhan.

## Fitur

### Edit Debitur
Jika ada kesalahan dalam penginputan debitur atau ingin menambahkan peminjam dan pemilik agunan, kita bisa melakukan edit data debitur dengan cara mengklik icon `pensil` yang berada di pojok kanan atas.

![image](https://user-images.githubusercontent.com/45744788/202955795-0cf1bfef-ccf7-43bf-b575-4b7e44279ffe.png)

![image](https://user-images.githubusercontent.com/45744788/202961210-06ba8e4c-c00b-4aca-b33e-d181b2a5aaf5.png)

### Printing Centre
Pusat cetak dokumen didalamnya ada banyak dokumen yang bisa di cetak jika sudah mengisi data data yang dibutuhkan. Untuk mencetak dokumen bisa mengklik icon `printer` yang berada di pojok kanan atas.

![image](https://user-images.githubusercontent.com/45744788/202959070-8c2ed472-0dad-4246-bca1-7ad8c82240d9.png)

![image](https://user-images.githubusercontent.com/45744788/202959195-3b59b61b-926f-4e62-84ca-e9bab86a4393.png)

### Indikator Jenis Debitur

![image](https://user-images.githubusercontent.com/45744788/202961417-f5bbc15d-83a3-4a4b-9d50-f6fd1b37360b.png)

Berbentuk sebuah `chip` digunakan untuk mengidentifikasi dengan cepat jenis debitur ini.

### Indikator CRR (Credit Risk Rating) debitur
Nilai CRR yang sudah diinput akan ditampilkan disini, jika belum diinput maka akan muncul tulisan `N/A`.

![image](https://user-images.githubusercontent.com/45744788/202960672-c2ffeee9-c540-41b1-9c41-298a9fab11fb.png)

### Progress Bar
Indikator penyelesaian dari proses penginputan data debitur dimulai dari 0 - 100%, jika 100% data sudah bisa di print semua.

![image](https://user-images.githubusercontent.com/45744788/202961452-150ef2d8-b384-4390-9d1f-fa2464a92160.png)

## Flow Input Data Debitur

Sebenarnya flow input ini bisa dari mana saja tetapi ada beberapa section yang membutuhkan inputan sebelumnya. Berikut adalah flow input data debitur. Jadi anda bebas memilih mana yang akan diinput terlebih dahulu.


 - Keuangan (Bisa diakses dari menu `Keuangan`, bisa diinput kapan saja)
    - [Keterangan Neraca](neraca.md)
    - [Laporan Keuangan](rugi_laba.md) (Membutuhkan `Keterangan Neraca` diinput)
    - [Input Keuangan](keuangan.md) (Membutuhkan `Laporan Keuangan` diinput)
    - [Analisa Keuangan](analisa_keuangan.md) (Membutuhkan `Input Keuangan` diinput)
 - Karakter (Bisa diakses dari menu `Karakter`, bisa diinput kapan saja)
    - [Analisa Karakter](analisa_karakter.md) 
 - Bisnis (Bisa diakses dari menu `Bisnis`, bisa diinput kapan saja)
    - [Analisa Bisnis](analisa_bisnis.md)
 - Jenis Usaha  (Bisa diakses dari menu `Jenis Usaha`, bisa diinput kapan saja)
    - [Analisa Jenis Usaha](jenis_usaha.md)
 - Agunan (Bisa diakses dari menu `Agunan`, Membutuhkan `Input Keuangan` untuk diinput karena akan diambil plafondnya)
    - [Jenis Agunan](jenis_agunan.md) (Membutuhkan `Input Keuangan` diinput)
    - [Form Agunan](form_agunan.md) (Membutuhkan `Jenis Agunan` diinput)
    - [Analisa Agunan](analisa_agunan.md) (Membutuhkan `Form Agunan` diinput)

Untuk ke 5 modul diatas akan menghasilkan CRR (Credit Risk Rating) tiap sectionnya

 - Lain - lain (Bisa diakses dari menu `Lain - lain`)
    - [Syarat Lain]() 
    - [Ijin Yang Dilegitimasi]()
    - [Premi & Asuransi]() (Membutuhkan `Input Keuangan` diinput)

<!-- ![as](https://user-images.githubusercontent.com/45744788/199656141-f25e42de-926f-4dcd-86c0-6270d2d412c9.png) -->


<!-- Selain 3 fitur diatas, di sini juga terdapat beberapa fitur untuk penginputan lainnya yang akan dijelaskan secara terpisah. -->