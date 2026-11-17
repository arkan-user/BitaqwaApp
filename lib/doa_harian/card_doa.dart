import 'package:bitaqwa/doa_harian/kategori_doa_model.dart';
import 'package:bitaqwa/doa_harian/kategori_doa_ext.dart';
import 'package:bitaqwa/doa_harian/doa_list_screen.dart';
import 'package:flutter/material.dart';

// WIDGET CARD DOA: Komponen kartu visual untuk menampilkan sebuah kategori doa
class CardDoa extends StatelessWidget {
  // Menerima data kategori doa
  final KategoriDoaModel doa;

  const CardDoa({super.key, required this.doa});

  @override
  Widget build(BuildContext context) {
    // InkWell: Membuat kartu bisa disentuh dengan efek animasi klik (ripple)
    return InkWell(
      // Saat kartu disentuh, pindah ke layar DoaListScreen sesuai kategori yang dipilih
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoaListScreen(category: doa.category),
          ),
        );
      },
      // Wadah kartu dengan dekorasi gambar ikon dan warna latar
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        // Column untuk menata posisi ikon di atas dan judul di bawah
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar Ikon Kategori
            Image.asset(doa.category.image, height: 55, width: 55),
            const SizedBox(height: 8),
            // Teks Nama Kategori Doa
            Text(
              doa.category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
