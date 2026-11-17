import 'package:bitaqwa/kajian_online/video_data.dart';
import 'package:flutter/material.dart';
import 'package:bitaqwa/kajian_online/color_constant.dart';
import 'package:bitaqwa/kajian_online/detail_video_kajian_screen.dart';

// SCREEN VIDEO KAJIAN: Menampilkan daftar video ceramah islami yang siap diputar
class VideoKajianScreen extends StatelessWidget {
  const VideoKajianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bilah judul AppBar
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          'Video Kajian',
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
      // ListView.builder: Menampilkan daftar kartu video kajian
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return GestureDetector(
            // Saat kartu video disentuh, buka pemutar video DetailVideoKajianScreen
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailVideoKajianScreen(
                    url: video.videoId,
                    account: video.account,
                    ustadz: video.ustadz,
                    title: video.title,
                    description: video.description,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar thumbnail video dengan ikon tombol Play di tengah
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          video.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        top: 0,
                        left: 0,
                        child: Icon(
                          Icons.play_circle_outline,
                          color: ColorConstant.colorPrimary,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  // Nama Akun Pengunggah Video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      video.account,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'PoppinsRegular',
                      ),
                    ),
                  ),
                  // Nama Ustadz / Penceramah
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      video.ustadz,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstant.colorPrimary,
                        fontFamily: 'PoppinsMedium',
                      ),
                    ),
                  ),
                  // Judul Video Kajian
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      video.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
