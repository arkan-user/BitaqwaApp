import 'package:bitaqwa/doa_harian/doa_data.dart';
import 'package:bitaqwa/doa_harian/kategori_doa_enum.dart';
import 'package:bitaqwa/doa_harian/kategori_doa_ext.dart';
import 'package:bitaqwa/doa_harian/detail_doa_screen.dart';
import 'package:bitaqwa/doa_harian/color_constant.dart';
import 'package:flutter/material.dart';

// SCREEN DOA LIST: Halaman yang menampilkan daftar bacaan doa dalam kategori yang dipilih
class DoaListScreen extends StatelessWidget {
  // Menerima kategori doa yang dipilih
  final DoaCategory category;

  const DoaListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Mengambil daftar doa dari Map doaData sesuai kategori yang dipilih
    final doas = doaData[category] ?? [];

    return Scaffold(
      // AppBar dengan nama kategori doa
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorConstant.colorPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // ListView.builder: Daftar doa memanjang ke bawah
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doas.length,
        itemBuilder: (context, index) {
          final doa = doas[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // ListTile: Baris doa dengan nomor urut, judul, dan ikon panah
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              // Nomor urut doa
              leading: CircleAvatar(
                backgroundColor: ColorConstant.colorPrimary.withValues(
                  alpha: 0.2,
                ),
                child: Text(
                  '\${index + 1}',
                  style: TextStyle(
                    color: ColorConstant.colorPrimaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Judul Doa
              title: Text(
                doa.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              // Ikon panah penunjuk
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              // Saat diklik, buka layar DetailDoaScreen
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDoaScreen(doa: doa),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

