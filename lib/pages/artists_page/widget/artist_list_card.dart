import 'package:flutter/material.dart';
import 'package:musicanto/controllers/artists_controller.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/models/playlist.dart';

class ArtistListCard extends StatelessWidget {
  const ArtistListCard({
    super.key,
    required this.artists,
  });

  final Artist artists;

  @override
  Widget build(BuildContext context) {
    ArtistsController controller = ArtistsController();
    return InkWell(
      onTap: () {
        print("Navigate to playlist page");
        // Get.toNamed("/")
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${artists.firstName} ${artists.lastName}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    artists.country,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.deleteArtist(artists.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
