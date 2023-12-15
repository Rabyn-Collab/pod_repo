import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class PlayVideoFromNetwork extends StatefulWidget {
  final String idKey;
  const PlayVideoFromNetwork({Key? key, required this.idKey}) ;

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        'https://youtu.be/${widget.idKey}',
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  PodVideoPlayer(controller: controller);
  }
}
