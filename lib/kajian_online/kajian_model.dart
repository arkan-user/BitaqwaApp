// MODEL KAJIAN VIDEO: Kerangka data untuk sebuah video kajian YouTube
class KajianVideo {
  // 1. Kode unik ID video YouTube (misal: 'kOnZ_Jv_C6k')
  final String videoId;
  // 2. File gambar cover / thumbnail
  final String thumbnail;
  // 3. Nama akun channel YouTube
  final String account;
  // 4. Nama Ustadz / Penceramah
  final String ustadz;
  // 5. Judul video kajian
  final String title;
  // 6. Ringkasan penjelasan video
  final String description;

  const KajianVideo({
    required this.videoId,
    required this.thumbnail,
    required this.account,
    required this.ustadz,
    required this.title,
    required this.description,
  });
}
