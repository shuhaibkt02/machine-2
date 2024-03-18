import 'package:flutter/material.dart';
import 'package:machine_video/presentation/logic/post_provider.dart';
import 'package:machine_video/utils/constant.dart';
import 'package:provider/provider.dart';

class OpenFileWidget extends StatelessWidget {
  final TextTheme textTheme;
  final VoidCallback onTap;
  final bool video;

  const OpenFileWidget({
    super.key,
    required this.textTheme,
    required this.onTap,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: (video)
          ? _VideoPicker(textTheme: textTheme)
          : _ThumbnailPicker(textTheme: textTheme),
    );
  }
}

class _ThumbnailPicker extends StatelessWidget {
  const _ThumbnailPicker({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PostProvider>(context);
    final thumbnail = prov.thumnailPath;

    return (thumbnail.isNotEmpty)
        ? SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(thumbnail),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_size_select_actual_rounded,
                color: Colors.grey.shade400,
              ),
              const SizedBox(width: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(thumbUpload, style: textTheme.bodySmall),
              ),
            ],
          );
  }
}

class _VideoPicker extends StatelessWidget {
  const _VideoPicker({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PostProvider>(context);
    final videoPath = prov.videoPath;

    return (videoPath.isNotEmpty)
        ? FittedBox(child: Text(videoPath))
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_size_select_actual_rounded,
                color: Colors.grey.shade400,
              ),
              const SizedBox(width: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(thumbUpload, style: textTheme.bodySmall),
              ),
            ],
          );
  }
}
