import 'dart:convert';
import 'package:bitaqwa/jadwal_sholat/lokasi_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

// SERVICE LOKASI: Bertugas mendeteksi koordinat GPS HP dan mencari nama kota pengguna secara otomatis
class LocationService {
  
  // FUNGSI UTAMA: Mengambil koordinat dan mengubahnya menjadi objek data LocationModel
  Future<LocationModel> getCurrentLocation() async {
    // 1. CEK STATUS GPS: Apakah sakelar GPS / Lokasi di HP pengguna dalam keadaan menyala?
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Jika GPS mati, hentikan program dan beritahu pengguna
      throw Exception("GPS belum aktif. Silakan nyalakan GPS di HP Anda.");
    }

    // 2. CEK IZIN (PERMISSION): Apakah aplikasi sudah diberi izin mengakses lokasi oleh pengguna?
    LocationPermission permission = await Geolocator.checkPermission();

    // Jika izin masih ditolak sementara, munculkan jendela pop-up untuk minta izin
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Jika pengguna tetap menolak izin, lempar pesan error
    if (permission == LocationPermission.denied) {
      throw Exception("Izin lokasi ditolak oleh pengguna.");
    }

    // Jika pengguna memilih 'Jangan Tanya Lagi' (deniedForever), arahkan ke pengaturan HP
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        "Izin lokasi ditolak permanen. Silakan aktifkan melalui Pengaturan HP.",
      );
    }

    // 3. MENGAMBIL KOORDINAT GPS (Latitude & Longitude) dari sensor HP
    final position = await Geolocator.getCurrentPosition();

    // 4. MENCARI NAMA KOTA: Mengirim koordinat angka ke server peta OpenStreetMap
    final location = await _getLocationName(
      position.latitude,
      position.longitude,
    );

    // 5. Kembalikan paket data lokasi yang sudah lengkap
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      city: location["city"]!,
      district: location["district"]!,
    );
  }

  // FUNGSI PRIVAT: Mengubah angka koordinat menjadi nama Kota & Kecamatan asli (Reverse Geocoding)
  Future<Map<String, String>> _getLocationName(
    double latitude,
    double longitude,
  ) async {
    // Menyusun alamat URL Reverse Geocoding ke server OpenStreetMap
    final url = Uri.parse(
      "https://nominatim.openstreetmap.org/reverse"
      "?format=jsonv2"
      "&lat=$latitude"
      "&lon=$longitude",
    );

    // Mengirim permintaan data (HTTP GET Request) lewat internet
    final response = await http.get(
      url,
      headers: {"User-Agent": "Bitaqwa/1.0"},
    );

    // Jika server internet gagal merespon (bukan status 200 OK), kembalikan nilai cadangan
    if (response.statusCode != 200) {
      return {"city": "Lokasi Tidak Diketahui", "district": ""};
    }

    // Mengurai teks data JSON dari server
    final json = jsonDecode(response.body);
    final address = json["address"] ?? {};

    // Mencari nama kota dari beberapa kemungkinan kolom alamat
    final city =
        address["city"] ??
        address["municipality"] ??
        address["town"] ??
        address["county"] ??
        address["state"] ??
        "Lokasi Tidak Diketahui";

    // Mencari nama kecamatan / kelurahan
    final district =
        address["suburb"] ?? address["village"] ?? address["hamlet"] ?? "";

    // Kembalikan nama kota dan kecamatan
    return {"city": city, "district": district};
  }
}

