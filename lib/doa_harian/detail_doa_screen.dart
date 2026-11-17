import 'package:bitaqwa/doa_harian/doa_model.dart';
import 'package:bitaqwa/doa_harian/color_constant.dart';
import 'package:flutter/material.dart';

// SCREEN DETAIL DOA: Halaman lengkap untuk membaca satu doa (Tulisan Arab, Terjemahan, & Sumber Hadits)
class DetailDoaScreen extends StatelessWidget {
  // Menerima data doa spesifik yang diklik
  final Doa doa;

  const DetailDoaScreen({super.key, required this.doa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar judul doa
      appBar: AppBar(
        title: Text(
          doa.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorConstant.colorPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // SingleChildScrollView: Memungkinkan layar digulir (scroll) jika doa panjang
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // KOTAK BACAAN ARAB
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorConstant.colorAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              // Teks Arab rata kanan (RTL) dengan ukuran huruf besar
              child: Text(
                doa.arabicText,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 2.0, // Memberi jarak renggang antar baris agar harakat jelas
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // KOTAK TERJEMAHAN BAHASA INDONESIA
            const Text(
              'Artinya:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              doa.translation,
              style: TextStyle(
                fontSize: 15,
                color: ColorConstant.colorText,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // KOTAK SUMBER RUJUKAN HADITS
            const Text(
              'Rujukan / Sumber:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              doa.reference,
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: ColorConstant.colorPrimaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
