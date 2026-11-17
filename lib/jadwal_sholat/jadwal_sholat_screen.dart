import 'package:bitaqwa/jadwal_sholat/waktu_sholat_model.dart';
import 'package:bitaqwa/jadwal_sholat/sholat_helper.dart';  
import 'package:bitaqwa/jadwal_sholat/time.dart';
import 'package:bitaqwa/jadwal_sholat/lokasi_service.dart';
import 'package:bitaqwa/jadwal_sholat/sholat_service.dart';
import 'package:bitaqwa/jadwal_sholat/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// SCREEN JADWAL SHOLAT: Menampilkan jadwal sholat harian akurat sesuai lokasi pengguna
class JadwalSholatScreen extends StatefulWidget {
  const JadwalSholatScreen({super.key});

  @override
  State<JadwalSholatScreen> createState() => _JadwalSholatScreenState();
}

class _JadwalSholatScreenState extends State<JadwalSholatScreen> {
  // Variabel penampung state data lokasi dan waktu sholat
  String _location = "Mengambil lokasi...";
  bool _isLoading = true;
  PrayerTimeModel? prayerTime;

  @override
  void initState() {
    super.initState();
    // Saat layar pertama dibuka, langsung panggil loadData
    loadData();
  }

  // FUNGSI LOAD DATA: Mengambil koordinat GPS lalu meminta waktu sholat ke server Aladhan
  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final location = await LocationService().getCurrentLocation();

      final prayer = await PrayerService().getPrayerTimes(
        latitude: location.latitude,
        longitude: location.longitude,
      );

      setState(() {
        _location = location.city;
        prayerTime = prayer;
      });
    } catch (e) {
      setState(() {
        prayerTime = null;
        _location = "Lokasi tidak tersedia";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          'Jadwal Sholat',
          style: TextStyle(
            color: ColorConstant.colorWhite,
            fontFamily: "PoppinsMedium",
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorConstant.colorWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (prayerTime == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off, size: 60, color: Colors.grey),
            const SizedBox(height: 16),
            const Text("Gagal mengambil jadwal sholat"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: loadData, child: const Text("Coba Lagi")),
          ],
        ),
      );
    }

    return _buildContent();
  }

  Widget _buildContent() {
    final nextPrayer = prayerTime != null
        ? PrayerHelper.getNextPrayer(prayerTime!)
        : null;

    return Container(
      color: Colors.blue[50],
      child: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_header_jadwal_sholat.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 26),
              Text(
                DateFormat('EEEE, d MMMM', 'id_ID').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "PoppinsSemiBold",
                  color: ColorConstant.colorWhite,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                nextPrayer!['name']!,
                style: TextStyle(
                  color: ColorConstant.colorWhite,
                  fontSize: 16,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                nextPrayer['time']!,
                style: TextStyle(
                  color: ColorConstant.colorWhite,
                  fontSize: 36,
                  fontFamily: 'PoppinsBold',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: ColorConstant.colorPrimary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _location,
                    style: TextStyle(color: ColorConstant.colorWhite),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              _buildPrayerCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerCard() {
    final prayers = [
      {"name": "Subuh", "time": prayerTime!.fajr},
      {"name": "Dzuhur", "time": prayerTime!.dhuhr},
      {"name": "Ashar", "time": prayerTime!.asr},
      {"name": "Maghrib", "time": prayerTime!.maghrib},
      {"name": "Isya", "time": prayerTime!.isha},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorConstant.colorWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: prayers.length,
        separatorBuilder: (_, _) =>
            const Divider(thickness: 2, color: Color(0xffC5E6DB)),
        itemBuilder: (context, index) {
          final prayer = prayers[index];
          return Time(
            pray: prayer["name"] as String,
            time: prayer["time"] as String,
            image: "assets/images/img_clock.png",
          );
        },
      ),
    );
  }
}

