import 'package:bitaqwa/doa_harian/doa_model.dart';
import 'package:bitaqwa/doa_harian/kategori_doa_enum.dart';

/// =======================================================
/// CARA MENAMBAHKAN DOA
///
/// 1. Tentukan kategorinya
/// 2. Tambahkan Doa(...) pada List kategori tersebut
/// 3. Simpan
///
/// Tidak perlu mengubah Screen maupun Widget.
/// =======================================================

const Map<DoaCategory, List<Doa>> doaData = {
  DoaCategory.makananMinuman: [
    Doa(
      image: 'assets/images/ic_doa_makanan_minuman.png',
      title: 'Doâ€™a Sebelum Makan',
      arabicText: 'Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù',
      translation: 'Dengan menyebut nama Allah',
      reference: 'Hadist Riwayat Abu Dawud dan At-Tirmidzi',
    ),
    Doa(
      image: 'assets/images/ic_doa_makanan_minuman.png',
      title: 'Doâ€™a Setelah Makan',
      arabicText:
          'Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡Ù Ø§Ù„Ù‘ÙŽØ°ÙÙŠ Ø£ÙŽØ·Ù’Ø¹ÙŽÙ…ÙŽÙ†ÙÙŠ Ù‡ÙŽØ°ÙŽØ§ ÙˆÙŽØ±ÙŽØ²ÙŽÙ‚ÙŽÙ†ÙÙŠÙ‡Ù Ù…ÙÙ†Ù’ ØºÙŽÙŠÙ’Ø±Ù Ø­ÙŽÙˆÙ’Ù„Ù Ù…ÙÙ†Ù‘ÙÙŠ ÙˆÙŽÙ„ÙŽØ§ Ù‚ÙÙˆÙ‘ÙŽØ©Ù',
      translation:
          'Segala puji bagi Allah yang telah memberiku makanan ini dan rezeki ini dengan tanpa daya dan kekuatan dariku',
      reference: 'Hadist Riwayat Abu Dawud, At-Tirmidzi, dan Ibnu Majah',
    ),
    Doa(
      image: 'assets/images/ic_doa_makanan_minuman.png',
      title: 'Doâ€™a Orang Yang Memberi Minum',
      arabicText: 'Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø£ÙŽØ·Ù’Ø¹ÙÙ…Ù’ Ù…ÙŽÙ†Ù’ Ø£ÙŽØ·Ù’Ø¹ÙŽÙ…ÙŽÙ†ÙÙŠØŒ ÙˆÙŽØ§Ø³Ù’Ù‚Ù Ù…ÙŽÙ†Ù’ Ø³ÙŽÙ‚ÙŽØ§Ù†ÙÙŠ',
      translation:
          'Ya Allah, berilah makan orang yang memberi makan kepadaku dan berilah minum orang yang memberi minum kepadaku',
      reference: 'HR. Muslim',
    ),
    Doa(
      image: 'assets/images/ic_doa_makanan_minuman.png',
      title: 'Doâ€™a Berbuka Di Rumah Orang Lain',
      arabicText:
          'Ø£ÙŽÙÙ’Ø·ÙŽØ±ÙŽ Ø¹ÙÙ†Ù’Ø¯ÙŽÙƒÙÙ…Ù Ø§Ù„ØµÙ‘ÙŽØ§Ø¦ÙÙ…ÙÙˆÙ†ÙŽØŒ ÙˆÙŽØ£ÙŽÙƒÙŽÙ„ÙŽ Ø·ÙŽØ¹ÙŽØ§Ù…ÙŽÙƒÙÙ…Ù Ø§Ù„Ø£ÙŽØ¨Ù’Ø±ÙŽØ§Ø±ÙØŒ ÙˆÙŽØµÙŽÙ„Ù‘ÙŽØªÙ’ Ø¹ÙŽÙ„ÙŽÙŠÙ’ÙƒÙÙ…Ù Ø§Ù„Ù’Ù…ÙŽÙ„Ø§ÙŽØ¦ÙÙƒÙŽØ©Ù',
      translation:
          'Semoga orang-orang yang berpuasa berbuka di tempat kalian, dan semoga orang-orang baik makan makanan kalian, dan semoga para malaikat mendoakan kalian',
      reference: 'HR. Abu Dawud',
    ),
    Doa(
      image: 'assets/images/ic_doa_makanan_minuman.png',
      title: 'Doâ€™a Berbuka Puasa',
      arabicText:
          'Ø°ÙŽÙ‡ÙŽØ¨ÙŽ Ø§Ù„Ø¸Ù‘ÙŽÙ…ÙŽØ£ÙØŒ ÙˆÙŽØ§Ø¨Ù’ØªÙŽÙ„Ù‘ÙŽØªÙ Ø§Ù„Ù’Ø¹ÙØ±ÙÙˆÙ‚ÙØŒ ÙˆÙŽØ«ÙŽØ¨ÙŽØªÙŽ Ø§Ù„Ø£ÙŽØ¬Ù’Ø±Ù Ø¥ÙÙ†Ù’ Ø´ÙŽØ§Ø¡ÙŽ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù',
      translation:
          'Telah hilang dahaga, urat-urat telah basah, dan telah ditetapkan pahala insya Allah',
      reference: 'HR. Abu Dawud',
    ),
  ],
  DoaCategory.pagiMalam: [
    Doa(
      image: 'assets/images/ic_doa_pagi_malam.png',
      title: 'Doâ€™a Sebelum Tidur',
      arabicText: 'Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø¨ÙØ§Ø³Ù’Ù…ÙÙƒÙŽ Ø£ÙŽÙ…ÙÙˆØªÙ ÙˆÙŽØ£ÙŽØ­Ù’ÙŠÙŽØ§',
      translation: 'Ya Allah, dengan nama-Mu aku mati dan aku hidup.',
      reference: 'Hadist Riwayat Bukhari',
    ),
    Doa(
      image: 'assets/images/ic_doa_pagi_malam.png',
      title: 'Doâ€™a Bangun Tidur',
      arabicText:
          'Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡Ù Ø§Ù„Ù‘ÙŽØ°ÙÙŠ Ø£ÙŽØ­Ù’ÙŠÙŽØ§Ù†ÙŽØ§ Ø¨ÙŽØ¹Ù’Ø¯ÙŽ Ù…ÙŽØ§ Ø£ÙŽÙ…ÙŽØ§ØªÙŽÙ†ÙŽØ§ ÙˆÙŽØ¥ÙÙ„ÙŽÙŠÙ’Ù‡Ù Ø§Ù„Ù†Ù‘ÙØ´ÙÙˆØ±Ù',
      translation:
          'Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami, dan kepada-Nya kami akan dibangkitkan.',
      reference: 'Hadist Riwayat Bukhari',
    ),
    Doa(
      image: 'assets/images/ic_doa_pagi_malam.png',
      title: 'Doâ€™a Apabila Ada Yang Menakutkan Dalam Tidur',
      arabicText:
          'Ø£ÙŽØ¹ÙÙˆØ°Ù Ø¨ÙÙƒÙŽÙ„ÙÙ…ÙŽØ§ØªÙ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù Ø§Ù„ØªÙ‘ÙŽØ§Ù…Ù‘ÙŽØ§ØªÙ Ù…ÙÙ†Ù’ ØºÙŽØ¶ÙŽØ¨ÙÙ‡Ù ÙˆÙŽØ¹ÙÙ‚ÙŽØ§Ø¨ÙÙ‡ÙØŒ ÙˆÙŽØ´ÙŽØ±Ù‘Ù Ø¹ÙØ¨ÙŽØ§Ø¯ÙÙ‡ÙØŒ ÙˆÙŽÙ…ÙÙ†Ù’ Ù‡ÙŽÙ…ÙŽØ²ÙŽØ§ØªÙ Ø§Ù„Ø´Ù‘ÙŽÙŠÙŽØ§Ø·ÙÙŠÙ†Ù ÙˆÙŽØ£ÙŽÙ†Ù’ ÙŠÙŽØ­Ù’Ø¶ÙØ±ÙÙˆÙ†Ù',
      translation:
          'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari kemurkaan-Nya, hukuman-Nya, kejahatan hamba-hamba-Nya, godaan setan, dan agar mereka tidak mendatangiku.',
      reference: 'Hadist Riwayat Abu Dawud dan Shahih At-Tirmidzi',
    ),
  ],
  DoaCategory.rumah: [
    Doa(
      image: 'assets/images/ic_doa_rumah.png',
      title: 'Doâ€™a Berpakaian',
      arabicText:
          'Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘Ù‡Ù Ø§Ù„Ù‘ÙŽØ°ÙÙŠ ÙƒÙŽØ³ÙŽØ§Ù†ÙÙŠ Ù‡ÙŽØ°ÙŽØ§ (Ø§Ù„Ø«Ù‘ÙŽÙˆÙ’Ø¨ÙŽ) ÙˆÙŽØ±ÙŽØ²ÙŽÙ‚ÙŽÙ†ÙÙŠÙ‡Ù Ù…ÙÙ†Ù’ ØºÙŽÙ€ÙŠÙ€Ù’Ø±Ù Ø­ÙŽÙˆÙ’Ù„Ù Ù…ÙÙ†Ù‘ÙÙŠ ÙˆÙŽÙ„ÙŽØ§ Ù‚ÙÙ€ÙˆÙ‘ÙŽØ©Ù',
      translation:
          'Segala puji bagi Allah Yang telah memberikan pakaian ini kepadaku sebagai rezeki dari-Nya tanpa daya dan kekuatan dariku.',
      reference: 'Hadist Riwayat Bukhari, Muslim, Ibnu Majah, dan At-Tirmidzi',
    ),
    Doa(
      image: 'assets/images/ic_doa_rumah.png',
      title: 'Doâ€™a Masuk WC',
      arabicText:
          'Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù. Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ€Ù…Ù‘ÙŽ Ø¥ÙÙ†Ù‘ÙÙŠ Ø£ÙŽØ¹ÙÙ€ÙˆØ°Ù Ø¨ÙÙ€ÙƒÙŽ Ù…ÙÙ€Ù†ÙŽ Ø§Ù„Ù’Ø®ÙÙ€Ø¨Ù’Ø«Ù ÙˆÙŽØ§Ù„Ù’Ø®ÙŽØ¨ÙŽØ§Ø¦ÙØ«Ù',
      translation:
          'Dengan nama Allah. Ya Allah, sesungguhnya aku berlindung kepada-Mu dari godaan setan laki-laki dan perempuan.',
      reference: 'Hadist Riwayat Bukhari dan Fathul Bari',
    ),
    Doa(
      image: 'assets/images/ic_doa_rumah.png',
      title: 'Doâ€™a Keluar WC',
      arabicText: 'ØºÙÙÙ’Ø±ÙŽØ§Ù†ÙŽÙƒÙŽ',
      translation: 'Aku memohon ampun kepada-Mu.',
      reference:
          'Hadist Riwayat Abu Dawud, Ibnu Majah, At-Tirmidzi, An-Nasa\'i, dan Zadul Ma\'ad karya Ibnul Qayyim',
    ),
    Doa(
      image: 'assets/images/ic_doa_rumah.png',
      title: 'Doâ€™a Masuk Rumah',
      arabicText:
          'Ø¨ÙØ³Ù’Ù€Ù…Ù Ø§Ù„Ù„Ù‘Ù‡Ù ÙˆÙŽÙ„ÙŽØ¬Ù’Ù†Ù€ÙŽØ§ØŒ ÙˆÙŽØ¨ÙØ³Ù’Ù€Ù…Ù Ø§Ù„Ù„Ù‘Ù‡Ù Ø®ÙŽÙ€Ø±ÙŽØ¬Ù’Ù†Ù€ÙŽØ§ØŒ ÙˆÙŽØ¹ÙŽÙ„ÙŽÙ€Ù‰ Ø±ÙŽØ¨Ù‘ÙÙ†Ù€ÙŽØ§ ØªÙŽÙˆÙŽÙƒÙ‘ÙŽÙ„Ù’Ù€Ù†ÙŽØ§',
      translation:
          'Dengan nama Allah kami masuk, dengan nama Allah kami keluar, dan kepada Rabb kami, kami bertawakal. Kemudian mengucapkan salam kepada keluarga.',
      reference: 'Hadist Riwayat Abu Dawud',
    ),
    Doa(
      image: 'assets/images/ic_doa_rumah.png',
      title: 'Doâ€™a Keluar Rumah',
      arabicText:
          'Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù ØªÙŽÙˆÙŽÙƒÙ‘ÙŽÙ„Ù’ØªÙ Ø¹ÙŽÙ„ÙŽÙ‰ Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙØŒ ÙˆÙŽÙ„Ø§ÙŽ Ø­ÙŽÙˆÙ’Ù„ÙŽ ÙˆÙŽÙ„Ø§ÙŽ Ù‚ÙÙˆÙ‘ÙŽØ©ÙŽ Ø¥ÙÙ„Ø§Ù‘ÙŽ Ø¨ÙØ§Ù„Ù„Ù‘ÙŽÙ‡Ù',
      translation:
          'Dengan nama Allah (aku keluar). Aku bertawakal kepada-Nya, dan tidak ada daya serta kekuatan kecuali dengan pertolongan Allah.',
      reference:
          'Hadist Riwayat Abu Dawud, At-Tirmidzi, Al-Albani, dan Shahih At-Tirmidzi',
    ),
  ],
  DoaCategory.perjalanan: [
    Doa(
      image: 'assets/images/ic_doa_perjalanan.png',
      title: 'Doâ€™a Naik Kendaraan',
      arabicText:
          'Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù ÙˆÙŽØ§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡ÙØŒ Ø³ÙØ¨Ù’Ø­ÙŽØ§Ù†ÙŽ Ø§Ù„Ù‘ÙŽØ°ÙÙŠ Ø³ÙŽØ®Ù‘ÙŽØ±ÙŽ Ù„ÙŽÙ†ÙŽØ§ Ù‡ÙŽØ°ÙŽØ§ ÙˆÙŽÙ…ÙŽØ§ ÙƒÙÙ†Ù‘ÙŽØ§ Ù„ÙŽÙ‡Ù Ù…ÙÙ‚Ù’Ø±ÙÙ†ÙÙŠÙ†ÙŽØŒ ÙˆÙŽØ¥ÙÙ†Ù‘ÙŽØ§ Ø¥ÙÙ„ÙŽÙ‰ Ø±ÙŽØ¨Ù‘ÙÙ†ÙŽØ§ Ù„ÙŽÙ…ÙÙ†Ù’Ù‚ÙŽÙ„ÙØ¨ÙÙˆÙ†ÙŽØŒ Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡ÙØŒ Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡ÙØŒ Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡ÙØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù Ø£ÙŽÙƒÙ’Ø¨ÙŽØ±ÙØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù Ø£ÙŽÙƒÙ’Ø¨ÙŽØ±ÙØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù Ø£ÙŽÙƒÙ’Ø¨ÙŽØ±ÙØŒ Ø³ÙØ¨Ù’Ø­ÙŽØ§Ù†ÙŽÙƒÙŽ Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø¥ÙÙ†Ù‘ÙÙŠ Ø¸ÙŽÙ„ÙŽÙ…Ù’ØªÙ Ù†ÙŽÙÙ’Ø³ÙÙŠ ÙÙŽØ§ØºÙ’ÙÙØ±Ù’ Ù„ÙÙŠØŒ ÙÙŽØ¥ÙÙ†Ù‘ÙŽÙ‡Ù Ù„ÙŽØ§ ÙŠÙŽØºÙ’ÙÙØ±Ù Ø§Ù„Ø°Ù‘ÙÙ†ÙÙˆØ¨ÙŽ Ø¥ÙÙ„Ù‘ÙŽØ§ Ø£ÙŽÙ†Ù’ØªÙŽ',
      translation:
          'Dengan nama Allah. Segala puji bagi Allah. Maha Suci Allah yang telah menundukkan kendaraan ini untuk kami, padahal sebelumnya kami tidak mampu menguasainya. Sesungguhnya kami akan kembali kepada Rabb kami. Segala puji bagi Allah (3x). Allah Maha Besar (3x). Maha Suci Engkau, ya Allah. Sesungguhnya aku telah menzalimi diriku sendiri, maka ampunilah aku. Sesungguhnya tidak ada yang dapat mengampuni dosa selain Engkau.',
      reference: 'Hadist Riwayat Abu Dawud dan At-Tirmidzi',
    ),
    Doa(
      image: 'assets/images/ic_doa_perjalanan.png',
      title: 'Doâ€™a Masuk Pasar',
      arabicText:
          'Ù„ÙŽØ§ Ø¥ÙÙ„ÙŽÙ‡ÙŽ Ø¥ÙÙ„Ù‘ÙŽØ§ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù ÙˆÙŽØ­Ù’Ø¯ÙŽÙ‡Ù Ù„ÙŽØ§ Ø´ÙŽØ±ÙÙŠÙƒÙŽ Ù„ÙŽÙ‡ÙØŒ Ù„ÙŽÙ‡Ù Ø§Ù„Ù’Ù…ÙÙ„Ù’ÙƒÙ ÙˆÙŽÙ„ÙŽÙ‡Ù Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯ÙØŒ ÙŠÙØ­Ù’ÙŠÙÙŠ ÙˆÙŽÙŠÙÙ…ÙÙŠØªÙ ÙˆÙŽÙ‡ÙÙˆÙŽ Ø­ÙŽÙŠÙ‘ÙŒ Ù„ÙŽØ§ ÙŠÙŽÙ…ÙÙˆØªÙØŒ Ø¨ÙÙŠÙŽØ¯ÙÙ‡Ù Ø§Ù„Ù’Ø®ÙŽÙŠÙ’Ø±Ù ÙˆÙŽÙ‡ÙÙˆÙŽ Ø¹ÙŽÙ„ÙŽÙ‰ ÙƒÙÙ„Ù‘Ù Ø´ÙŽÙŠÙ’Ø¡Ù Ù‚ÙŽØ¯ÙÙŠØ±ÙŒ',
      translation:
          'Tidak ada Tuhan yang berhak disembah selain Allah Yang Maha Esa, tiada sekutu bagi-Nya. Milik-Nya segala kerajaan dan segala puji. Dia menghidupkan dan mematikan. Dia Maha Hidup dan tidak akan mati. Di tangan-Nya segala kebaikan dan Dia Maha Kuasa atas segala sesuatu.',
      reference: 'Hadist Riwayat At-Tirmidzi dan Al-Hakim',
    ),
    Doa(
      image: 'assets/images/ic_doa_perjalanan.png',
      title: 'Doâ€™a Musafir Kepada Orang Yang Ditinggalkan',
      arabicText: 'Ø£ÙŽØ³Ù’ØªÙŽÙˆÙ’Ø¯ÙØ¹ÙÙƒÙÙ…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙŽ Ø§Ù„Ù‘ÙŽØ°ÙÙŠ Ù„ÙŽØ§ ØªÙŽØ¶ÙÙŠØ¹Ù ÙˆÙŽØ¯ÙŽØ§Ø¦ÙØ¹ÙÙ‡Ù',
      translation:
          'Aku menitipkan kalian kepada Allah yang tidak akan menyia-nyiakan titipan-Nya.',
      reference: 'Hadist Riwayat Ahmad dan Ibnu Majah',
    ),
    Doa(
      image: 'assets/images/ic_doa_perjalanan.png',
      title: 'Doâ€™a Orang Muqim Kepada Musafir',
      arabicText:
          'Ø£ÙŽØ³Ù’ØªÙŽÙˆÙ’Ø¯ÙØ¹Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙŽ Ø¯ÙÙŠÙ†ÙŽÙƒÙŽØŒ ÙˆÙŽØ£ÙŽÙ…ÙŽØ§Ù†ÙŽØªÙŽÙƒÙŽØŒ ÙˆÙŽØ®ÙŽÙˆÙŽØ§ØªÙÙŠÙ…ÙŽ Ø¹ÙŽÙ…ÙŽÙ„ÙÙƒÙŽ',
      translation:
          'Aku menitipkan agama, amanah, dan penutup amalmu kepada Allah.',
      reference: 'Hadist Riwayat Ahmad dan At-Tirmidzi',
    ),
  ],
  DoaCategory.sholat: [
    Doa(
      image: 'assets/images/ic_doa_sholat.png',
      title: 'Doâ€™a Sebelum Wudhu',
      arabicText: 'Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù',
      translation: 'Dengan nama Allah (aku berwudhu).',
      reference: 'Hadist Riwayat Abu Dawud, Ibnu Majah, dan Irwa\'ul Ghalil',
    ),
    Doa(
      image: 'assets/images/ic_doa_sholat.png',
      title: 'Doâ€™a Setelah Wudhu',
      arabicText:
          'Ø£ÙŽØ´Ù’Ù‡ÙŽØ¯Ù Ø£ÙŽÙ†Ù’ Ù„ÙŽØ§ Ø¥ÙÙ„ÙŽÙ€Ù‡ÙŽ Ø¥ÙÙ„Ù‘ÙŽØ§ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù ÙˆÙŽØ­Ù’Ø¯ÙŽÙ‡Ù Ù„ÙŽØ§ Ø´ÙŽØ±ÙÙŠÙƒÙŽ Ù„ÙŽÙ‡ÙØŒ ÙˆÙŽØ£ÙŽØ´Ù’Ù‡ÙŽØ¯Ù Ø£ÙŽÙ†Ù‘ÙŽ Ù…ÙØ­ÙŽÙ…Ù‘ÙŽØ¯Ù‹Ø§ Ø¹ÙŽØ¨Ù’Ø¯ÙÙ‡Ù ÙˆÙŽØ±ÙŽØ³ÙÙˆÙ„ÙÙ‡ÙØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø§Ø¬Ù’Ø¹ÙŽÙ„Ù’Ù†ÙÙŠ Ù…ÙÙ†ÙŽ Ø§Ù„ØªÙ‘ÙŽÙˆÙ‘ÙŽØ§Ø¨ÙÙŠÙ†ÙŽ ÙˆÙŽØ§Ø¬Ù’Ø¹ÙŽÙ„Ù’Ù†ÙÙŠ Ù…ÙÙ†ÙŽ Ø§Ù„Ù’Ù…ÙØªÙŽØ·ÙŽÙ‡Ù‘ÙØ±ÙÙŠÙ†ÙŽ',
      translation:
          'Aku bersaksi bahwa tidak ada Tuhan yang berhak disembah selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya. Aku bersaksi bahwa Muhammad adalah hamba dan utusan-Nya. Ya Allah, jadikanlah aku termasuk orang-orang yang bertaubat dan jadikanlah aku termasuk orang-orang yang bersuci.',
      reference:
          'Hadist Riwayat Muslim, At-Tirmidzi, Al-Albani, dan Shahih At-Tirmidzi',
    ),
    Doa(
      image: 'assets/images/ic_doa_sholat.png',
      title: 'Doâ€™a Masuk Masjid',
      arabicText:
          'Ø£ÙŽØ¹ÙÙˆØ°Ù Ø¨ÙØ§Ù„Ù„Ù‘ÙŽÙ‡Ù Ø§Ù„Ù’Ø¹ÙŽØ¸ÙÙŠÙ…ÙØŒ ÙˆÙŽØ¨ÙÙˆÙŽØ¬Ù’Ù‡ÙÙ‡Ù Ø§Ù„Ù’ÙƒÙŽØ±ÙÙŠÙ…ÙØŒ ÙˆÙŽØ³ÙÙ„Ù’Ø·ÙŽØ§Ù†ÙÙ‡Ù Ø§Ù„Ù’Ù‚ÙŽØ¯ÙÙŠÙ…ÙØŒ Ù…ÙÙ†ÙŽ Ø§Ù„Ø´Ù‘ÙŽÙŠÙ’Ø·ÙŽØ§Ù†Ù Ø§Ù„Ø±Ù‘ÙŽØ¬ÙÙŠÙ…ÙØŒ Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙØŒ ÙˆÙŽØ§Ù„ØµÙ‘ÙŽÙ„ÙŽØ§Ø©Ù ÙˆÙŽØ§Ù„Ø³Ù‘ÙŽÙ„ÙŽØ§Ù…Ù Ø¹ÙŽÙ„ÙŽÙ‰ Ø±ÙŽØ³ÙÙˆÙ„Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø§ÙÙ’ØªÙŽØ­Ù’ Ù„ÙÙŠ Ø£ÙŽØ¨Ù’ÙˆÙŽØ§Ø¨ÙŽ Ø±ÙŽØ­Ù’Ù…ÙŽØªÙÙƒÙŽ',
      translation:
          'Aku berlindung kepada Allah Yang Maha Agung, dengan wajah-Nya Yang Mulia dan kekuasaan-Nya yang abadi, dari setan yang terkutuk. Dengan nama Allah, semoga shalawat dan salam tercurah kepada Rasulullah. Ya Allah, bukakanlah pintu-pintu rahmat-Mu untukku.',
      reference:
          'Hadist Riwayat Abu Dawud, Jami\' As-Saghir, Ibnu As-Sunni, Muslim, dan Ibnu Majah',
    ),
    Doa(
      image: 'assets/images/ic_doa_sholat.png',
      title: 'Doâ€™a Keluar Masjid',
      arabicText:
          'Ø¨ÙØ³Ù’Ù…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙØŒ ÙˆÙŽØ§Ù„ØµÙ‘ÙŽÙ„ÙŽØ§Ø©Ù ÙˆÙŽØ§Ù„Ø³Ù‘ÙŽÙ„ÙŽØ§Ù…Ù Ø¹ÙŽÙ„ÙŽÙ‰ Ø±ÙŽØ³ÙÙˆÙ„Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø¥ÙÙ†Ù‘ÙÙŠ Ø£ÙŽØ³Ù’Ø£ÙŽÙ„ÙÙƒÙŽ Ù…ÙÙ†Ù’ ÙÙŽØ¶Ù’Ù„ÙÙƒÙŽØŒ Ø§Ù„Ù„Ù‘ÙŽÙ‡ÙÙ…Ù‘ÙŽ Ø§Ø¹Ù’ØµÙÙ…Ù’Ù†ÙÙŠ Ù…ÙÙ†ÙŽ Ø§Ù„Ø´Ù‘ÙŽÙŠÙ’Ø·ÙŽØ§Ù†Ù Ø§Ù„Ø±Ù‘ÙŽØ¬ÙÙŠÙ…Ù',
      translation:
          'Dengan nama Allah. Semoga shalawat dan salam tercurah kepada Rasulullah. Ya Allah, sesungguhnya aku memohon karunia-Mu. Ya Allah, lindungilah aku dari godaan setan yang terkutuk.',
      reference:
          'Hadist Riwayat Abu Dawud, Shahih Al-Jami\', Muslim, dan Shahih Ibnu Majah',
    ),
  ],
  DoaCategory.etikaBaik: [
    Doa(
      image: 'assets/images/ic_doa_etika_baik.png',
      title: 'Doâ€™a Ketika Bersin',
      arabicText:
          '(1) Ø§Ù„Ù’Ø­ÙŽÙ…Ù’Ø¯Ù Ù„ÙÙ„Ù‘ÙŽÙ‡Ù\n(2) ÙŠÙŽØ±Ù’Ø­ÙŽÙ…ÙÙƒÙŽ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù\n(3) ÙŠÙŽÙ‡Ù’Ø¯ÙÙŠÙƒÙÙ…Ù Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù ÙˆÙŽÙŠÙØµÙ’Ù„ÙØ­Ù Ø¨ÙŽØ§Ù„ÙŽÙƒÙÙ…Ù’',
      translation:
          'Rasulullah ï·º bersabda: Apabila salah seorang di antara kalian bersin, hendaklah ia mengucapkan "Alhamdulillah". Kemudian saudaranya mengucapkan "Yarhamukallah". Setelah itu orang yang bersin menjawab "Yahdikumullahu wa yushlihu balakum".',
      reference: 'Hadist Riwayat Bukhari',
    ),
    Doa(
      image: 'assets/images/ic_doa_etika_baik.png',
      title: 'Doâ€™a Ketika Marah',
      arabicText: 'Ø£ÙŽØ¹ÙÙˆØ°Ù Ø¨ÙØ§Ù„Ù„Ù‘ÙŽÙ‡Ù Ù…ÙÙ†ÙŽ Ø§Ù„Ø´Ù‘ÙŽÙŠÙ’Ø·ÙŽØ§Ù†Ù Ø§Ù„Ø±Ù‘ÙŽØ¬ÙÙŠÙ…Ù',
      translation:
          'Aku berlindung kepada Allah dari godaan setan yang terkutuk.',
      reference: 'Hadist Riwayat Bukhari dan Muslim',
    ),
    Doa(
      image: 'assets/images/ic_doa_etika_baik.png',
      title: 'Doâ€™a Dalam Majelis',
      arabicText:
          'Ø±ÙŽØ¨Ù‘Ù Ø§ØºÙ’ÙÙØ±Ù’ Ù„ÙÙŠ ÙˆÙŽØªÙØ¨Ù’ Ø¹ÙŽÙ„ÙŽÙŠÙ‘ÙŽ Ø¥ÙÙ†Ù‘ÙŽÙƒÙŽ Ø£ÙŽÙ†Ù’ØªÙŽ Ø§Ù„ØªÙ‘ÙŽÙˆÙ‘ÙŽØ§Ø¨Ù Ø§Ù„Ù’ØºÙŽÙÙÙˆØ±Ù',
      translation:
          'Ya Rabbku, ampunilah aku dan terimalah taubatku. Sesungguhnya Engkau Maha Penerima Taubat lagi Maha Pengampun. (Dibaca seratus kali sebelum berdiri dari majelis).',
      reference: 'Hadist Riwayat Ibnu Majah dan Shahih At-Tirmidzi',
    ),
    Doa(
      image: 'assets/images/ic_doa_etika_baik.png',
      title: 'Doâ€™a Untuk Orang Yang Berbuat Baik Kepadamu',
      arabicText: 'Ø¬ÙŽØ²ÙŽØ§ÙƒÙŽ Ø§Ù„Ù„Ù‘ÙŽÙ‡Ù Ø®ÙŽÙŠÙ’Ø±Ù‹Ø§',
      translation: 'Semoga Allah membalasmu dengan kebaikan.',
      reference: 'Hadist Riwayat At-Tirmidzi',
    ),
  ],
};

