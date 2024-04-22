import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/artists_controller.dart';
import 'artist_list_card.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArtistsController>(builder: (controller) {
      return FutureBuilder(
          future: controller.getArtists(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Padding(
                padding:
                    const EdgeInsets.all(8.0), // Add padding for better spacing
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return ArtistListCard(artists: snapshot.data![index]);
                  }),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          });
    });
  }
}
