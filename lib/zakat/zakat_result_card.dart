import 'package:flutter/material.dart';
import 'package:bitaqwa/dashboard/color_constant.dart';
import 'package:bitaqwa/zakat/zakat_logic.dart';

// WIDGET KARTU HASIL PERHITUNGAN ZAKAT
// Dipisah ke komponen sendiri agar kode screen utama tetap bersih dan mudah dibaca siswa
class ZakatResultCard extends StatelessWidget {
  final bool sudahDihitung;
  final bool wajibZakat;
  final double batasNisab;
  final double nominalZakat;

  const ZakatResultCard({
    super.key,
    required this.sudahDihitung,
    required this.wajibZakat,
    required this.batasNisab,
    required this.nominalZakat,
  });

  @override
  Widget build(BuildContext context) {
    if (!sudahDihitung) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorConstant.colorAccent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorConstant.colorPrimary.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: ColorConstant.colorPrimaryDark,
              size: 26,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Masukkan total harta dan harga emas saat ini, lalu tekan tombol "Hitung Zakat".',
                style: TextStyle(
                  fontSize: 13,
                  color: ColorConstant.colorText.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: wajibZakat
              ? const Color(0xFF4CAF50).withOpacity(0.5)
              : const Color(0xFFFFA000).withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Status
          Row(
            children: [
              Icon(
                wajibZakat ? Icons.check_circle_rounded : Icons.info_rounded,
                color: wajibZakat
                    ? const Color(0xFF2E7D32)
                    : const Color(0xFFE65100),
                size: 26,
              ),
              const SizedBox(width: 8),
              Text(
                wajibZakat ? 'Wajib Bayar Zakat Mal' : 'Belum Mencapai Nisab',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: wajibZakat
                      ? const Color(0xFF2E7D32)
                      : const Color(0xFFE65100),
                ),
              ),
            ],
          ),

          const Divider(height: 24),

          // Info Batas Nisab
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Batas Nisab (85 gr emas):',
                style: TextStyle(fontSize: 13, color: ColorConstant.colorText),
              ),
              Text(
                ZakatLogic.formatRupiah(batasNisab),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.colorText,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Nominal Zakat yang harus dikeluarkan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: wajibZakat
                  ? const Color(0xFFE8F5E9)
                  : const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wajibZakat ? 'Zakat yang Dikeluarkan (2.5%):' : 'Keterangan:',
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorConstant.colorText.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  wajibZakat
                      ? ZakatLogic.formatRupiah(nominalZakat)
                      : 'Harta Anda belum mencapai nisab (85 gram emas), sehingga belum diwajibkan zakat mal.',
                  style: TextStyle(
                    fontSize: wajibZakat ? 20 : 13,
                    fontWeight: wajibZakat ? FontWeight.bold : FontWeight.w500,
                    color: wajibZakat
                        ? const Color(0xFF1B5E20)
                        : const Color(0xFFE65100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

