import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:bitaqwa/kajian_online/color_constant.dart';

// SCREEN DETAIL VIDEO KAJIAN: Memutar video YouTube langsung di dalam aplikasi
class DetailVideoKajianScreen extends StatefulWidget {
  final String url;
  final String account;
  final String ustadz;
  final String title;
  final String description;

  const DetailVideoKajianScreen({
    super.key,
    required this.url,
    required this.account,
    required this.ustadz,
    required this.title,
    required this.description,
  });

  @override
  State<DetailVideoKajianScreen> createState() =>
      _DetailVideoKajianScreenState();
}

class _DetailVideoKajianScreenState extends State<DetailVideoKajianScreen> {
  // Kontroler pemutar YouTube
  late final YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    // 1. Mengubah URL YouTube menjadi Video ID (misal: "kOnZ_Jv_C6k")
    final videoId = YoutubePlayerController.convertUrlToId(widget.url);

    if (videoId == null) {
      throw Exception("URL Youtube tidak valid : \${widget.url}");
    }

    // 2. Konfigurasi kontroler YouTube player
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        enableJavaScript: true,
        strictRelatedVideos: true,
      ),
    );

    // 3. Listener saat video siap dimainkan
    _controller.listen((value) {
      if (!_isPlayerReady && value.playerState != PlayerState.unknown) {
        setState(() {
          _isPlayerReady = true;
        });
      }
    });

    // 4. Memuat video berdasarkan videoId
    _controller.loadVideoById(videoId: videoId);
  }

  @override
  void dispose() {
    // Menutup pemutar saat keluar dari layar agar memori HP bersih
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.colorPrimary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstant.colorWhite,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: ColorConstant.colorWhite,
              fontFamily: "PoppinsMedium",
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(controller: _controller),
              if (!_isPlayerReady) const LinearProgressIndicator(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.account,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontFamily: "PoppinsRegular",
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.ustadz,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "PoppinsMedium",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    fontFamily: "PoppinsRegular",
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

