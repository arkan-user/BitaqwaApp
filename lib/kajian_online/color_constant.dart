import 'package:flutter/material.dart';

// Kelas ColorConstant: Wadah untuk menyimpan kode warna resmi aplikasi (Palet Cat)
// Palet: Color Hunt  #FFF8F0 - #C08552 - #8C5A3C - #4B2E2B
class ColorConstant {
  // Karamel: warna utama / aksen emas hangat
  static const Color colorPrimary = Color(0xffC08552);
  // Coklat sedang: untuk penekanan, tombol, ikon
  static const Color colorPrimaryDark = Color(0xff8C5A3C);
  // Krem hangat: latar belakang halaman
  static const Color colorAccent = Color(0xffFFF8F0);
  // Putih bersih
  static const Color colorWhite = Color(0xffffffff);
  // Coklat tua: teks utama agar nyaman dibaca
  static const Color colorText = Color(0xff4B2E2B);

  // ---- Warna tambahan turunan palet ----
  // Coklat paling gelap untuk header
  static const Color colorDeep = Color(0xff3A2220);
  // Krem lebih gelap untuk blok ikon / pemisah
  static const Color colorSand = Color(0xffF3E4D3);
  // Teks sekunder (coklat lembut)
  static const Color colorTextSoft = Color(0xff8A6E64);
}