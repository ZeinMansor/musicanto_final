import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_page_controller.dart';
import '../../../widgets/seek_bar.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayer extends GetView<HomePageController> {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<SeekBarData>(
              stream: controller.seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChangeEnd: controller.audioPlayer.seek,
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // StreamBuilder(stream: stream, builder: builder),

              StreamBuilder(
                  stream: controller.audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final playerState = snapshot.data;
                      final processingState = playerState!.processingState;

                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return Container(
                          width: 64.0,
                          height: 64.0,
                          margin: const EdgeInsets.all(10.0),
                          child: const CircularProgressIndicator(),
                        );
                      } else if (!controller.audioPlayer.playing) {
                        return IconButton(
                            onPressed: controller.audioPlayer.play,
                            iconSize: 75,
                            icon: const Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ));
                      } else if (processingState != ProcessingState.completed) {
                        return IconButton(
                            onPressed: controller.audioPlayer.pause,
                            iconSize: 75,
                            icon: const Icon(
                              Icons.pause_circle,
                              color: Colors.white,
                            ));
                      } else {
                        return IconButton(
                            onPressed: () => controller.audioPlayer.seek(
                                Duration.zero,
                                index: controller
                                    .audioPlayer.effectiveIndices!.first),
                            iconSize: 75,
                            icon: const Icon(
                              Icons.replay_circle_filled_outlined,
                              color: Colors.white,
                            ));
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
            ],
          )
        ],
      ),
    );
  }
}
