import 'package:bitaqwa/jadwal_sholat/waktu_sholat_model.dart';

// HELPER: Alat bantu untuk menghitung sholat mana yang akan tiba berikutnya
class PrayerHelper {
  // Fungsi getNextPrayer: Menerima jadwal sholat dan mencari sholat terdekat berikutnya
  static Map<String, String> getNextPrayer(PrayerTimeModel prayer) {
    // 1. Ambil waktu dan tanggal saat ini dari HP pengguna
    final now = DateTime.now();

    // 2. Daftar 5 sholat fardhu beserta jamnya
    final prayers = {
      "Subuh": prayer.fajr,
      "Dzuhur": prayer.dhuhr,
      "Ashar": prayer.asr,
      "Maghrib": prayer.maghrib,
      "Isya": prayer.isha,
    };

    // 3. Periksa satu per satu sholat dari Subuh sampai Isya
    for (var item in prayers.entries) {
      // Pecah teks jam '04:30' menjadi angka jam [04] dan menit [30]
      final time = item.value.split(":");

      // Bentuk objek waktu sholat untuk hari ini
      final prayerDate = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(time[0]),
        int.parse(time[1]),
      );

      // Jika waktu sholat tersebut masih berada di depan waktu sekarang, maka itu sholat berikutnya!
      if (prayerDate.isAfter(now)) {
        return {"name": item.key, "time": item.value};
      }
    }

    // Jika semua sholat hari ini sudah lewat (misal jam 22:00), sholat berikutnya adalah Subuh besok
    return {"name": "Subuh", "time": prayer.fajr};
  }
}
