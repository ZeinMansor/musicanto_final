import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/songs_management_controller.dart';
import 'widget/add_song_form.dart';
import 'widget/songs_list.dart';

class SongManagementPage extends StatelessWidget {
  const SongManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SongsManagementController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Songs",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [AddSongForm(), SongsList()],
        ),
      ),
    );
  }
}
