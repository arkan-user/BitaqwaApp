import 'dart:convert';
import 'package:bitaqwa/jadwal_sholat/waktu_sholat_model.dart';
import 'package:http/http.dart' as http;

// SERVICE SHOLAT: Bertugas menghubungi server API Aladhan untuk mengambil data jam sholat
class PrayerService {
  
  // Fungsi getPrayerTimes: Mengirim koordinat lokasi ke internet dan menerima jam sholat 5 waktu
  Future<PrayerTimeModel?> getPrayerTimes({
    required double latitude,
    required double longitude,
  }) async {
    try {
      // 1. Menyusun link URL API Aladhan dengan koordinat lintang & bujur
      // method=20 menggunakan standar perhitungan waktu sholat Kemenag RI / Muslim World League
      final url = Uri.parse(
        "https://api.aladhan.com/v1/timings"
        "?latitude=$latitude"
        "&longitude=$longitude"
        "&method=20",
      );

      // 2. Mengirimkan permintaan data (HTTP GET) ke server Aladhan
      final response = await http.get(url);

      // 3. Jika server membalas dengan status 200 (Artinya: Berhasil / OK)
      if (response.statusCode == 200) {
        // Mengurai teks JSON yang diterima
        final data = jsonDecode(response.body);

        // Mengambil bagian data jadwal sholat (timings)
        final timings = data['data']['timings'];

        // Mengubah data ke dalam model PrayerTimeModel kita
        return PrayerTimeModel.fromJson(timings);
      }
    } catch (e) {
      // Jika terjadi kesalahan koneksi atau sinyal error, catat error di konsol
      print("Prayer API Error : $e");
    }

    // Jika gagal, kembalikan nilai kosong (null)
    return null;
  }
}

