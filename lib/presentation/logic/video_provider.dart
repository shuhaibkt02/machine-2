import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoProvider extends ChangeNotifier {
  late CustomVideoPlayerController customVideoPlayerController;

  void intiVideo({
    required BuildContext context,
    required String videoUrl,
    required String thumbnail,
  }) {
    CachedVideoPlayerController videoPlayerController;

    videoPlayerController = CachedVideoPlayerController.network(
      videoUrl,
    )..initialize();
    customVideoPlayerController = CustomVideoPlayerController(
      customVideoPlayerSettings:  CustomVideoPlayerSettings(
        thumbnailWidget: Image.network(thumbnail),
        seekDuration: const Duration(seconds: 5),
        showSeekButtons: true,
        showPlayButton: true,
        alwaysShowThumbnailOnVideoPaused: true,
        showDurationPlayed: true,
        showDurationRemaining: true,
        enterFullscreenOnStart: true,
      ),
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }
}
