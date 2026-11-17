import 'package:bitaqwa/doa_harian/kategori_doa_enum.dart';

// EXTENSION: Memberikan kemampuan tambahan pada enum DoaCategory
// Membantu mengubah kode enum menjadi Judul Teks dan Gambar Ikon yang sesuai
extension DoaCategoryExtension on DoaCategory {
  // 1. Mengubah kode enum menjadi Teks Judul yang rapi dibaca manusia
  String get title {
    switch (this) {
      case DoaCategory.makananMinuman:
        return "Makanan & Minuman";
      case DoaCategory.pagiMalam:
        return "Pagi & Malam";
      case DoaCategory.rumah:
        return "Rumah";
      case DoaCategory.perjalanan:
        return "Perjalanan";
      case DoaCategory.sholat:
        return "Sholat";
      case DoaCategory.etikaBaik:
        return "Etika Baik";
    }
  }

  // 2. Memilih gambar ikon yang sesuai untuk setiap kategori doa
  String get image {
    switch (this) {
      case DoaCategory.makananMinuman:
        return "assets/images/ic_doa_makanan_minuman.png";
      case DoaCategory.pagiMalam:
        return "assets/images/ic_doa_pagi_malam.png";
      case DoaCategory.rumah:
        return "assets/images/ic_doa_rumah.png";
      case DoaCategory.perjalanan:
        return "assets/images/ic_doa_perjalanan.png";
      case DoaCategory.sholat:
        return "assets/images/ic_doa_sholat.png";
      case DoaCategory.etikaBaik:
        return "assets/images/ic_doa_etika_baik.png";
    }
  }
}
