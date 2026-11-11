import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:bitaqwa/dashboard/color_constant.dart';
import 'package:bitaqwa/zakat/zakat_logic.dart';
import 'package:bitaqwa/zakat/zakat_result_card.dart';

// SCREEN UTAMA KALKULATOR ZAKAT MAL
class ZakatScreen extends StatefulWidget {
  const ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  // Controller dengan format mata uang otomatis (Rp)
  final MoneyMaskedTextController _totalHartaController =
      MoneyMaskedTextController(
        thousandSeparator: '.',
        precision: 0,
        decimalSeparator: '',
      );

  final MoneyMaskedTextController _hargaEmasController =
      MoneyMaskedTextController(
        thousandSeparator: '.',
        precision: 0,
        decimalSeparator: '',
        initialValue: 1400000, // Nilai default estimasi harga emas per gram
      );

  // Variabel penampung status & hasil kalkulasi
  bool _sudahDihitung = false;
  bool _wajibZakat = false;
  double _batasNisab = 0;
  double _nominalZakat = 0;

  // Fungsi kalkulasi saat tombol ditekan
  void _hitungZakat() {
    final totalHarta = _totalHartaController.numberValue;
    final hargaEmas = _hargaEmasController.numberValue;

    if (totalHarta <= 0 || hargaEmas <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Harap masukkan nominal harta dan harga emas dengan benar.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final batasNisab = ZakatLogic.hitungNisabRupiah(hargaEmas);
    final wajib = ZakatLogic.apakahWajibZakat(
      totalHarta: totalHarta,
      hargaEmasPerGram: hargaEmas,
    );
    final zakat = wajib ? ZakatLogic.hitungZakat(totalHarta) : 0.0;

    setState(() {
      _sudahDihitung = true;
      _wajibZakat = wajib;
      _batasNisab = batasNisab;
      _nominalZakat = zakat;
    });
  }

  // Fungsi reset inputan
  void _reset() {
    setState(() {
      _totalHartaController.updateValue(0);
      _sudahDihitung = false;
      _wajibZakat = false;
      _batasNisab = 0;
      _nominalZakat = 0;
    });
  }

  @override
  void dispose() {
    _totalHartaController.dispose();
    _hargaEmasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Kalkulator Zakat Mal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: ColorConstant.colorText,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorConstant.colorText,
            size: 20,
          ),
          tooltip: 'move to the before page',
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. BANNER ILUSTRASI / HEADER ZAKAT
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/bg_header_zakat.png',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    color: ColorConstant.colorPrimary,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.calculate,
                      color: Colors.white,
                      size: 48,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 2. KARTU FORM INPUT
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorConstant.colorPrimary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Input Total Harta
                  const Text(
                    'Total Harta (Tabungan/Emas/Aset)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: ColorConstant.colorText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _totalHartaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: 'Rp ',
                      hintText: '0',
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: ColorConstant.colorPrimary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Input Harga Emas per Gram Saat Ini
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Harga Emas / Gram Saat Ini',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: ColorConstant.colorText,
                        ),
                      ),
                      Text(
                        'Nisab: 85 Gram',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.colorPrimaryDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _hargaEmasController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: 'Rp ',
                      hintText: '0',
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: ColorConstant.colorPrimary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tombol Aksi (Hitung & Reset)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _hitungZakat,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.colorPrimary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Hitung Zakat',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: _reset,
                        icon: const Icon(Icons.refresh_rounded),
                        tooltip: 'Reset Input',
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. KARTU HASIL PERHITUNGAN
            ZakatResultCard(
              sudahDihitung: _sudahDihitung,
              wajibZakat: _wajibZakat,
              batasNisab: _batasNisab,
              nominalZakat: _nominalZakat,
            ),
          ],
        ),
      ),
    );
  }
}
