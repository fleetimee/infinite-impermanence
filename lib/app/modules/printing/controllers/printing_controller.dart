// ignore_for_file: unnecessary_overrides

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/invoice.dart';

class PrintingController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Invoice? invoice;

  final invoices = [
    Invoice(
        customer: 'Novian Andika',
        address: '123 Fake St\r\nBermuda Triangle',
        items: [
          LineItem(
            'Biaya Bahan',
            120,
          ),
          LineItem('Biaya Pegawai', 200),
          LineItem('Biaya Operasi', 3020.45),
          LineItem('Omzet Per BUlan', 840.50),
        ],
        name: 'KUR Bayu Laundry'),
    Invoice(
      customer: 'Sonia Eka Putri',
      address: '82 Unsure St\r\nBaggle Palace',
      items: [
        LineItem('Biaya Bahan', 100),
        LineItem('Biaya Operasi', 43.55),
        LineItem('Omzet Per Bulan', 50),
      ],
      name: 'KUR dwi dagang sayur',
    ),
    Invoice(
      customer: 'Lussy Ika S',
      address: '55 Dancing Parade\r\nDance Place',
      items: [
        LineItem('Biaya Bahan', 400.50),
        LineItem('Biaya Operasi', 80.55),
        LineItem('Omzet Per Bulan', 80),
      ],
      name: 'KUR lely warung makan',
    ),
    Invoice(
        customer: 'Meliya Aja',
        address: '123 Fake St\r\nBermuda Triangle',
        items: [
          LineItem(
            'Technical Engagement',
            120,
          ),
          LineItem('Biaya Bahan', 200),
          LineItem('Biaya Operasi', 3020.45),
          LineItem('Biaya Per Bulan', 840.50),
        ],
        name: 'KUR kamsari kelapa muda'),
    Invoice(
        customer: 'Novian Andika',
        address: '123 Fake St\r\nBermuda Triangle',
        items: [
          LineItem(
            'Upah',
            120,
          ),
          LineItem('Biaya Bahan', 200),
          LineItem('Biaya Operasi', 3020.45),
          LineItem('Biaya Per Bulan', 840.50),
        ],
        name: 'KUR dewi jual mobil'),
  ];
}
