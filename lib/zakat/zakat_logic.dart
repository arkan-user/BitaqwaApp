import 'package:intl/intl.dart';

// KELAS LOGIKA HITUNG ZAKAT MAL
// Dibuat terpisah agar mudah dipahami siswa:
// Logika perhitungan terpisah dari tampilan UI (Separation of Concerns).
class ZakatLogic {
  // Nisab zakat mal setara dengan 85 gram emas murni
  static const double nisabEmasGram = 85.0;

  // Kadar zakat mal adalah 2.5% (0.025)
  static const double kadarZakat = 0.025;

  // 1. Menghitung nilai rupiah batas nisab (85 gram x harga emas per gram saat ini)
  static double hitungNisabRupiah(double hargaEmasPerGram) {
    return nisabEmasGram * hargaEmasPerGram;
  }

  // 2. Mengecek apakah total harta sudah mencapai nisab atau belum
  static bool apakahWajibZakat({
    required double totalHarta,
    required double hargaEmasPerGram,
  }) {
    final batasNisab = hitungNisabRupiah(hargaEmasPerGram);
    return totalHarta >= batasNisab;
  }

  // 3. Menghitung nominal zakat yang wajib dikeluarkan (2.5% dari total harta)
  static double hitungZakat(double totalHarta) {
    return totalHarta * kadarZakat;
  }

  // 4. Helper untuk format angka ke Rupiah yang rapi (misal: Rp 2.500.000)
  static String formatRupiah(double nominal) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(nominal);
  }
}

