// MODEL DOA: Kerangka data / formulir untuk satu bacaan doa
class Doa {
  // 1. Lokasi gambar ikon doa
  final String image;
  // 2. Judul nama doa
  final String title;
  // 3. Teks bacaan tulisan Arab
  final String arabicText;
  // 4. Arti / terjemahan bahasa Indonesia
  final String translation;
  // 5. Riwayat hadits / sumber rujukan doa
  final String reference;

  // Konstruktor konstan untuk membuat objek Doa baru
  const Doa({
    required this.image,
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.reference,
  });
}
