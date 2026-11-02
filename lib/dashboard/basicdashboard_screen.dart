import 'dart:math' as math;

import 'package:bitaqwa/dashboard/color_constant.dart';
import 'package:bitaqwa/dashboard/menu_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// SCREEN BASIC DASHBOARD: Tampilan beranda aplikasi yang menyapa pengguna dan menampilkan menu fitur
class BasicDashboardScreen extends StatelessWidget {
  const BasicDashboardScreen({super.key});

  // Sapaan & pesan mengikuti waktu (pagi / siang /   sore / malam)
  _TimeInfo _timeInfo() {
    final hour = DateTime.now().hour;
    if (hour >= 4 && hour < 11) {
      return const _TimeInfo(
        message: 'sholat dulu yuk!!',
        sub: 'luangkan waktu sejenak mu tuk ibadah..',
        icon: Icons.wb_twilight_rounded,
      );
    } else if (hour >= 11 && hour < 15) {
      return const _TimeInfo(
        message: 'jangan lupa sholat dzuhur ya!!',
        sub: 'udah jam berapa nihh, yuk sholat..',
        icon: Icons.wb_sunny_rounded,
      );
    } else if (hour >= 15 && hour < 18) {
      return const _TimeInfo(
        message: 'yok sholat ashar tepat waktu!!',
        sub: 'sore yang tenang buat dzikir..',
        icon: Icons.wb_cloudy_rounded,
      );
    }
    return const _TimeInfo(
      message: 'sebelum tidur isya dulu yokk!!',
      sub: 'jangan lupa isya & doa sebelum tidur..',
      icon: Icons.nightlight_round,
    );
  }

  String _today() {
    try {
      return DateFormat('EEEE, d MMMM y', 'id_ID').format(DateTime.now());
    } catch (_) {
      return DateFormat('d MMM y').format(DateTime.now());
    }
  }

