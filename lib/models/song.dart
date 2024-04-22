import 'package:musicanto/models/artist.dart';

class Song {
  final int id;
  final String name;
  final Artist artist;
  final String type;
  final double price;
  final String thumbnailUrl;
  final String url;

  Song(this.id, this.name, this.artist, this.type, this.price,
      this.thumbnailUrl, this.url);

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        json['id'] as int,
        json['title'] as String,
        Artist.fromJson(json['artist'] as Map<String, dynamic>),
        json['type'] as String,
        json['price']?.toDouble() ?? 0.0, // Handle null price gracefully
        "assets/images/1.jpg",
        "assets/music/music_01.mp3",
      );
}
