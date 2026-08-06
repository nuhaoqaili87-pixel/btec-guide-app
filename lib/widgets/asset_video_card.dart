import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../theme/app_theme.dart';

/// مشغّل فيديو بسيط لأصول محلية (assets)، بعنصر تشغيل/إيقاف مؤقت فوق الفيديو.
class AssetVideoCard extends StatefulWidget {
  final String assetPath;
  final String caption;

  const AssetVideoCard({super.key, required this.assetPath, required this.caption});

  @override
  State<AssetVideoCard> createState() => _AssetVideoCardState();
}

class _AssetVideoCardState extends State<AssetVideoCard> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath);
    _controller.initialize().then((_) {
      if (mounted) setState(() => _initialized = true);
    }).catchError((_) {
      if (mounted) setState(() => _failed = true);
    });
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (!_initialized) return;
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: _initialized ? _controller.value.aspectRatio : 9 / 16,
            child: Container(
              color: Colors.black,
              child: _failed
                  ? const Center(child: Icon(Icons.videocam_off_rounded, color: Colors.white38, size: 40))
                  : !_initialized
                      ? const Center(child: CircularProgressIndicator(color: AppColors.gold))
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            VideoPlayer(_controller),
                            GestureDetector(
                              onTap: _togglePlay,
                              child: AnimatedOpacity(
                                opacity: _controller.value.isPlaying ? 0 : 1,
                                duration: const Duration(milliseconds: 200),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(999)),
                                  child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow_rounded, color: Colors.white, size: 34),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: VideoProgressIndicator(_controller, allowScrubbing: true, colors: const VideoProgressColors(playedColor: AppColors.gold)),
                            ),
                          ],
                        ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.tealDim, borderRadius: BorderRadius.circular(999)),
                  child: const Text('قصة نجاح — فعالية BTEC × Pearson', style: TextStyle(color: AppColors.teal, fontSize: 11.5, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 10),
                Text(widget.caption, style: const TextStyle(color: AppColors.muted, fontSize: 13.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
