// MODEL WAKTU SHOLAT: Kerangka data untuk menampung jam sholat 5 waktu & matahari terbit
class PrayerTimeModel {
  // Jam Sholat Subuh (Fajr)
  final String fajr;
  // Jam Sholat Dzuhur (Dhuhr)
  final String dhuhr;
  // Jam Sholat Ashar (Asr)
  final String asr;
  // Jam Sholat Maghrib (Maghrib)
  final String maghrib;
  // Jam Sholat Isya (Isha)
  final String isha;
  // Jam Terbit Matahari (Sunrise)
  final String sunrise;

  PrayerTimeModel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.sunrise,
  });

  // Factory constructor: Mengubah data mentah Map/JSON dari server internet menjadi objek PrayerTimeModel
  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      sunrise: json['Sunrise'],
    );
  }
}
