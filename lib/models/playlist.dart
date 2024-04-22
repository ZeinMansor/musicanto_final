import 'package:musicanto/models/song.dart';

class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;
  final String description;

  PlayList(
      {required this.title,
      required this.songs,
      required this.description,
      required this.imageUrl});
}
