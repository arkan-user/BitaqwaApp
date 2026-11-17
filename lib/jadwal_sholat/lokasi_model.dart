// MODEL LOKASI: Kerangka data untuk menyimpan titik koordinat dan nama wilayah pengguna
class LocationModel {
  // 1. Garis Lintang (Latitude GPS)
  final double latitude;
  // 2. Garis Bujur (Longitude GPS)
  final double longitude;
  // 3. Nama Kota / Kabupaten (misal: 'Jakarta Selatan')
  final String city;
  // 4. Nama Kecamatan / Desa (misal: 'Kebayoran Baru')
  final String district;

  const LocationModel({
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.district,
  });
}