  // Keterangan singkat tiap menu (berdasarkan rute)
  String _subtitle(String route) {
    switch (route) {
      case 'doa':
        return 'Kumpulan doa harian';
      case 'zakat':
        return 'Hitung zakat mudah';
      case 'jadwal-sholat':
        return 'Waktu sholat di bogor';
      case 'video-kajian':
        return 'Kajian & ceramah';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = _timeInfo();

    return Scaffold(
      backgroundColor: ColorConstant.colorAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HEADER ATAS (coklat gelap + pola geometris islami)
            _buildHeader(info),
            const SizedBox(height: 26),

            // 2. JUDUL SEKSI + GRID MENU (4 TOMBOL MENU UTAMA)
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Menu Ibadah & Amal'),
                      const SizedBox(height: 16),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 Kolom menu
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: menus.length,
                        itemBuilder: (context, index) {
                          final menu = menus[index];
                          return _MenuCard(
                            title: menu.title,
                            subtitle: _subtitle(menu.route),
                            image: menu.image,
                            onTap: () {
                              // Saat menu diklik, buka rute navigasi yang bersangkutan
                              Navigator.pushNamed(context, menu.route);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 3. PENUTUP
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _line(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.star_rounded,
                      size: 14, color: ColorConstant.colorPrimary),
                ),
                _line(),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              '"Yuk, istiqamah dalam beribadah setiap hari"',
              style: TextStyle(
                fontFamily: 'PoppinsMedium',
                fontSize: 12,
                color: ColorConstant.colorTextSoft,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(_TimeInfo info) {
    const radius = BorderRadius.only(
      bottomLeft: Radius.circular(36),
      bottomRight: Radius.circular(36),
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.colorText.withValues(alpha: 0.30),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorConstant.colorDeep,
                ColorConstant.colorText,
                ColorConstant.colorPrimaryDark,
              ],
            ),
          ),
          child: Stack(
            children: [
              // Pola geometris bintang segi-8
              Positioned.fill(
                child: CustomPaint(
                  painter: _IslamicPatternPainter(
                    color: ColorConstant.colorPrimary.withValues(alpha: 0.16),
                  ),
                ),
              ),
              // Bulan sabit besar samar
              Positioned(
                top: 30,
                right: -34,
                child: Icon(
                  Icons.nightlight_round,
                  size: 170,
                  color: ColorConstant.colorPrimary.withValues(alpha: 0.18),
                ),
              ),
              SafeArea(
                bottom: false,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Baris atas: logo kecil + chip lokasi
                          Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConstant.colorPrimary
                                      .withValues(alpha: 0.18),
                                  border: Border.all(
                                    color: ColorConstant.colorPrimary,
                                    width: 1.2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.nightlight_round,
                                  size: 20,
                                  color: ColorConstant.colorAccent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Bitaqwa • cari pahala yok',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: 12,
                                    letterSpacing: 0.3,
                                    color: ColorConstant.colorSand,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.10),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorConstant.colorPrimary
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_rounded,
                                        size: 14,
                                        color: ColorConstant.colorPrimary),
                                    SizedBox(width: 4),
                                    Text(
                                      'Bogor-Indonesia',
                                      style: TextStyle(
                                        fontFamily: 'PoppinsMedium',
                                        fontSize: 11.5,
                                        color: ColorConstant.colorAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),

                          // Sapaan + judul
                          const Text(
                            'Assalamu\'alaikum,',
                            style: TextStyle(
                              fontFamily: 'PoppinsRegular',
                              fontSize: 14,
                              color: ColorConstant.colorPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Bitaqwa App',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontSize: 32,
                              height: 1.15,
                              color: ColorConstant.colorAccent,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded,
                                  size: 12, color: ColorConstant.colorSand),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  _today(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'PoppinsRegular',
                                    fontSize: 12,
                                    color: ColorConstant.colorSand,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Kartu pesan
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: ColorConstant.colorAccent,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: ColorConstant.colorPrimary,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        ColorConstant.colorPrimary,
                                        ColorConstant.colorPrimaryDark,
                                      ],
                                    ),
                                  ),
                                  child: Icon(info.icon,
                                      color: ColorConstant.colorAccent,
                                      size: 26),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        info.message,
                                        style: const TextStyle(
                                          fontFamily: 'PoppinsBold',
                                          fontSize: 15.5,
                                          color: ColorConstant.colorText,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        info.sub,
                                        style: const TextStyle(
                                          fontFamily: 'PoppinsRegular',
                                          fontSize: 11.5,
                                          color: ColorConstant.colorTextSoft,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: ColorConstant.colorPrimary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'PoppinsBold',
            fontSize: 17,
            color: ColorConstant.colorText,
          ),
        ),
      ],
    );
  }

  Widget _line() {
    return Container(
      width: 50,
      height: 1.2,
      color: ColorConstant.colorPrimary.withValues(alpha: 0.5),
    );
  }
}

// Pola geometris islami: bintang segi-8 (dua persegi bertumpuk) yang diulang
class _IslamicPatternPainter extends CustomPainter {
  final Color color;
  const _IslamicPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const tile = 56.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (double y = 0; y < size.height + tile; y += tile) {
      for (double x = 0; x < size.width + tile; x += tile) {
        _star(canvas, Offset(x, y), tile * 0.36, paint);
        _star(canvas, Offset(x + tile / 2, y + tile / 2), tile * 0.16, paint);
      }
    }
  }

  void _star(Canvas canvas, Offset c, double r, Paint paint) {
    for (final start in [math.pi / 4, 0.0]) {
      final path = Path();
      for (int i = 0; i < 4; i++) {
        final a = start + i * math.pi / 2;
        final p = Offset(c.dx + r * math.cos(a), c.dy + r * math.sin(a));
        if (i == 0) {
          path.moveTo(p.dx, p.dy);
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _IslamicPatternPainter oldDelegate) =>
      oldDelegate.color != color;
}

// KARTU MENU: kartu putih elegan dengan garis karamel dan ikon di dalam cincin
class _MenuCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  const _MenuCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  State<_MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<_MenuCard> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: ColorConstant.colorPrimary.withValues(alpha: 0.45),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.colorPrimaryDark.withValues(alpha: 0.16),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: Stack(
              children: [
                // Pola bintang samar di pojok kanan atas
                Positioned(
                  top: -18,
                  right: -18,
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: _IslamicPatternPainter(
                        color:
                            ColorConstant.colorPrimary.withValues(alpha: 0.22),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Cincin ikon
                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.colorAccent,
                            border: Border.all(
                              color: ColorConstant.colorPrimary,
                              width: 1.8,
                            ),
                          ),
                          child:
                              Image.asset(widget.image, fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize: 15,
                            color: ColorConstant.colorText,
                          ),
                        ),
                        if (widget.subtitle.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            widget.subtitle,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'PoppinsRegular',
                              fontSize: 10.5,
                              color: ColorConstant.colorTextSoft,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Data pesan berdasarkan waktu
class _TimeInfo {
  final String message;
  final String sub;
  final IconData icon;

  const _TimeInfo({
    required this.message,
    required this.sub,
    required this.icon,
  });
}