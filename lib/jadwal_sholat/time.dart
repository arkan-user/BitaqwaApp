import 'package:bitaqwa/jadwal_sholat/color_constant.dart';
import 'package:flutter/material.dart';

// WIDGET TIME: Baris komponen untuk menampilkan nama sholat, jam sholat, dan ikon jam
class Time extends StatelessWidget {
  // 1. Nama sholat (misal: 'Subuh', 'Dzuhur')
  final String pray;
  // 2. Waktu/jam sholat (misal: '04:30')
  final String time;
  // 3. Gambar ikon jam
  final String image;

  const Time({
    required this.pray,
    required this.time,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Row: Menyusun nama sholat di kiri, jam di tengah, dan ikon jam di kanan
    return Row(
      children: [
        // Teks Nama Sholat
        Text(
          pray,
          style: TextStyle(
            color: ColorConstant.colorText,
            fontFamily: 'PoppinsRegular',
          ),
        ),
        // Spacer: Mendorong elemen berikutnya ke ujung kanan
        const Spacer(),
        // Teks Jam Waktu Sholat
        Text(
          time,
          style: TextStyle(
            color: ColorConstant.colorText,
            fontFamily: 'PoppinsRegular',
          ),
        ),
        const SizedBox(width: 16),
        // Gambar Ikon Jam
        Image.asset(image),
      ],
    );
  }
}
