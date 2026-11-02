// MODEL MENU: Kerangka data untuk tombol menu di Dashboard utama
class MenuModel {
  // 1. Label nama menu (misal: 'Doa-doa', 'Zakat')
  final String title;
  // 2. Gambar ikon menu
  final String image;
  // 3. Alamat rute navigasi saat tombol ditekan
  final String route;

  const MenuModel({
    required this.title,
    required this.image,
    required this.route,
  });
}
