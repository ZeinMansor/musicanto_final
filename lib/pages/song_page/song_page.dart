import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_page_controller.dart';
import 'widget/backgroundfilter.dart';
import 'widget/music_player.dart';

class SongPage extends GetView<HomePageController> {
  const SongPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            controller.songs[0].thumbnailUrl,
            fit: BoxFit.cover,
          ),
          const BackGroundFilter(),
          const MusicPlayer()
        ],
      ),
    );
  }
}
