import 'package:flutter/material.dart';
import 'package:mentorow_app/constants/paths.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        if (mounted) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        }
      })
      ..setVolume(1.0)
      ..addListener(() {
        if (mounted) {
          if (_controller.value.isPlaying) {
            controls = GestureDetector(
              onTap: () {
                if (mounted) {
                  setState(() {
                    _controller.pause();
                  });
                }
              },
              child: Opacity(
                opacity: 0,
                child: Image.asset(
                  pauseIcon,
                  height: 50,
                ),
              ),
            );
          } else if (_controller.value.position.inMilliseconds -
                  _controller.value.duration.inMilliseconds <
              1) {
            setState(() {
              controls = GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      _controller.play();
                    });
                  }
                },
                child: Image.asset(
                  playIcon,
                  height: 50,
                ),
              );
            });
          } else {
            controls = GestureDetector(
              onTap: () {
                if (mounted) {
                  setState(() {
                    _controller.play();
                  });
                }
              },
              child: Image.asset(
                playIcon,
                height: 50,
              ),
            );
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            _controller,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [controls ?? Container()],
            ),
          )
        ],
      ),
    );
  }
}
