import 'package:bitaqwa/doa_harian/kategori_doa_enum.dart';

// MODEL KATEGORI DOA: Kerangka data untuk kartu kategori doa di layar menu Doa
class KategoriDoaModel {
  // Kategori doa yang diambil dari pilihan enum DoaCategory
  final DoaCategory category;

  const KategoriDoaModel({required this.category});
}
