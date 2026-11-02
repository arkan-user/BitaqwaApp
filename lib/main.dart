// === BAGIAN 1: IMPORT ===
// Mengambil halaman Dashboard (TUGAS 1 - AKTIF)
import 'package:bitaqwa/dashboard/basicdashboard_screen.dart';

// TUGAS 2 - Kalkulator Zakat (belum dihubungkan)
// import 'package:bitaqwa/zakat/zakat_screen.dart';

// TUGAS 3 - Kajian Online (belum dihubungkan)
// import 'package:bitaqwa/kajian_online/video_kajian_screen.dart';

// TUGAS 4 - Doa Harian (belum dihubungkan)
// import 'package:bitaqwa/doa_harian/doa_screen.dart';

// TUGAS 5 - Jadwal Sholat (belum dihubungkan)
// import 'package:bitaqwa/jadwal_sholat/jadwal_sholat_screen.dart';

// Mengambil pustaka UI Material Flutter
import 'package:flutter/material.dart';
// Mengambil modul untuk mengatur format tanggal lokal (Indonesia)
import 'package:intl/date_symbol_data_local.dart';

// === BAGIAN 2: FUNGSI UTAMA (PINTU GERBANG APLIKASI) ===
// Fungsi main() adalah tombol START yang pertama kali dipanggil saat aplikasi dibuka
void main() async {
  // Memastikan semua jembatan sistem Flutter dan HP sudah terhubung
  WidgetsFlutterBinding.ensureInitialized();

  // Mengatur bahasa kalender ke Bahasa Indonesia ('id_ID')
  await initializeDateFormatting('id_ID', null);

  // Menyalakan dan menampilkan aplikasi (MyApp) ke layar HP
  runApp(const MyApp());
}

// === BAGIAN 3: WADAH UTAMA APLIKASI (MYAPP) ===
// MyApp adalah kerangka luar aplikasi (StatelessWidget karena tampilannya tetap)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp: Pondasi aplikasi standar Google/Android
    return MaterialApp(
      // Judul aplikasi pada sistem
      title: 'Bitaqwa App',
      // Pengaturan tema warna dasar aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // ROUTES: Denah jalan / peta navigasi antar halaman
      routes: {
        '/': (context) =>
            const BasicDashboardScreen(), // Halaman awal (Dashboard) - TUGAS 1
        // TUGAS 2 - Tambahkan route zakat di sini saat mengerjakan Tugas 2:
        // 'zakat': (context) => const ZakatScreen(),

        // TUGAS 3 - Tambahkan route kajian di sini saat mengerjakan Tugas 3:
        // 'video-kajian': (context) => const VideoKajianScreen(),

        // TUGAS 4 - Tambahkan route doa di sini saat mengerjakan Tugas 4:
        // 'doa': (context) => const DoaScreen(),

        // TUGAS 5 - Tambahkan route jadwal sholat di sini saat mengerjakan Tugas 5:
        // 'jadwal-sholat': (context) => const JadwalSholatScreen(),
      },
    );
  }
}
