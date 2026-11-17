import 'package:bitaqwa/doa_harian/kategori_doa_data.dart';
import 'package:bitaqwa/doa_harian/card_doa.dart';
import 'package:bitaqwa/doa_harian/color_constant.dart';
import 'package:flutter/material.dart';

// SCREEN DOA: Halaman kumpulan kategori doa dalam tampilan Grid (Kisi-kisi 2 kolom)
class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Bilah judul bagian atas layar
      appBar: AppBar(
        title: const Text(
          'Kumpulan Doa',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorConstant.colorPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Body: GridView 2 Kolom menampilkan kartu-kartu kategori doa
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,          // Membagi layar menjadi 2 kolom
          crossAxisSpacing: 14,        // Jarak spasi horizontal
          mainAxisSpacing: 14,         // Jarak spasi vertikal
          childAspectRatio: 1.1,       // Proporsi kartu
        ),
        itemCount: doaCategoryData.length,
        itemBuilder: (context, index) {
          // Membuat satu per satu kartu kategori doa
          return CardDoa(
            doa: doaCategoryData[index],
          );
        },
      ),
    );
  }
}
