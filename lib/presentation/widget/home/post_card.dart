import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:machine_video/data/model/post_model.dart';
import 'package:machine_video/presentation/logic/video_provider.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.width,
    required this.textTheme, required this.post,
  });

  final double width;
  final TextTheme textTheme;

  final PostModel post;
  @override
  Widget build(BuildContext context) {
    String videoUrl =
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

    final prov = Provider.of<VideoProvider>(context);
    prov.intiVideo(context: context, videoUrl: videoUrl, thumbnail: '');
    return Container(
      height: width / 0.9,
      // color: Colors.grey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: _UserArea(textTheme: textTheme),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: width / 1.5,
              color: Colors.red,
              // child: CustomVideoPlayer(
              //   customVideoPlayerController: prov.customVideoPlayerController,
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: width / 5,
              width: width,
              // color: Colors.red,
              child: Text(
                'descriptions',
                style: textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserArea extends StatelessWidget {
  const _UserArea({
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name', style: textTheme.bodyMedium?.copyWith(fontSize: 12.5)),
            const SizedBox(height: 5),
            Text(
              'days',
              style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade400),
            ),
          ],
        ),
      ],
    );
  }
}
