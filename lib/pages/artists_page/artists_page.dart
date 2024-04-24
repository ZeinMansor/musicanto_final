import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/artists_controller.dart';
import 'widget/add_artist_form.dart';
import 'widget/artist_list.dart';

class ArtistManagementPage extends StatelessWidget {
  const ArtistManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    ArtistsController controller = Get.put(ArtistsController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Manage Artists",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [AddArtistForm(), ArtistList()],
        ),
      ),
    );
  }
}
