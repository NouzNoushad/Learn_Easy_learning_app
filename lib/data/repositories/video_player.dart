import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerRepository {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  Future<void>? initializeVideoPlayerFuture;
  late Widget playerWidget;
  int selectedIndex = 0;

  initPlayer(String videoUrl) {
    videoPlayerController?.pause();
    chewieController?.pause();
    videoPlayerController?.dispose();
    chewieController?.dispose();
    debugPrint('//////////// videoUrl: $videoUrl');
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    initializeVideoPlayerFuture =
        videoPlayerController?.initialize().then((value) {});
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
      looping: true,
      // autoInitialize: true,
      aspectRatio: 16 / 9,
      placeholder: const Center(child: CircularProgressIndicator()),
      materialProgressColors: ChewieProgressColors(playedColor: Colors.white),
    );
    playerWidget = Chewie(
      controller: chewieController!,
    );
  }
}
